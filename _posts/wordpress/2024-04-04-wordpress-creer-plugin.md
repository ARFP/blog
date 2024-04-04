---
title: "Créer un plugin Wordpress"
date: 2024-04-04 12:45:00 +0200 
categories: php wordpress 
tags: php wordpress cms
---

Un plugin WordPress est un petit programme qui ajoute des fonctionnalités à votre site WordPress. Il peut s'agir d'ajouter de nouveaux types de contenu, de modifier l'apparence de votre site ou d'ajouter des fonctionnalités e-commerce. Il existe [des milliers de plugins gratuits et payants](https://fr.wordpress.org/plugins/).

En quelques mots, un plugin permet d'étendre les fonctionnalités natives de WordPress sans toucher au code source du CMS.


## Étapes pour créer un plugin Wordpress :

1. Créer un dossier pour votre plugin:
    - Dans le dossier `/wp-content/plugins/`, créez un nouveau dossier avec un nom unique et descriptif.
2. Créer le fichier principal du plugin:
    - Dans le dossier de votre plugin, créez un fichier php avec le même nom que le dossier.
3. Ajoutez les informations d'en-tête du plugin:
    - le nom du plugin, la description, l'auteur, etc.
4. Définir les fonctionnalités du plugin:
    - Utilisez les hooks Wordpress et des fonctions pour ajouter des fonctionnalités à WordPress.
    - Par exemple, vous pouvez créer une fonction pour afficher un widget ou une fonction pour ajouter un menu personnalisé.
    - [Liste des Hooks Wordpress](https://developer.wordpress.org/reference/hooks/)
5. Activer le plugin:
    - Connectez-vous à votre site WordPress en tant qu'administrateur.
    - Accédez à la page "Extensions".
    - Votre plugin devrait aparaitre dans la liste
    - Cliquez sur "Activer"


## Exemple de plugin simple

Créons un plugin qui affiche un message "Hello World!" dans l'administration de WordPress.

**Structure du dossier**:

- /wp-content/plugins/mon-plugin/
    - mon-plugin.php

Contenu du fichier **mon-plugin.php**:

```php
<?php
/**
 * Plugin Name: Mon plugin
 * Description: Affiche un message "Hello World ! (mon-plugin)" dans l'administration de WordPress.
 * Author: CRM
 * Version: 1.0.1
 */

function mon_plugin_message_admin() {
  echo '<aside>';
  echo '<p>Hello World ! (mon-plugin)</p>';
  echo '</aside>';
}

add_action( 'admin_notices', 'mon_plugin_message_admin' );
```

Activez ensuite le plugin en suivant les étapes ci-dessus.

Vous verrez le message "Hello World !  (mon-plugin)" dans l'administration de WordPress.

## Conseils

- Testez votre plugin sur un site de test avant de l'installer sur un site en production.
- Documentez votre plugin avec des commentaires PHP.
- Utilisez des normes de codage PHP strictes.
- Respectez les directives de développement de plugins WordPress.

## Ressources supplémentaires:

- [Tuto 1: Créer un plugin WordPress](https://wpformation.com/creer-plugin-wordpress/)
- [Tuto 2 : Créer un plugin WordPress](https://grafikart.fr/tutoriels/wordpress-plugins-1282)
