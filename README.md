# Transactions sécurisées par chèques

## Exemple

```sh
# On crée la banque
./banque-ouverture.sh la-banque

# On crée le client
./banque-nouveau-client.sh la-banque le-client Bob

# On crée le vendeur
./banque-nouveau-client.sh la-banque le-vendeur Paul

# Le client crée le chèque
cp le-client/cheque.entete cheque-lada-entete
./creer-cheque.sh cheque-lada-entete "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €" > cheque-lada-clair

# On affiche le chèque
./afficher-cheque.sh cheque-lada-clair

# Le vendeur vérifie le chèque en clair
./vendeur-verifie-le-clair.sh cheque-lada-clair "Facture pour la LADA" "Benjamin" "Concessionnaire LADA" "120 €"

# Le vendeur signe le chèque et le donne pour vérification au client
openssl dgst -sha256 < cheque-lada-clair > /tmp/hash1
openssl rsautl -sign -inkey le-vendeur/private.pem -keyform PEM -in /tmp/hash1 > cheque-lada-signature-vendeur
cp le-vendeur/public.pem cle-vendeur

# Le client vérifie la signature du vendeur
openssl dgst -sha256 < cheque-lada-clair > /tmp/hash1
openssl rsautl -verify -inkey cle-vendeur -keyform PEM -pubin -in cheque-lada-signature-vendeur

```

## Sources
 * http://www.codealias.info/technotes/openssl_rsa_sign_and_verify_howto
