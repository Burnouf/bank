#! /usr/bin/env bash

if [ $# -ne 4 ]; then
    echo "Usage : ./create-check <facture> <emeteur> <ordre> <montant>";
    exit 1
fi;

echo "Facture : $1";
echo "Emeteur : $2"; 
echo "Ordre : $3";
echo "Montant : $4"; 

exit 0
