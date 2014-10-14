#!/usr/bin/env bash

if [ $# -ne 3 ]; then
    echo "Usage : ./banque-nouveau-client.sh <repertoire de la banque> <repertoire du client> <nom du client>";
    exit 1
fi;

timestamp=`date +%s`;
repertoire_banque="$1";
repertoire_client="$2";
nom_client="$3";

if [ ! -d "$repertoire_client" ]
then
    mkdir -p "$repertoire_client";
fi;

if [ ! -d "$repertoire_client" ]
then
    echo "Impossible de créer $repertoire_client !";
    exit 1
fi

openssl genrsa -out "$repertoire_client/private.pem" 1024 &>/dev/null;
openssl rsa -in "$repertoire_client/private.pem" -out "$repertoire_client/public.pem" -outform PEM -pubout &>/dev/null;

cle_publique_client=`base64 "$repertoire_client/public.pem"`;

echo "Client : $nom_client" > "/tmp/$timestamp-clair";
echo "Cle publique du client : $cle_publique_client" >> "/tmp/$timestamp-clair";
openssl dgst -sha256 < "/tmp/$timestamp-clair" > "/tmp/$timestamp-hash";
signature_banque=`openssl rsautl -sign -inkey "$repertoire_banque/private.pem" -keyform PEM -in "/tmp/$timestamp-hash" | base64`;

echo "Client : $nom_client" > "$repertoire_client/cheque.entete";
echo "Cle publique du client : $cle_publique_client" >> "$repertoire_client/cheque.entete";
echo "Signature de la banque : $signature_banque" >> "$repertoire_client/cheque.entete";

echo "La client est créé."

exit 0
