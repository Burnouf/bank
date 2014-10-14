#! /usr/bin/env bash

if [ $# -ne 5 ]; then
    echo "Usage : ./creer-cheque <entete> <facture> <emeteur> <ordre> <montant>";
    exit 1
fi;

echo "Entete : $1";
echo "Facture : $2";
echo "Emeteur : $3"; 
echo "Ordre : $4";
echo "Montant : $5"; 

exit 0
