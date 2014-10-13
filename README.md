# Transactions sécurisées par chèques

## Exemple

``` sh
./creer-cheque.sh "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €" > cheque-lada.txt
./afficher-cheque.sh cheque-lada.txt
./vendeur-verifie-le-clair.sh cheque-lada.txt "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €"
```
