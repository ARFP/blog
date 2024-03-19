---
title: "Installer Wordpress avec Laragon"
date: 2024-03-19 08:00:00 +0200 
categories: php wordpress 
tags: php wordpress cms laragon
---

Dans cet article, vous apprendrez à installer le CMS [Wordpress](https://fr.wordpress.org). 

Installer WordPress sur votre ordinateur est une procédure simple. 

Tout ce que vous avez à faire, c'est de suivre attentivement cet article et si vous rencontrez des zones sombres, n'hésitez pas à relire l'article et/ou interroger vos formateurs. Vous avez notre permission :D

## C'EST QUOI WORDPRESS EXACTEMENT ?

Pour ceux qui n'ont pas d'idée de ce qu'est WordPress, c'est un système de gestion de contenu gratuit, libre et open-source. Il permet de créer facilement des sites web, blogs ou applications web et mobile.
 
Développé par Automattic le 27 Mai 2003, WordPress est considéré aujourd'hui comme le futur du web car plus de **43%** des sites web sont conçus grâce à cet outil.

Mais je ne suis pas là pour vous parler de l'historique de WordPress car Wikipedia a écrit tout [un article à ce sujet](https://fr.wikipedia.org/wiki/WordPress).
 

## LES ETAPES A SUIVRE POUR INSTALLER WORDPRESS 

Tout d'abord, vous devez savoir qu'installer WordPress ne nécessite pas seulement une connexion internet.
Deuxièmement, WordPress n'est pas un logiciel comme les autres. C'est-à-dire un exécutable (.exe). Il est plutôt un ensemble de fichiers et dossiers qui vous aidera à créer un site web.


### ÉTAPE 1 : TELECHARGER WORDPRESS

La première chose à faire quand on souhaite créer un site WordPress, c'est de télécharger l'outil depuis le site officiel.

Pour télécharger WordPress, [cliquez sur ce lien](https://fr.wordpress.org/download/). Grace à ce lien, vous allez télécharger la toute dernière version de WordPress. Ce qui déjà une bonne chose pour vous.
Vous allez donc télécharger un fichier compressé nommé **wordpress-6.4.3-fr_FR.zip** (6.4.3 n'est rien d'autre que la version de WordPress. Ne soyez pas étonné si vous avez une version différente car il y a des mises à jour régulières).

Comme il s'agit d'un fichier compressé, nous allons le décompresser aux étapes suivantes.


### ÉTAPE 2 : INSTALLER OU TÉLÉCHARGER UN SERVEUR LOCAL: LARAGON

La deuxième chose à faire après avoir télécharger WordPress, c'est d'installer un serveur local sur votre ordinateur.

**C'est quoi un serveur local ?**

Un serveur local est un logiciel qui vous permet de tester votre site web sur votre poste de travail. Il sert, entre autres, à exécuter des scripts PHP et de gérer les bases de données facilement et rapidement.

Il existe plusieurs serveurs locaux comme Laragon, Wamp, Xampp... Nous utiliserons ici Laragon.

[Télécharger Laragon](https://laragon.org/download/index.html) (Téléchargez la version "full").

Après installation du logiciel Laragon, ouvrez-le et cliquez sur le bouton Démarrer. 
 

### ÉTAPE 3 : CREATION DE LA BASE DE DONNEES POUR UN SITE WORDPRESS

La prochaine étape consiste à créer une base de données car toutes les informations de votre site doivent être stockées et organisées dans une base de données.

Pour créer une base de données avec Laragon, cliquez sur **Base de données** et patientez que la fenêtre des sessions de base de données s'ouvre comme affiché sur l'image suivante :

![Laragon BDD](/blog/assets/img/laragon-bdd-sessions.jpg)
 
Ensuite double-cliquez sur Laragon pour créer afin votre base de données. La fenêtre qui s'ouvre contiendra toutes les bases de données créées avec la session sélectionnée.

Faites ensuite un clic droit sur Laragon et sur le menu qui s'ouvre cliquez sur **Créer un(e) nouveau(el/elle)** ; choisissez **Base de données** puis donnez un nom à votre base de données.
 
Libre à vous de donner le nom que vous voulez. Notez le, il vous sera demandé lors de l'installation de Wordpress.


### ÉTAPE 4 : INSTALLATION DE WORDPRESS

- Copiez le fichier **wordpress-x.x.x-fr_FR.zip** dans le répertoire **C:/laragon/www/**
- Décompressez le fichier et vous aurez un dossier nommé **wordpress**
- Ouvrez votre navigateur web et tapez [http://localhost/wordpress/](http://localhost/wordpress/).  :
- Pour lancer l'installation, cliquez sur le bouton **C'est parti !** . La fenêtre qui s'ouvre vous demande certaines informations.
    - Nom de base de données : le nom de la base de données que vous avez créé précédemment
    - Identifiant : root
    - Mot de passe : laissez vide (effacez ce qui est écrit dans le champ)
    - Adresse de la base de données : localhost 
    - Préfixe des tables : laissez-les tels qu'ils sont.

Si tout s'est bien déroulé, vous aurez une page avec le texte suivant : **C’est parfait !** 

Vous avez passé la première partie de l’installation. WordPress peut désormais communiquer avec votre base de données. Cliquez maintenant sur le bouton **Lancer l'installation**.

La page suivante vous demande de renseigner les informations de votre site ainsi que les identifiants de connexion pour le compte Administrateur. Renseignez les champs puis cliquez sur le bouton **Installer WordPress**.

Une fois l'installation terminée, vous serez redirigé vers la page de connexion : entrez vos identifiants de connexion et bingo !

**Vous venez d'installer WordPress en local.**

Maintenant, avant de vous lancer dans le développement de thèmes ou de plugins, prenez le temps de parcourir l’interface d’administration de Wordpress.

Pour vous familiariser avec l'interface d'aministration, vous pouvez :
- Créer des utilisateurs
- Créer des articles et des catégories d'articles
- Créer des pages
