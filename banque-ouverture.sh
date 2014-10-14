#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage : ./banque-ouverture.sh <repertoire de la banque>";
    exit 1
fi;

repertoire_banque="$1";

if [ ! -d "$repertoire_banque" ]
then
    mkdir -p "$repertoire_banque";
fi;

if [ ! -d "$repertoire_banque" ]
then
    echo "Impossible de créer $repertoire_banque !";
    exit 1
fi

openssl genrsa -out "$repertoire_banque/private.pem" 1024 &>/dev/null;
openssl rsa -in "$repertoire_banque/private.pem" -out "$repertoire_banque/public.pem" -outform PEM -pubout &>/dev/null;

echo "La banque est ouverte aux clients.";

exit 0
