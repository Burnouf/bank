# OpenSSL

## RSA

``` sh
openssl genrsa 1024
```

Les points et les plus sont l'entroipie, si ça change à chaque fois c'est 
bon signe pour la base d'entropie !

La clé est encapsulée en base64 pour le transport, et c'est pas pour rien !

``` sh
cat private.key | base64 -d | xxd
``` 

On voit bien que c'est du binaire quoi ;~)

``` sh
cat private.key | openssl rsa -text -noout
``` 

La clé privée contient en fait TOUT le troussau de clés, y compris la clé
publique ! C'est pour celà qu'elle est sensée être PRIVÉE !

``` sh
cat private.key | openssl rsa -pubout
``` 

Nous renvoie la clé publique, c'est donc que la clé publique est bien un 
gros trousseau de malade !

``` sh
echo "Hello RSA" | openssl rsautl -encrypt -inkey private.key
echo "Hello RSA" | openssl rsautl -encrypt -inkey private.key
```

On a des chiffrés différents car openssl fait du bourrage avec du random 
quand l'entrée est plus petite que la clé.

``` sh
cat "Text secret" | openssl rsautl -encrypt -inkey public.key -pubin | base64 > /tmp/encrypted.txt
cat /tmp/encrypted.txt | base64 -d | openssl rsautl -decrypt -inkey private.key
``` 

Chiffrer avec la clé publique permet de rendre un message privé au 
destinataire.

OpenSSL ne permet en revanche pas de déchiffrer avec la clé publique.
Il faut donc utiliser la clé publique pour chiffrer et la privée pour 
déchiffrer. Si l'on peut chiffrer avec la clé privée, c'est parcequ'elle
contient la clé publique.

## Chiffrement symétrique

Pour chiffrer de longs messages, on prefere utiliser le chiffrement symétrique

``` sh
echo "Hello" | openssl enc -e -aes-128-cbc -pass pass:test > secret.bin
cat secret.bin | openssl enc -d -aes-128-cbc -pass pass:test
```



