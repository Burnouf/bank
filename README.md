# Transactions sécurisées par chèques

Burnouf Benjamin, 
Toulet Cyrille

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
openssl dgst -sha256 < cheque-lada-clair > hash1
openssl rsautl -sign -inkey le-vendeur/private.pem -keyform PEM -in hash1 > cheque-lada-signature-vendeur
cp le-vendeur/public.pem cle-vendeur

# Le client vérifie la signature du vendeur
openssl rsautl -verify -inkey cle-vendeur -keyform PEM -pubin -in cheque-lada-signature-vendeur > hash2
diff -s hash1 hash2

# Le client re-signe à son tour le chèque (signé)
openssl dgst -sha256 < cheque-lada-signature-vendeur > hash3
openssl rsautl -sign -inkey le-client/private.pem -keyform PEM -in hash3 > cheque-lada-signature-client
cp le-client/public.pem cle-client

# Le vendeur vérifie le chèque avant que client ne s'en aille
openssl rsautl -verify -inkey cle-client -keyform PEM -pubin -in cheque-lada-signature-client > hash4
diff -s hash3 hash4

# Le vendeur dépose le chèque à la banque
mkdir cheque-a-deposer
cp cheque-lada-clair cheque-a-deposer/clair
cp cheque-lada-signature-vendeur cheque-a-deposer/signe-vendeur
cp cheque-lada-signature-client cheque-a-deposer/signe-client
cp cle-vendeur cheque-a-deposer/cle-vendeur
cp cle-client cheque-a-deposer/cle-client

# La banque verifie le cheque
cd cheque-a-deposer/
openssl dgst -sha256 < clair > hash1
openssl rsautl -verify -inkey cle-vendeur -keyform PEM -pubin -in signe-vendeur > hash2
diff -s hash1 hash2
openssl dgst -sha256 < signe-vendeur > hash3
openssl rsautl -verify -inkey cle-client -keyform PEM -pubin -in signe-client > hash4
diff -s hash3 hash4

# Si les hashs sont identiques, le cheque est encaissé
```

## Sources
 * http://www.codealias.info/technotes/openssl_rsa_sign_and_verify_howto
