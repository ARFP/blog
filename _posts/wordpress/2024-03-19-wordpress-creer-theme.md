---
title: "Créer un thème Wordpress"
date: 2024-03-19 08:15:00 +0200 
categories: php wordpress 
tags: php wordpress cms html css js
---

Cet article synthétise l'essentiel pour démarrer le développement d'un nouveau thème Wordpress à partir de zéro.


## Les thèmes Wordpress: Kesako ?

Les thèmes permettent de présenter une mise en forme cohérente pour chaque page ou article publié sur un site. Ceux proposés par WordPress et sa communauté peuvent montrer certaines limites au niveau du design proposé et vous pourriez avoir envie ou besoin de disposer de votre propre thème pour personnaliser votre site en fonction de vos besoins. En créant votre propre thème, vous pourrez améliorer rapidement l’apparence de votre site :

- Styliser et ajouter un nouveau menu.
- Modifier certaines balises ou ajouter du code HTML et CSS.
- Retoucher le design.
- Personnaliser le footer.
- etc...

Si vous décidez de vous lancer dans la création d’un thème WordPress, il vous faudra veiller à retrouver un certain nombre de fonctionnalités essentielles, comme :

- L’affichage des derniers articles sur les pages d’archives et sur la page d’accueil.
- La présence d’un menu pour mettre en avant certaines pages.
- La prise en compte du responsive design pour que le thème puisse s’adapter aux différentes résolutions d’écrans.

Il est également conseillé de tester votre thème sur un environnement de développement en ligne ou sur une version en local avant de le télécharger sur votre site en production.


## Les prérequis avant de créer un thème WordPress

Avant de commencer, vous devez avoir installé WordPress et suivi les étapes nécessaires, comme l’installation des fichiers du CMS sur votre serveur et la création d’une base de données, ainsi que la configuration des réglages sur l’interface d’administration.

Il est également préférable de disposer de connaissances dans les langages web, qui permettent de faire fonctionner WordPress :

- HTML : pour la structure des contenus dans les fichiers templates.
- CSS : pour la mise en forme des articles et la gestion du design.
- Javascript : pour le dynamisme de vos pages.
- PHP : pour coder avec le langage utilisé à la fois dans le cœur du CMS et dans les fichiers de template.

Si vous n’êtes pas à l’aise avec ces différents langages, vous devez vous exercer avant de vous lancer dans le développement sur WordPress.

## Étape 1 : Créer le dossier de votre thème

Pour créer un thème WordPress, vous avez tout d’abord besoin de créer un dossier dans le répertoire de WordPress situé sur votre serveur : **wp-content/themes/**. Il est recommandé d’utiliser un nom unique et court de manière à l’identifier facilement. N’utilisez pas de caractères spéciaux, ni d’accents, ou d’espaces. Si vous le nommez par exemple « **montheme** », le chemin d’accès sera le suivant : **wp-content/themes/montheme**.

Ce dossier devra contenir à minima les trois fichiers indispensables pour le bon fonctionnement de votre site :

- Le fichier **style.css** : pour la configuration et l’ajout des règles de style.
- Le fichier **index.php** : pour l’affichage du contenu de votre site.
- Le fichier **functions.php** : pour l’ajout de fonctionnalités WordPress dans votre thème.

## Étape 2 : Créer le fichier style.css

Le premier fichier à créer est le fichier **style.css**. Il est nécessaire pour la déclaration et la configuration de votre thème. Sa présence est indispensable pour deux raisons :
1. Il va vous permettre d’ajouter votre thème dans l’interface d’administration de WordPress pour qu’il puisse être reconnu par le CMS.
2. Il va vous permettre d'ajouter des règles de style CSS pour la mise en forme de vos contenus.

Dans ce fichier style.css, vous pouvez ajouter les lignes suivantes, qui permettront à WordPress de reconnaître votre nouveau thème, en lui fournissant des informations comme son nom, celui de l’auteur, une description et son numéro de version :

```css
/*
Theme Name: Mon thème
Theme URI: https://www.example.com/monsite
Author: Nom Prénom
Author URI: https://www.example.com/monsite
Description: Une description de votre thème, en quelques mots
Version: 1.0.0
*/
```
Ces lignes doivent obligatoirement ^étre les 1ères lignes du fichier style.css.

Une fois que les premières lignes de déclaration sont saisies, vous pouvez à présent renseigner le code CSS que vous souhaitez appliquer à votre thème. C’est ici que vous pourrez déclarer le style : les couleurs d’arrière-plan ou de texte, les polices d’écriture à utiliser, etc. Voici un exemple de déclaration de styles de l’élément body :

```css
body {
  background: #FFFFFF;
  font-family: "Source Sans Pro";
  color: #4b5157;
  margin: 0 auto;
}
```

À noter que vous pouvez tout à fait déclarer d’autres feuilles de styles (fichiers .css) afin de mieux  structurer le design de votre thème et d’en faciliter la maintenance. Pour cela, il faudra les déclarer dans le fichier **functions.php** que nous découvrirons plus bas.

## Étape 3 : Créer le fichier index.php

### La hiérarchie des templates WordPress 

Les thèmes WordPress utilisent un système de templates, qui correspondent à des fichiers **.php**, dont les noms permettent au CMS de savoir quel fichier charger selon le contexte de la page à afficher. C’est ce qui s’appelle la **hiérarchie des templates**. Afin d’afficher un contenu, quel qu’il soit, WordPress aura toujours comme dernier recours l’utilisation du fichier **index.php**. C’est la raison pour laquelle il est indispensable.

![wordpress template hierarchy](/blog/assets/img/wp-template-hierarchy.png)

Le schéma de la hiérarchie des templates peut se lire de gauche à droite. Si vous souhaitez créer un fichier de template spécifique pour un type de page donnée, partez de la gauche du tableau, puis remontez progressivement vers la droite jusqu’à trouver le nom de fichier qui correspond à votre besoin.

Voici quelques exemples de pages et le chemin emprunté par WordPress pour afficher un modèle de page en fonction de celle demandée :

**Affichage de la page d’accueil** : fichier *home.php* ou *front-page.php*, ou *index.php* (par défaut)

**Affichage d’une page d’article** : *single-{post-type}-{slug}.php* (le post-type correspondant au type de publication), ou *single-{post-type}.php*, ou *single.php*, ou *singular.php*, ou *index.php* (par défaut)

**Affichage d’une page** : un modèle de page choisi lors de la rédaction de la page parmi le menu « modèle de page » (si l’option est utilisée), ou *page-{slug}.php*, ou *page-{id}.php*, ou *page.php*, ou *singular.php* ou *index.php* (par défaut)

**Affichage d’une catégorie** : *category-{slug}.php* (ex : category-news.php si le slug est news), ou *category-{id}.php*, ou *category.php*, ou *archive.php*, ou *index.php* (par défaut)

**Affichage d’un auteur** : *author.php*, ou *archive.php*, ou *index.php* (par défaut)

**Affichage d’une page datée** :  *date.php*, ou *archive.php*, ou *index.php* (par défaut)

**Affichage d’une page de résultats de recherche** : *search.php*, ou *index.php* (par défaut)

**Affichage d’une page 404** : *404.php*, ou *index.php* (par défaut).

Lors de la création de votre thème, vous avez la liberté de créer ou non l’ensemble de ces fichiers pour chaque modèle de page. Une seule exception : le fichier **index.php** doit être obligatoirement présent dans le dossier de votre thème, car c’est le fichier que WordPress charge par défaut pour afficher le modèle d’une page de votre site.

> C'est dans les fichiers template que vous ajouterez la fameuse [boucle Wordpress](https://codex.wordpress.org/fr:La_Boucle)

### Sélectionner le template le plus générique

Il est vivement conseillé de ne pas tomber dans le piège du template trop spécifique. Essayez plutôt de sélectionner un template le plus générique possible (template principal en bleu ou secondaire en vert) dans un premier temps. Si un besoin plus spécifique apparaît au cours de votre développement, il vous suffira de renommer votre template par un autre plus adapté et éventuellement d’effectuer quelques petits ajustements. En procédant ainsi, vous éviterez de dupliquer du code inutilement et cela vous facilitera la maintenance de votre thème WordPress.

### Créer les fichiers du header et du footer

Afin de factoriser (c’est-à-dire ne pas dupliquer du code inutilement) et de faciliter la lecture de votre code, il est recommandé de suivre les bonnes pratiques en créant les deux fichiers suivants :

- **header.php** : il doit appeler la fonction `wp_head()`.
- **footer.php** : il doit appeler la fonction `wp_footer()`.

Ce sont eux qui seront appelés en haut et bas de vos templates grâce aux fonctions `get_header();` et `get_footer();`. Notez que ces deux fichiers sont essentiels au bon fonctionnement de votre thème et surtout pour les futurs plugins que vous installerez. Il permettent notamment de charger les feuilles de styles et les fichiers JavaScript de vos pages.

## Étape 4 : Activer le thème WordPress

Une fois que les principaux fichiers PHP et votre feuille de style sont créés, il est maintenant temps d’activer votre thème. Pour cela, rendez-vous dans votre interface d’administration WordPress : **Apparence > Thèmes**.

Vous retrouverez dans cette section le thème que vous venez de créer. Cliquez sur le bouton **Activer** situé en bas à droite de la vignette d’aperçu.

S’il n’apparaît pas dans la liste, il convient de vérifier que tous vos fichiers PHP sont bien enregistrés dans le bon dossier **wp-content/themes/montheme/**. Dans le fichier **style.css**, vos lignes de code ne doivent pas comporter d’espace avant les deux points. N’hésitez pas à ouvrir ce fichier pour vous assurer que ce n’est pas le cas.

## Étape 5 : Créer le fichier functions.php

Autre étape importante, le fichier **functions.php** permet d’ajouter des fonctionnalités au sein de votre thème WordPress. Parmi les fonctions principales, vous aurez besoin de quelques lignes de code pour créer le menu de votre site.

### Créer un menu dans le fichier functions.php 

Pour créer une zone de menu WordPress, il suffit d’ajouter cet extrait de code dans votre fichier functions.php :

```php
function register_my_menu(){
  register_nav_menu( 'main-menu', 'Menu principal' );
}

add_action( 'after_setup_theme', 'register_my_menu' );
```

### Ajouter le menu au fichier de template

Vous devez ensuite ajouter votre zone de menu dans votre fichier de template. C’est grâce à cela que WordPress saura à quel moment il devra charger la zone et donc le menu associé à cette zone.

Pour cela, il suffit d’utiliser la fonction `wp_nav_menu()` et de l’encapsuler dans un élément <nav> pour faciliter son interprétation comme élément de navigation :
```php
<nav id="navigation">
<?php
    wp_nav_menu(
    array(
        'theme_location' => 'main-menu',
        'menu_id' => 'primary-menu',
    )
    );
?>
</nav>
```

A priori, Vous devez déclarer votre zone de menu dans le fichier **header.php** que vous avez créé précédemment. Ce fichier étant chargé sur toutes les pages de site, il est parfaitement adapté pour embarquer la déclaration d’une zone de menu.

Notez que la procédure est la même si vous souhaitez ajouter un menu de pied de page. Il faudra simplement veiller à déclarer une nouvelle zone de menu avec un nom unique, puis de répéter les étapes que nous venons de voir.

### Enregistrer le menu dans l’interface WordPress 

Rendez-vous ensuite dans la section **Apparence > Menus** de votre interface d’administration. Appuyez sur le bouton **Créer le menu**. Dans la colonne **Pages**, vous trouverez la liste des éléments dont vous disposez. Vous pouvez les faire glisser dans le bloc de droite intitulé **Structure du menu**, dans l’ordre de votre choix, pour le constituer.

Une fois que vos éléments de menu sont ajoutés et ordonnés, il est nécessaire d’associer ce menu à une zone de menu : c’est celle que nous venons de déclarer avec le bout de code ci-dessus. Vous devriez retrouver votre nom de zone de menu à côté de la mention « Afficher l’emplacement ». Cochez alors la case correspondante puis enregistrez votre menu.

### Améliorer son thème avec d’autres fonctionnalités

Vous pouvez ensuite ajouter d’autres lignes de code pour améliorer le style de votre thème et ajouter des fonctionnalités pratiques pour l’expérience utilisateur. Par exemple, vous pouvez :

- Activer la gestion des tailles d’images personnalisées,
- Activer la création automatique de la balise <title> dans l’en-tête d’une page,
- Créer une sidebar principale,
- Créer une sidebar pour le footer…

## Les starter themes et les thèmes enfants

Sachez qu’il existe également des **starter themes** pour WordPress. Il s’agit de thèmes vierges avec un design minimal et une mise en page basique (voire inexistante), qui sont conçus pour être intégralement modifiés et qui respectent les bonnes pratiques du CMS. 

Le plus populaire se nomme **underscores**, créé par Automattic, la société qui porte en grande partie le projet WordPress. Ce type de modèle permet aux développeurs de démarrer la création de leur thème à partir d’une base solide et propre pour y ajouter leurs feuilles de style et donc créer un thème unique.

Notez enfin que WordPress dispose d’un système de thèmes enfants qui héritent des fonctionnalités et du design d’un thème parent, le thème que vous avez retenu pour votre projet et que vous souhaitez adapter à vos besoins. L’objectif étant de surcharger certains éléments du thème parent tels que le style css, certains templates, tout en conservant la possibilité de le mettre à jour. Vous disposez alors d’un thème personnalisé avec un minimum d’efforts.

Attention toutefois car tous les thèmes ne sont pas totalement compatibles. Plus vous surchargerez le thème principal, plus la maintenance votre thème enfant sera complexe.
