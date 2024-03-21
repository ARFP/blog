---
title: "Thème Wordpress: Le fichier functions.php"
date: 2024-03-19 13:00:00 +0200 
categories: php wordpress 
tags: php wordpress cms
---

Le fichier **functions.php** de WordPress vous permet d’ajouter des fonctionnalités à votre thème.

Dans cet article, vous allez apprendre l'essentiel à savoir sur ce fichier.

Cet article vous propose également quelques extraits de code utiles à inclure dans le fichier functions.php pour vous aider à personnaliser votre thème.

## Que fait le fichier functions.php de WordPress ?

Le fichier **functions.php** est un fichier de thème que vous pouvez utiliser pour ajouter des fonctionnalités à votre thème. Vous pouvez utiliser ce fichier pour modifier le fonctionnement de différentes parties de Wordpress ou pour ajouter un nouveau comportement à votre site.

Bien qu’il soit inclus dans votre thème, le fichier WordPress functions.php n’est pas limité à la personnalisation de votre thème.

Vous pouvez apporter des modifications à n’importe quelle partie de votre site, comme le font les extensions.

Voici quelques types d’ajustements courants que vous pouvez effectuer à l’aide du fichier functions.php :

- Modifier le comportement de base de WordPress, comme le nombre d’articles à afficher sur la page de résultats de recherche ou le contenu à inclure dans le flux RSS de votre site.
- Créer vos propres codes courts (shortcodes) personnalisés.
- Ajouter du nouveau contenu ou des scripts à votre site, par exemple en injectant un script Javascript ou en modifiant le pied de page de votre site.
- Et ce n’est pas tout...

Étant donné que le fichier functions.php vous permet d’ajouter des extraits de code PHP personnalisés à votre site plutôt que du HTML statique, les possibilités de modification sont *quasi* illimitées.

### Où se trouve le fichier functions.php de Wordpress ?

Le fichier **functions.php** est situé dans le dossier de votre thème actif, avec les autres fichiers du thème.

Par exemple, si vous utilisez un thème nommé **montheme**, le fichier functions.php se trouve à l'emplacement : `/wp-content/themes/montheme/functions.php`.

## Comment travailler en toute sécurité avec le fichier functions.php

Parce que travailler avec le fichier WordPress functions.php implique d’ajouter du code à votre site web, il est important de suivre les  bonnes pratiques lorsque vous ajoutez des modifications.

### Testez votre code functions.php sur un site de staging

Avant d’ajouter du code  dans le fichier functions.php, nous vous recommandons de les tester d’abord en local puis sur une version de *staging* de votre site. Cela vous permet de vérifier qu’il n’y a pas d’erreurs potentielles et que le code fonctionne comme prévu.

> Un « site de staging » est une copie identique de votre site en production qui se trouve dans un bac à sable sécurisé et privé. Il vous permet de tester les modifications sans avoir à utiliser le mode de maintenance sur votre site réel.

### Sauvegardez votre site avant de publier une nouvelle version de votre fichier functions.php

Il s’agit d'ailleurs d’une bonne pratique à suivre lorsque vous modifiez des fichiers dans n'importe quelle application web.

> Sauvegarder les fichiers avant de publier une nouvelle version permet, en cas de problème, de restaurer les anciens fichiers pour rétablir instantanément le fonctionnement de votre site.


### Utilisez toujours un thème enfant si vous souhaitez modifie le fichier functions.php d'un thème déjà existant. 

Pour éviter que les modifications que vous avez apportées au fichier functions.php de votre thème ne soient écrasées, vous devez toujours utiliser un thème enfant WordPress et ajouter votre code au fichier functions.php du thème enfant.

> En utilisant un thème enfant, vous êtes toujours en mesure de mettre à jour le thème parent si nécessaire, mais toutes vos personnalisations du fichier functions.php ne seront jamais écrasées.

## Alternative au fichier functions.php

Bien que le fichier functions.php offre un moyen facile d’ajouter des fonctionnalités à votre site, il existe des alternatives qui offrent une meilleure solution dans la plupart des situations.

### Créer un plugin de fonctionnalité personnalisé

Une alternative au fichier functions.php est de créer votre propre extension personnalisée (plugin) pour héberger votre code.

Bien que cela puisse sembler compliqué, c’est en fait beaucoup plus simple qu’il n’y paraît. 

> La création de plugins Wordpress sera traitée dans un autre article.

## Principales fonctions utiles du fichier functions.php

Passons maintenant en revue certains des extraits de code les plus utiles que vous pouvez ajouter au fichier functions.php.

### Activer des fonctionnalités Wordpress pour votre thème

Lorsque vous créez un nouveau thème, certaines fonctionnalités de Wordpress sont désactivées par défaut.

```php
// functions.php
/**
 * Déclare des fonctionnalités à activer pour le thème courant
 */
function myThemeSetup() {
    // Active l'image de mise en avant pour les articles et les pages
    add_theme_support('post-thumbnails');

    // Active les types d'articles utilisables dans WP autres que 'article' et 'page'
    add_theme_support('post-formats', ['aside', 'gallery', 'link', 'image', 'quote', 'status', 'video', 'audio', 'chat']);

}

/** Active les fonctionnélités déclarées dans MyThemeSetup */
add_action('after_setup_theme', 'myThemeSetup');
```

D'autre fonctionnalités peuvent être activées, vous trouverez d'autres exemples sur [la documentation Wordpress](https://developer.wordpress.org/reference/functions/add_theme_support/).

### Déclarer un menu configurable

Les menus sont un moyen efficace dont vous pouvez vous servir pour faciliter la navigation sur votre site. À travers un menu personnalisé, vous pouvez afficher des liens vers les contenus pertinents pour vos visiteurs.

```php
// functions.php
/**
 * Déclare un ou plusieurs menu(s) configurable(s) dans le back-office (Apparence->Menus)
 */
function registerMyMenu() {
    register_nav_menu('header', 'Mon menu principal');
}

/** Enregistre le ou les menus déclarés dans la fonction registerMyMenu */
add_action('after_setup_theme', 'registerMyMenu');
```

Une fois le menu déclaré, il faut indiquer à Wordpress à quel endroit vous souhaitez afficher ce menu, par exemple dans le template `header.php` pour le menu de navigation principal du site ou dans le template `footer.php` pour les liens de pied de page.

```php
// Affiche le menu 'header'
wp_nav_menu([
    'theme_location' => 'header',
    'menu_class' => 'my-menu',
    'container' => false
]);
```
L'entrée `theme_location` correspond à l'identifiant du menu déclaré en 1er argument de register_nav_menu() dans le fichier functions.php.

Rendez-vous ensuite dans le back-office dans la section `Apparence -> Menus` pour personnaliser les éléments du menu.

> Vous pouvez déclarer plusieurs menus dans votre fichier functions.php

Plus d'informations sur les menus Wordpress sur le site [Capitaine WP](https://capitainewp.io/formations/developper-theme-wordpress/menus-moteur-recherche/)

### Activer et utiliser les widgets 

Les widgets sont des éléments interactifs que l’on retrouve en général dans la barre latérale du blog, et qui permettent d’afficher des informations comme la liste des derniers articles, commentaires, les catégories, un calendrier, etc...

```php
// functions.php 

/** Déclare une "sidebar" configurable dans le back-office (Apparence->widgets) */
register_sidebar([
    'id' => 'blog-sidebar',
    'name' => 'Blog',
]);
```

Vous devez ensuite invoquer la fonction `dynamic_sidebar` à l'endroit où vous souhaitez afficher la sidebar et les éléments qu'elle contient (dans l'un des fichiers templates de votre thème, le header ou le footer par exemple).

```php 
// Affiche la sidebar "blog-sidebar"
dynamic_sidebar('blog-sidebar'); 
```

Le paramètre de la fonction `dynamic_sidebar` correspond au 1er paramètre de la fonction `register_sidebar` invoquée dans le fichier functions.php.

Rendez-vous ensuite dans le back-office de Wordpress dans la section `Apparence -> Widgets` pour configurer les éléments à afficher dans la sidebar.

Plus d'infos sur les Widgets Wordpress sur le site [Capitaine WP](https://capitainewp.io/formations/developper-theme-wordpress/sidebars-widgets/)


### Afficher la date de dernière modification sur les articles de blog

Par défaut, la plupart des thèmes affichent la date à laquelle vous avez publié un article de blog. Toutefois, si vous mettez régulièrement à jour et actualisez d’anciens contenus, vous souhaiterez peut-être afficher également la date de dernière modification (ou remplacer la date de publication par la date de dernière modification).

Cela permet non seulement à vos visiteurs humains de savoir que vous mettez toujours le contenu à jour, mais aussi aux moteurs de recherche de savoir que votre contenu est *frais*.

```php
function show_last_updated( $content ) {
  $u_time = get_the_time('U');
  $u_modified_time = get_the_modified_time('U');

  if ($u_modified_time >= $u_time + 86400) {
    $updated_date = get_the_modified_time('F jS, Y');
    $updated_time = get_the_modified_time('h:i a');
    $custom_content .= '<p class="last-updated">Mis à jour le '. $updated_date . ' à '. $updated_time .'</p>';
  }

  $custom_content .= $content;
  return $custom_content;
}

add_filter( 'the_content', 'show_last_updated' );
```


### Désactiver la barre d’outils WordPress pour certains utilisateurs

Par défaut, WordPress affiche la barre d’outils WordPress pour tous les utilisateurs connectés en utilisant les rôles d’utilisateur intégrés à WordPress. Ce n’est pas nécessairement le cas pour les rôles personnalisés, tels que le rôle d’utilisateur Client pour les boutiques WooCommerce.

Si vous voulez changer cela, vous pouvez masquer la barre d’outils WordPress pour certains rôles d’utilisateurs.

Cet exemple masquerait la barre d’outils d’administration pour les comptes ayant le rôle d’auteur ou autrice.

```php
// functions.php

add_filter( 'show_admin_bar', function($show) {
  if ( current_user_can( 'author' ) ) {
    return false;
  }
  return $show;
});
```

### Limiter les révisions WordPress par type de publication

Pour éviter d’encombrer la base de données de votre site, vous pouvez limiter le nombre de révisions d’articles à enregistrer.

L'extrait de code qui suit vous permet de le faire. Pour l’adapter à vos besoins, remplacez le type de publication (« post » dans cet exemple) par le type de publication que vous souhaitez contrôler et le nombre (« 5 » dans cet exemple) par le nombre de révisions que vous souhaitez stocker.

```php
// functions.php

function limit_revisions_by_type( $revisions, $post ) {

  if( 'post' == $post->post_type ) {
    $revisions = 5;
  }

  return $revisions;

}

add_filter( 'wp_revisions_to_keep', 'limit_revisions_by_type', 10, 2 );
```

### Désactiver la fonction de recherche de WordPress

Si votre site n’a pas besoin d’une fonction de recherche, vous pouvez désactiver la fonction de recherche de WordPress afin d’éviter tout abus potentiel.

Par exemple, même si vous n’affichez pas de champ de recherche sur votre site, les robots peuvent toujours utiliser la fonction de recherche en ajoutant ?s=[terme de recherche] à votre URL.

Pour cela, vous pouvez ajouter l’extrait de code suivant :

```php
// functions.php

function disable_wp_search( $query, $error = true ) {

  if ( is_search() ) {
    $query->is_search = false;
    $query->query_vars[s] = false;
    $query->query[s] = false;

  // si erreur
  if ( $error == true )
    $query->is_404 = true;
  }
}

add_action( 'parse_query', 'disable_wp_search' );
add_filter( 'get_search_form', create_function( '$a', "return null;" ) );
```

Si quelqu’un essaie d’utiliser la fonction de recherche directement, votre site renverra une page 404.

### Créer vos propres codes courts personnalisés

Les codes courts de WordPress sont des raccourcis très pratiques qui vous permettent d’intégrer du contenu dynamique dans votre site.

Alors que de nombreuses extensions WordPress s’appuient sur les codes courts pour renforcer leurs fonctionnalités, vous pouvez également créer vos propres codes courts personnalisés en utilisant le fichier  functions.php et la fonction add_shortcode().

Par exemple, un cas d’utilisation courant est la création d’un code court qui affiche l’année en cours. Cela vous permet d’afficher automatiquement l’année en cours dans tout votre contenu sans avoir à tout mettre à jour manuellement chaque ann&e.

Pour créer un tel code court, vous pouvez utiliser le code suivant :

```php
// functions.php

function year_shortcode() {
  $year = date('Y');
  return $year;
}

add_shortcode('currentyear', 'year_shortcode');
```

Ensuite, lorsque vous ajoutez le shortcode [currentyear] à votre contenu, il sera automatiquement remplacé par l’année actuelle, par exemple 2024.

### Autoriser les codes courts dans les titres d’articles 

Par défaut, WordPress n’exécute pas les codes courts que vous placez dans le champ du titre de votre article. Si vous souhaitez utiliser des codes courts dans les titres de vos articles, vous pouvez activer cette fonctionnalité en ajoutant un simple extrait de code dans le fichier functions.php de votre thème.

Par exemple, combiné à l’extrait de code précédent, il vous permettrait d’inclure automatiquement l’année en cours dans le titre de l’article en ajoutant le code court [currentyear].

```php
// functions.php

add_filter( 'the_title', 'do_shortcode' );
```

### Masquer les erreurs de connexion pour améliorer la sécurité

Par défaut, WordPress affiche un message explicatif lorsque les tentatives de connexion échouent. Ce message peut révéler certaines informations, comme le fait qu’une certaine adresse e-mail est enregistrée sur votre site (même si le mot de passe est incorrect).

Pour éviter de divulguer des informations potentiellement sensibles, vous pouvez masquer ces erreurs de connexion en ajoutant l’extrait de code suivant à votre fichier functions.php.

```php
// functions.php

function hide_login_errors(){
  return 'Identifiant ou mot de passe incorrect';
}

add_filter( 'login_errors', 'hide_login_errors' );
```

Cet extrait de code remplace le texte d’erreur de connexion par défaut par le message suivant : *Identifiant ou mot de passe incorrect*.

Vous pouvez personnaliser le texte en fonction de vos préférences, mais évitez d’utiliser des tirets, des barres obliques ou d’autres caractères, car cela pourrait provoquer des erreurs.

### Modifier la longueur de l’extrait
Par défaut, l’extrait WordPress affiche les 55 premiers mots d’un article.

Si vous souhaitez modifier cette longueur, vous pouvez ajouter l’extrait de code suivant au fichier functions.php.

```php
// functions.php

function change_excerpt_length($length) {
  return 90;
}
add_filter('excerpt_length', 'change_excerpt_length');
```

L’extrait de code ci-dessus modifiera la longueur de l’extrait à 90 mots. remplacer « 90 » par le nombre exact de mots que vous souhaitez utiliser.

### Supprimer le numéro de version de WordPress

Pour que les acteurs malveillants aient plus de mal à détecter la version de WordPress que vous utilisez, certains utilisateurs préfèrent supprimer le numéro de version de WordPress dans le code frontend de votre site.

Pour cela, vous pouvez ajouter le code suivant à votre fichier functions.php.

```php
// functions.php

function hide_version() {
  return '';
}

add_filter('the_generator', 'hide_version');
```

### Modifier le nombre de résultats à inclure sur la page de recherche

WordPress vous donne une option dans le tableau de bord pour contrôler combien d’articles sont listés sur les pages d’archives (*Réglages → Lecture*).

Cependant, cette option modifie le nombre d’articles pour toutes les pages d’archives. Que faire si vous souhaitez simplement utiliser un nombre différent pour la page de résultats de recherche ?

Pour cela, vous pouvez ajouter cet extrait à votre fichier functions.php – assurez-vous de remplacer le nombre (« 15 » dans cet exemple) par le nombre réel de résultats que vous souhaitez afficher avant de paginer les résultats supplémentaires.

```php 
// functions.php

function search_results_list() {
  if ( is_search() )
    set_query_var('posts_per_archive_page', 15);
}

add_filter('pre_get_posts', 'search_results_list');
```

### Ajouter la prise en charge du téléversement pour les types de fichiers (par exemple SVG)

Par défaut, WordPress vous empêche de téléverser certains types de fichiers, tels que les fichiers SVG.

Pour activer la prise en charge de ces types de fichiers bloqués, vous pouvez ajouter l’extrait de code suivant au fichier functions.php de WordPress :

```php
// functions.php

function add_myme_types($mime_types){
  $mime_types['svg'] = 'image/svg+xml';
  return $mime_types;
}
add_filter('upload_mimes', 'add_myme_types', 1, 1);
```

Cet extrait de code ne permet que le téléversement de fichiers SVG, mais vous pouvez le modifier pour ajouter la prise en charge d’autres types de fichiers si nécessaire.

### Masquer les alertes de mise à jour de WordPress pour les non-administrateurs

Par défaut, WordPress affiche des messages à tous les utilisateurs ayant accès au tableau de bord lorsqu’une nouvelle mise à jour est disponible.

Même si le rôle d’un utilisateur ne lui permet pas d’appliquer la mise à jour, le message du tableau de bord lui dira de contacter l’administrateur.

Pour remédier à cette situation, vous pouvez utiliser cet extrait de code pour masquer les notifications de mise à jour pour tous les utilisateurs qui ne sont pas administrateurs :

```php
// functions.php

function hide_update_nag() {
  if ( ! current_user_can( 'update_core' ) ) {
    remove_action( 'admin_notices', 'update_nag', 3 );
  }
}

add_action('admin_menu','hide_update_nag');
```

### Modifier la qualité de l’optimisation automatique des JPEG 

Bien que tout le monde ne connaisse pas cette fonctionnalité, WordPress compresse automatiquement les images JPEG lors de la création de miniatures pour votre site après que vous ayez téléversé des images.

Depuis WordPress 4.5, WordPress a fixé le niveau de qualité par défaut à 82 (100 étant une compression nulle).

Si vous souhaitez augmenter ou diminuer ce niveau de qualité, vous pouvez ajouter l’extrait de code suivant à votre fichier functions.php – assurez-vous de remplacer le nombre (« 90 » dans cet exemple) par le niveau de qualité que vous souhaitez utiliser :

```php
// functions.php

add_filter( 'jpeg_quality', create_function( '', 'return 90;' ) );
```

## Meilleures pratiques pour l’organisation de votre fichier functions.php de WordPress

Si vous n’utilisez le fichier functions.php de WordPress que pour ajouter quelques extraits de code, vous n’avez probablement pas besoin de vous préoccuper de l’organisation.

Mais si vous ajoutez beaucoup d’extraits de code à votre site, il peut rapidement devenir lourd et complexe si vous ne suivez pas les meilleures pratiques d’organisation du fichier functions.php.

**Voici quelques bonnes pratiques pour organiser vos extraits de code.**

### Ajoutez des commentaires de code pour tout expliquer

Lorsque vous ajoutez pour la première fois un extrait de code à votre fichier functions.php, vous savez exactement ce qu’il fait et pourquoi vous l’avez ajouté. Mais lorsque vous regardez à nouveau le fichier functions.php un an plus tard, les choses ne sont peut-être pas aussi claires.

Pour éviter cela, vous devez ajouter des commentaires de code à chaque extrait qui expliquent ce que fait l’extrait et pourquoi vous l’avez ajouté.

Les commentaires de code sont du texte qui n’est pas exécuté par PHP, mais que les utilisateurs humains peuvent lire pour comprendre ce que fait l’extrait de code.

Pour ajouter un commentaire de code d’une seule ligne, vous pouvez utiliser ce format :

```php 
// This is a single-line code comment 
```

Pour ajouter un commentaire de code sur plusieurs lignes, vous pouvez utiliser ce format :

```php 
/**
* This is a code comment that spans multiple lines
* This text is also in the same comment
* This is the last line in the code comment
*/
```

> Commenter son code est une bonne pratique à appliquer dans tous vos développements !!!


### Utilisez les fichiers inclus pour séparer le code dans différents fichiers 

Si vous avez vraiment beaucoup de code à ajouter dans le fichier functions.php, vous pouvez les stocker dans des fichiers séparés au lieu d’utiliser uniquement le fichier functions.php.

Ensuite, vous pouvez inclure ces extraits de code dans le fichier functions.php en utilisant include ou require.


## Résumé

Le fichier WordPress functions.php est un fichier spécifique à un thème qui vous permet d’ajouter des fonctionnalités à votre thème et/ou de modifier le comportement de Wordpresss.

Si vous souhaitez ajouter des extraits de code au fichier functions.php, vous devriez toujours utiliser un thème enfant afin que vos modifications ne soient pas écrasées lorsque vous mettez à jour votre thème. Nous vous recommandons également de sauvegarder votre site avant d’ajouter des extraits de code et de les tester sur un site de staging dans la mesure du possible.

Au lieu d’utiliser le fichier functions.php, vous pouvez également envisager de créer votre propre extension personnalisée pour héberger vos extraits de code.

Maintenant que vous savez comment fonctionne le fichier functions.php de WordPress, vous pouvez commencer à personnaliser votre site de toutes sortes de façons utiles.

Les exemples de code pour le fichier functions.php ci-dessus vous donnent de bons points de départ, mais il n’y a pas de limite à ce que vous pouvez faire.
