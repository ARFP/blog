---
title: "Créer un Alias sur le serveur Apache"
date: 2023-11-17 08:30:00 +0200 
categories: apache
tags: web apache php laragon
author: mdevoldere
--- 

Si vous êtes un développeur Web, je recommande Laragon comme serveur Web pour le développement local. Pourquoi le laragon ? D'après mon expérience, Laragon est facile à utiliser et vous permet de développer votre projet rapidement et efficacement.

## Laragon 

- Création automatique d'hôtes virtuels
- Contient un simulateur d'envoi/réception d'emails
- Commutation simple entre Apache, Ngnix, PHP, MySQL et MariaDB
- Création facile de projets avec : 
    - des frameworks comme Laravel ou Symfony...
    - le CMS Wordpress.
- Configuration facile de l'environnement de développement

Site officiel : [https://laragon.org](https://laragon.org)

## Installer Laragon

Sur le [site officiel](https://laragon.org/download/), télécharger la version "full". Cette version est la plus complète et conviendra pour tous vos projets Web. 

Pour la suite de cet article, nous utiliserons le chemin d'installation par défaut de laragon soit `C:\laragon\`.

## Configuration de base

Par défaut, le répertoire racine (**DocumentRoot**) du serveur web est `C:\Laragon\www`. 

Le **DocumentRoot** est le répertoire qui contient les fichiers et dossiers d'un site Web. Lorsque vous visitez un site Web depuis votre navigateur, Apache recherche les fichiers du site Web dans le **DocumentRoot**.

Le **DocumentRoot** est défini dans le fichier de configuration du serveur Apache. 

## Configurer les Alias

Un **alias** dans un serveur Web Apache est une directive qui permet de faire correspondre un URL à un chemin du système de fichiers. Cela signifie qu'une requête HTTP pour une URL donnée sera traitée comme si elle était une requête pour le chemin du système de fichiers correspondant.

Par exemple, si vous avez un site Web dont le **DocumentRoot** est situé dans le répertoire `/var/www/html`, vous pouvez utiliser un **alias** pour faire correspondre l'URL `/images` au répertoire `/var/www/images`. Cela signifie qu'une requête HTTP pour `/images/photo.jpg` sera traitée comme si elle était une requête pour `/var/www/images/photo.jpg`.

La syntaxe de la directive Alias est la suivante :

`Alias "/chemin-url" "/chemin/vers/les/fichiers/"`

Exemple :

`Alias /images /var/www/images/`

Cette directive fera correspondre l'URL `/images` au répertoire `/var/www/images/`.

Les alias peuvent être utilisés pour diverses raisons :

- Organiser le contenu sur le serveur.
- Servir des contenus qui ne sont pas situés dans le DocumentRoot.
- Rediriger les requêtes vers des ressources externes.

## Ajouter des alias dans Laragon 

Pour cet exemple, nous allons créer un Alias `/monsite` qui pointera vers le répertoire `C:\Users\mdevoldere\monsupersiteweb\`.

Dans Laragon, les fichiers de configuration d'Apache sont situés dans `C:\laragon\etc\apache2\`.

Pour ajouter un alias, ouvrir le fichier `C:\laragon\etc\apache2\alias\laragon.conf`

A la fin du fichier ajouter l'Alias : 

`Alias "/monsite" "C:/Users/mdevoldere/monsupersiteweb/"`

Pour que ce nouvel alias soit pris en compte par le serveur, il est nécessaire de le redémarrer.

Après avoir redémarré le serveur Apache, rendez-vous sur l'URL `http://localhost/monsite/`.

Si vous rencontrez une erreur 404, cela signifie que le répertoire cible n'existe pas.

Si le répertoire existe, vous devriez rencontrer une erreur 403 (accès interdit). Ceci est normal, par défaut, le serveur Apache refuse l'accès aux répertoires sauf si l'on l'autorise explicitement. 

Pour régler ce "problème", il est nécessaire de configurer le répertoire de destinaton (ici `C:/Users/mdevoldere/monsupersiteweb/`).

Sous la ligne `Alias "/monsite" "C:/Users/mdevoldere/monsupersiteweb/"`; ajouter le code suivant : 

```shell
<Directory "C:/Users/mdevoldere/monsupersiteweb/">
	AllowOverride all 
	Options +Indexes +FollowSymLinks
	Require all granted 
</Directory>
```

`Directory` : indique quel répertoire est concerné par cette configuration.

`AllowOverride all` : La directive AllowOverride all permet la surcharge de la configuration dans le répertoire concerné. Cette surcharge se fait dans des fichiers .htaccess. Cet article n'aborde pas cette notion.

`Options +Indexes +FollowSymLinks` : 
- `Options` - Spécifie quelles options sont activées pour le répertoire.
- `+Indexes` - Active le listing des répertoires.
- `+FollowSymLinks` - Active le suivi des liens symboliques par le serveur.

`Require all granted` : autorise la consultation de votre site web depuis un PC distant. Si vous souhaitez uniquement autoriser un accès local, la directive sera `Require local`.

## Conclusion 

Dans l'exemple précédent, la configuration complète de l'alias est : 

```shell
Alias "/monsite" "C:/Users/mdevoldere/monsupersiteweb/"

<Directory "C:/Users/mdevoldere/monsupersiteweb/">
	AllowOverride all 
	Options +Indexes +FollowSymLinks
	Require all granted 
</Directory>
```

Avec l'alias ci-dessus, si j'entre l'URL : `http://localhost/monsite/images/toto.jpg` ; le serveur cherchera le fichier `toto.jpg` dans le répertoire `C:/Users/mdevoldere/monsupersiteweb/images/`  

> Note : Vous pouvez créer autant d'alias que vous souhaitez.
