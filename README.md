# Transactions sécurisées par chèques

## Exemple

```sh
# Creation de la banque
./banque-ouverture.sh la-banque

# Creation du client
./banque-nouveau-client.sh la-banque le-client Bob

# Vérifier l'entête du chèque
./cheque-verifier-entete.sh le-client/cheque.entete la-banque/public.pem

./creer-cheque.sh "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €" > cheque-lada.txt
./afficher-cheque.sh cheque-lada.txt
./vendeur-verifie-le-clair.sh cheque-lada.txt "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €"
```

## Sources
 * http://www.codealias.info/technotes/openssl_rsa_sign_and_verify_howto
