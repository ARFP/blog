---
title: "Alpine, Debian, Ubuntu. Différences entre les images"
date: 2025-09-21 08:30:00 +0000 
categories: docker
tags: docker deploiement
author: mdevoldere
--- 

Une image Docker est un package léger, autonome et exécutable qui comprend tout ce qui est nécessaire pour exécuter un logiciel, y compris le code, l'environnement d'exécution, les bibliothèques, les dépendances et les outils système.

La plupart des images Docker sont spécifiques à une distribution (par exemple, un système d'exploitation comme Debian, Ubuntu) et à une architecture (x86, ARM, etc.), ce qui offre de nombreuses options. Cependant, certains points doivent être pris en compte lors du choix d'une image.

> Les images Docker sont au format `<image>:<tag>`
> - « image » peut être remplacé par python, ubuntu, nodejs
> - « tag » inclut leurs versions, noms de code et toute autre nomenclature distincte, par exemple 3.10, 3.10-slim, 3.10-buster-slim (pour python), 21-bullseye, 21-slim (pour node)
> 

--- 

Imaginons que nous ayons un projet Django écrit en Python et que nous souhaitions créer une image Docker pour celui-ci. Nous recherchons donc des images Python ou simplement les images natives du système d'exploitation.

Nous nous rendons sur Docker Hub et découvrons qu'il existe de nombreuses images Docker, toutes portant des noms différents. Pour quelqu'un pressé de choisir une image Docker pour lancer son application au plus vite, la liste impressionnante d'options proposées n'est d'aucune aide.

Nous empruntons ensuite la « route la plus empruntée » et choisissons l’image standard.

Avertissement : En utilisant l'exemple de la version Python 3.10 tout au long de cet article, il est préférable de spécifier/d'utiliser une version (« tag » dans le contexte Docker) lors de la manipulation d'images Docker. Cela réduit l'ambiguïté des fonctionnalités et permet de gérer les problèmes éventuels. Ne vous contentez pas de  `docker pull python` ou `docker pull python:latest`, c'est tout à fait possible. Même si vous souhaitez la dernière version et que les versions ne vous intéressent pas, spécifiez le numéro de la dernière version. Par exemple : `docker pull python:3.10`

> Exécutez `docker pull python:3.10` pour obtenir l'image.

Voulons-nous cette image standard ? Je n'en suis pas sûr. Mais à ce stade, nous sommes encore plus incertains quant aux autres options. C'est notre première fois, nous l'optimiserons donc ultérieurement lors d'itérations ultérieures.

Eh bien, c'est ce que vous penseriez si vous vous retrouviez face au même dilemme.

Alors clarifions les différences dans les images Docker afin que nous fassions correspondre ce que nous choisissons et ce dont nous avons réellement besoin .


## Alpine

Créé dans un souci de simplicité, il a un encombrement réduit et utilise moins d'espace disque.
Différent des images basées sur Linux par sa bibliothèque C et son implémentation coreutils.
Les images Linux utilisent **glibc** (GNU C libraby) et **coreutils** (GNU coreutils), tandis qu'Alpine Linux les remplace respectivement par **musl libc** et **Busybox** , car elles sont relativement légères et moins encombrantes. Plus c'est petit, mieux c'est, n'est-ce pas ? Vraiment ?
- Gestionnaire de paquets : apk
- Shell : /bin/sh

### Cas d'utilisation :
Choisissez Alpine lorsque vous avez besoin d'une image de petite taille sans gonflement et que vous êtes sûr que les alternatives basées sur Alpine ont les fonctionnalités de base suffisantes pour votre application.

> Exécutez `docker pull python:3.10-alpine` pour obtenir l'image.



## Debian

Debian est une distribution Linux réputée, lancée dans les années 90. Depuis 2005, différentes versions de Debian sont publiées tous les deux ans, sous un nom de code spécifique tiré des personnages de Toy Story . 

- Gestionnaire de paquets : APT
- Shell : /bin/sh, /bin/bash

### Cas d'utilisation :

Choisissez une version Debian où toutes vos dépendances existantes fonctionnent correctement et sans conflit de version. Il n'est pas forcément nécessaire de choisir la dernière versionde Debian. Les nouvelles versions offriront toutefois des fonctionnalités et des performances améliorées.

> Exécutez `docker pull python:3.10-bullseye` pour obtenir l'image Python basée sur Debian bullseye.




## Slim 

Les versions Debian et Ubuntu ont toutes deux des images étiquetées **Slim**.
La taille de l'image est considérablement réduite par rapport à l'image standard par un processus appelé **slimification** .
Conformément à la documentation Debian de Docker , les pages de manuel, les fichiers de documentation et certains autres fichiers supplémentaires qui ne sont normalement pas nécessaires dans les conteneurs sont supprimés.
Pour plus de détails sur ce qui est supprimé pendant le processus de « slimification », consultez ici et ici .
Les gestionnaires de paquets sont similaires à leurs images standard correspondantes pour le système d'exploitation Debian.
Cas d'utilisation :

Choisissez cette option si vous souhaitez une image plus petite que l'image standard. Lors de la « slimification », il est indiqué que la documentation, les pages de manuel et les fichiers inutiles sont supprimés ; cela semble inoffensif, mais il est conseillé de procéder avec prudence et de tester minutieusement.

Appuyez sur Entrée ou cliquez pour voir l'image en taille réelle

par exemple. Exécutez docker pull python:3.10-slim-bullseye pour obtenir l'image.

Comparaison de toutes les tailles d’images Python :
Appuyez sur Entrée ou cliquez pour voir l'image en taille réelle

- Les images Slim Tagged sont de taille comparable pour les deux versions Debian Bookworm et Bullseye , mais Alpine a la plus petite taille.

Nous pouvons également, dans certains cas, utiliser des images Ubuntu natives, alors examinons-les également.


Ubuntu
Ubuntu
Il s'agit d' un système d'exploitation basé sur Debian , mais qui gère ses propres versions. Pour Docker, nous nous intéresserons aux versions de 2015, à savoir Ubuntu 16.04 LTS, également appelée Xenial Xerus .
À l'exception de Mantic (ci-dessous), toutes sont des versions LTS où le support général est fourni pendant 5 ans et le support de sécurité est fourni pendant 10 ans à compter de sa date de sortie.
Cas d'utilisation :
choisissez-le lorsque vous souhaitez l'image de base du système d'exploitation et que vous n'êtes pas sûr de la langue ou de la version de la langue dont vous auriez besoin, par exemple Python 3.7 ou 3.12 ou Java 11 ou Java 17 ou Golang ou tous ensemble.

Xenial (complet : Xenial Xerus )
- OS : Ubuntu 16.04
- Noyau : Linux 4.4

Bionic (complet : Bionic Beaver )
- Système d'exploitation : Ubuntu 18.04
- Noyau : Linux 4.15

Focal (complet : Focal Fossa )
- Système d'exploitation : Ubuntu 20.04
- Noyau : Linux 5.4

Jammy (complet : Jammy Jellyfish )
- OS : Ubuntu 22.04
- Noyau : Linux 5.15

Mantic (complet : Mantic Minotaur )
- Système d'exploitation : Ubuntu 23.10
- Noyau : Linux 6.5

Noble (complet : Noble Numbat )
- Système d'exploitation : Ubuntu 24.04
- Noyau : Linux 6.6

Appuyez sur Entrée ou cliquez pour voir l'image en taille réelle

Images Ubuntu dans Docker Hub
par exemple. Exécutez docker pull ubuntu:noble pour obtenir l'image.

Comparaison des tailles des images Python et de l'image native Ubuntu Noble :

Appuyez sur Entrée ou cliquez pour voir l'image en taille réelle

Résumé:
Nous étions face à un grand dilemme quant au choix d'une image Docker pour notre application, puis nous avons beaucoup appris sur les différentes images fournies dans Docker Hub avec leurs avantages et leurs cas d'utilisation.

Nous avons appris :
- quelle image choisir si nous ne nous soucions pas trop de la taille ou des bloatwares
- laquelle choisir lorsque nous sommes préoccupés par la taille de chaque Mo
- laquelle choisir si nous voulons une version Linux spécifique
- laquelle choisir si nous voulons une version Linux spécifique mais que nous sommes conscients de la taille de l'image

Remarque : nous devons tester minutieusement notre image avec notre application avant de la mettre en ligne.

