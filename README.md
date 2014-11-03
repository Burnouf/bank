# Transactions sécurisées par chèques

## Exemple

```sh
# On crée la banque
./banque-ouverture.sh la-banque

# On crée le client
./banque-nouveau-client.sh la-banque le-client Bob

# On affiche le chèque
./afficher-cheque.sh cheque-lada.txt

# Le client crée le chèque
./creer-cheque.sh le-client/cheque.entete "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €" > cheque-lada.txt

# Le vendeur vérifie le chèque en clair
./vendeur-verifie-le-clair.sh cheque-lada.txt "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €"
```

## Sources
 * http://www.codealias.info/technotes/openssl_rsa_sign_and_verify_howto
