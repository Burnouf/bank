# Transactions sécurisées par chèques

## Exemple

```sh
# Creation de la banque
./banque-ouverture.sh la-banque
# Creation du client
./banque-nouveau-client.sh la-banque le-client Bob


./creer-cheque.sh "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €" > cheque-lada.txt
./afficher-cheque.sh cheque-lada.txt
./vendeur-verifie-le-clair.sh cheque-lada.txt "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €"
```
