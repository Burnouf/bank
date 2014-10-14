#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage : ./afficher-clair <mon-cheque>";
    exit 1
fi;

chemin_du_cheque="$1";
facture=$(/bin/grep "Facture : " $chemin_du_cheque | /bin/sed -r 's/^Facture : (.*)$/\1/');
emeteur=$(/bin/grep "Emeteur : " $chemin_du_cheque | /bin/sed -r 's/^Emeteur : (.*)$/\1/');
ordre=$(/bin/grep "Ordre : " $chemin_du_cheque | /bin/sed -r 's/^Ordre : (.*)$/\1/');
montant=$(/bin/grep "Montant : " $chemin_du_cheque | /bin/sed -r 's/^Montant : (.*)$/\1/');

echo "Facture :     $facture";
echo "Emeteur :     $emeteur";
echo "Ordre   :     $ordre";
echo "Montant :     $montant";

exit 0

