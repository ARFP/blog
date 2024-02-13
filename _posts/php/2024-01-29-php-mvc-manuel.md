---
title: "PHP: Créer une application MVC from scratch"
date: 2024-01-29 11:00:00 +0000 
categories: php
tags: php objet mvc
author: mdevoldere
--- 

Dans cet article, nous allons développer une petite application **MVC** en **PHP** à partir de zéro. L'objectif est de comprendre les fondamentaux de l'architecture MVC.

## Avant propos 

En général, les équipes de développement utilisent un framework pour monter des applications MVC. Parmi les plus utilisés, nous pouvons citer [Symfony](https://symfony.com/), [Laravel](https://laravel.com/) ou encore [Code Igniter](https://www.codeigniter.com/). Il en existe bien d'autres, nous n'avons cité ici que les 3 plus populaires.

Afin de bien comprendre les fondamentaux de l'architecture MVC, nous allons construire, *pas à pas*, une petite application MVC sans utiliser de framework.

## Contexte de l'application 

L'application concerne la gestion de pays et de villes.

Dans la majorité des applications, les développeurs sont amenés à manipuler des pays et des villes dans différents contextes comme par exemple : 
- Les profils utilisateurs
- Les adresses de facturation et/ou de livraison

## Base de données

La 1ère étape consiste à créer une base de données qui hébergera les données.

- Le nom de la base de données est : `db_countries`
- La base de données utilise le jeu de caractères `UTF8`
- La base de données utilisée contient 2 tables
- Le jeu d'essai contient 3 pays et 5 villes 

![Pays MCD](./img/db_cities_MLD.jpg)

```sql
/* MySQL */
CREATE DATABASE `db_cities` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `db_cities`;

CREATE TABLE pays(
   id INT AUTO_INCREMENT,
   codePays CHAR(2) NOT NULL,
   nomPays VARCHAR(255) NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(codePays)
);

CREATE TABLE ville(
   id INT AUTO_INCREMENT,
   codePostalVille CHAR(5) NOT NULL,
   nomVille VARCHAR(255) NOT NULL,
   idPays INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(idPays) REFERENCES pays(id)
);

INSERT INTO pays 
(id, codePays, nomPays)
VALUES 
(1, 'FR', 'France'),
(2, 'BE', 'Belgique'),
(3, 'DE', 'Allemagne');

INSERT INTO ville 
(id, codePostalVille, nomVille, idPays) 
VALUES 
(1, '59000', 'Lille', 1),
(2, '1000', 'Bruxelles', 2),
(3, '68100', 'Mulhouse', 1),
(4, '68000', 'Colmar', 1),
(5, '10115', 'Berlin', 3);
```

## Structure de l'application 

Notre application MVC sera structurée comme suit : 

```yaml
/mon-projet
    /public
        /assets
    /Models
    /Views
    /Controllers
```

- **mon-projet**: répertoire racine du projet. Servira de point d'entrée de l'application.
- **public**: Répertoire racine du serveur Web. Tout ce qui se trouve en dehors de ce répertoire sera inaccessible depuis le navigateur.
- **assets**: Répertoire pour les images, fichiers CSS et JS
---
- **Models**: Les modèles représentent la couche métier de l'application. Ils sont responsables de la gestion des données et de la logique métier.
- **Views**: Les vues contiennent la présentation de l'application. C'est l'interface utilisateur à travers laquelle l'utilisateur interagit. Généralement, les vues sont codées en HTML. 
- **Controllers**: Les contrôleurs agissent comme un intermédiaire entre la vue et le modèle. Ils sont responsables de la gestion des interactions utilisateur et de la coordination des actions entre la vue et le modèle.