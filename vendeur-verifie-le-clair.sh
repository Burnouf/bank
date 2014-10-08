#! /usr/bin/env bash

if [ $# -ne 5 ]; then
    echo "Usage : ./vendeur-verifie-le-clair <cheque> <facture> <emeteur> <ordre> <montant>";
    exit 1
fi;

chemin_du_cheque="$1";
facture=`/bin/grep "Facture : " $chemin_du_cheque | /bin/sed -r 's/^Facture : (.*)$/\1/'`;
emeteur=`/bin/grep "Emeteur : " $chemin_du_cheque | /bin/sed -r 's/^Emeteur : (.*)$/\1/'`;
ordre=`/bin/grep "Ordre : " $chemin_du_cheque | /bin/sed -r 's/^Ordre : (.*)$/\1/'`;
montant=`/bin/grep "Montant : " $chemin_du_cheque | /bin/sed -r 's/^Montant : (.*)$/\1/'`;

echo $facture;
echo $2;
echo $emeteur;
echo $3;

if [ "$facture" != "$2" ]; then
    echo "Facture : KO";
    echo "Chèque  : KO";
    exit 1
else
    echo "Facture : OK"
fi;

if [ "$emeteur" != "$3" ]; then
    echo "Emeteur : KO";
    echo "Chèque  : KO";
    exit 1
else
    echo "Emeteur : OK"
fi;

if [ "$ordre" != "$4" ]; then
    echo "Ordre   : KO";
    echo "Chèque  : KO";
    exit 1
else
    echo "Ordre   : OK"
fi;

if [ "$montant" != "$5" ]; then
    echo "Montant : KO";
    echo "Chèque  : KO";
    exit 1
else
    echo "Montant : OK"
fi;

echo "Chèque  : OK";

exit 0

