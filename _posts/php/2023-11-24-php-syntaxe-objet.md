---
title: "PHP: La syntaxe objet"
date: 2023-11-24 10:00:00 +0000 
categories: php
tags: php objet 
author: mdevoldere
--- 

L'objet est un paradigme de programmation très répandu et qui a fait ses preuves dans de nombreux projets. Son utilisation n'apporte pas de fonctionnalités au langage, c'est à dire que tout ce que l'on peut faire en utilisant la programation orientée objet peut être fait sans, cependant l'objet apporte beaucoup de choses en termes de maintenance, factorisation et découpage de code, travail collaboratif ou encore en conception. 

Toutes ces qualités font de l'objet un mécanisme indispensable à maîtriser pour tout développeur PHP. D'ailleurs, presque toutes les bibliothèques et frameworks que vous serez amenés à utiliser se basent sur le paradigme objet.

Cet article montre des exemples qui vous permettront de prendre en main la syntaxe Objet de PHP.

## Classes et instanciation d'objet

```php
<?php
class User
{
    private string $name;

    public function __construct(string $name)
    {
        $this->name = $name;
    }

    public function sayHello(): void
    {
        echo 'Hello, I am '.$this->name."!\n";
    }
}
```

**Remarquez que:**

- Les attributs sont fortement typés.
- Les modifieurs `private` , `protected` et `public` sont présents, comme dans beaucoup d'autres langages.
- Le constructeur se définit à l'aide de la fonction magique `__construct()`.
- Les attributs et méthodes de classes sont accessibles par l'opérateur `->` (comme en C++) , le point étant réservé pour la concaténation de chaines.
- Le type de retour d'une méthode reprend la syntaxe de la notation UML.

Un objet de cette classe s'instanciera alors de la manière suivante:

```php
<?php
$user = new User('Bob');
$user->sayHello(); // affiche "Hello, I am Bob !"
```

## Méthodes et attributs statiques

En PHP, il est possible de rendre des attributs et/ou méthodes statiques à l'aide du modifier "static".

Par convention, un attribut statique est directement initialisé avec une valeur.

Pour rappel, un attribut ou une méthode statique ne requiert pas la création d'une instance pour être utilisé. Ils ne sont pas spécifiques à une instance.

```php
<?php
class Example
{
    public static $counter = 0;

    public int $number;

    public function __construct()
    {
        // chaque instance créée incrémente $counter de 1.
        $this->number = ++Example::$counter;
        // ou 
        // $this->number = ++self::$counter;
    }
}

$a = new Example(); 
echo $a->number."\n"; // 1

$b = new Example(); 
echo $b->number."\n"; // 2

// appel d'un attribut statique
echo Example::$counter; // 2
```
Dans l'exemple ci-dessus, l'attribut `$counter` n'est pas répété dans `$a` et dans `$b` mais n'est présent qu'une seule fois, ce qui explique que les valeurs sont différentes à l’affichage.

## Héritage 

Pour déclarer un héritage, le mot clé `extends` est utilisé (comme en Java)

```php
<?php
class A
{
    public int $a = 12;
}

class B extends A // La classe B hérite de A
{
    public int $b = 34;
}

$b = new B();
echo $b->a; // 12
echo $b->b; // 34
```

### Accès à la classe "mère"

L'accès aux méthodes et aux attributs de la classe mère peut se faire à l'aide du mot clé `parent` et l'opérateur de résolution de portée `::`.


```php
<?php
class Rectangle
{
    protected int $width;
    protected int $height;

    public function __construct(int $width, int $height)
    {
        $this->width = $width;
        $this->height = $height;
    }
}

class Square extends Rectangle
{
    public function __construct(int $width)
    {
        // Appel du constructeur parent
        parent::__construct($width, $width);
    }
}
```

### Classes Abstraites 

PHP vous permet de déclarer des classes ou des méthodes comme abstraites à l'aide du mot clé `abstract`. Si au moins une méthode d'une classe est abstraite, ou que la classe est marquée elle même comme abstraite, elle ne pourra pas être instanciée.


```php
<?php
abstract class Message
{
    abstract public function getName(): string;
    abstract public function getBody(): string;

    public function display(): void
    {
        echo 'From: '.$this->getName()."\n";
        echo 'Contents: '.$this->getBody()."\n";
    }
}

$m = new Message(); // Erreur, une classe abstraite ne peut pas être instanciée
```

### Méthodes et classes "finales"

Il est possible d'utiliser le mot clé `final` sur une classe ou une méthode afin d'en empêcher la surcharge.

```php
<?php
class A
{
    public final function maFonction(): int
    {
        return 42;
    }
}

class B extends A
{
    // erreur, cette méthode ne peut être surchargée
    public function maFonction(): int 
    {
        return 30; 
    }
}
```

### Interfaces 

En PHP, les interfaces se déclarent comme une classe à l'aide du mot clé « interface » , elles ne contiennent que des prototypes de méthodes. Une classe peut implémenter une ou plusieurs interfaces avec la notation :
 `maClasse implements nomInterface`

```php
<?php
interface CanSpeak
{
    public function speak(): void;
}

// La classe Human doit implémenter les méthodes déclarées dans l'interface Canspeak
class Human implements CanSpeak
{
    public function speak(): void
    {
        echo "I am Human!\n";
    }
}

$human = new Human();
$human->speak(); // Affiche "I am Human!"
```


### Remarques sur l'héritage

**Il n'y a pas d'héritage multiple en PHP.**

Par ailleurs, PHP ne supporte pas la surcharge (méthodes ayant le même nom mais des prototypes différents). Vous pouvez cependant utiliser des paramètres optionnels, voici un exemple illustrant un argument optionel ayant une valeur par défaut:

```php 
<?php
class A
{
    public function f(int $x = 42): void
    {
        echo "x = $x";
    }
}

$a = new A;

$a->f();  // x = 42
$a->f(67);  // x = 67
```

## Exceptions 

Comme la plupart des langages orienté objet, PHP propose un mécanisme d'exceptions permettant d'affiner la
gestion d'erreur. Par défaut, une exception remontera jusqu'à être disposée sous forme d'erreur:

```php
<?php
throw new Exception('Erreur, ça a planté !');

// Donnera lieu à :

/*
PHP Fatal error: Uncaught exception 'Exception' with message 'Erreur, ça a planté !' in index.php:2
Stack trace:
#0 {main}
thrown in index.php on line 2
*/
```

### Try / Catch 

Il est possible de capturer les exceptions grâce aux mots clés `try` et `catch` :

```php
<?php 
class MaSuperClass 
{
    public function estMajeur(int $age): bool 
    {
        if($age < 18) {
            throw new Exception("Interdit aux mineurs");
        }

        return true;
    }
}

try
{
    $maClasse = new MaSuperClasse();
    $maClasse->estMajeur(17); // soulève une erreur
}
catch (Exception $e) // on attrappe l'erreur
{
    echo 'Erreur: ' .$e->getMessage() . "\n"; // affiche "Erreur: Interdit aux mineurs"
}
```
### Exceptions personnalisées 

PHP vous offre également la possibilité de surcharger les classes d'exception, dont `Exception` est la "racine" pour créer vos propres types d'exceptions.

```php
<?php
class MyException extends Exception
{
}

try
{
    throw new MyException();
} 
catch (MyException $my) 
{
    echo "MyException\n";
} 
catch (Exception $e) 
{
    echo "Exception\n";
}

```

Les exceptions peuvent être capturées avec un certain ordre de priorité.


## Problèmes fréquents 

### Références 

Lorsque l'on passe un objet en argument d'une fonction, on ne passe pas une copie de cette objet mais une référence vers l'objet (à ne pas confondre avec une référence vers la variable qui décrit l'objet). Ainsi, toute modification se fera directement sur l'objet.


```php
<?php
class MaClasse
{
    public $attr = 1;
}

function maFonction(MaClasse $a): void
{
    $a->attr = 2;
}

$a = new MaClasse();

echo $a->attr; // 1

maFonction($a); // la fonction modifie l'attribut de l'objet

echo $a->attr; // 2
```

### Attention aux références !!!

Attention à ne pas confondre référence vers un objet et référence entre les variables, regardons l'exemple suivant: 

```php
<?php
class A
{
    public $attr = 1;
}

$a = new A;
$b = $a; // $b et $a référencent le même objet
$b->attr = 2;
echo $a->attr; // 2

$b = null; // la référence de $b vers l'objet est détruite. $a reste inchangé.
echo gettype($a); // object

$c = &$a; // $c est une référence vers $a
$c = null; // $si on détruit $c, $a est également détruit.
echo gettype($a); // null
```

Dans ce cas, la ligne `$b = $a` fait en sorte que la variable `$b` référence le même objet que `$a`. 

Ainsi la modification de l'attribut sur `$b->attr` est aussi visible sur `$a->attr` (c'est le même objet). 

En revanche, la variable `$b` est bien différente de `$a`, c'est pourquoi l'affecter à `null` ne change pas la valeur de `$a`.

Par contre, l'utilisation de l'opérateur de référence `&` pour créer la variable `$c` fait en sorte que `$c` soit un alias de `$a`, il
référencera alors non pas seulement le même objet mais aussi la même variable. De ce fait, détruire `$c` détruira également `$a`.


## Clonage d'objets 

Si vous souhaitez créer une copie d'un objet, vous pouvez utiliser le mécanisme de clonage de cet objet. PHP vous propose pour cela d'utiliser le mot clé `clone`.

```php
<?php
class A
{
    public $attr = 1;
}

$a = new A;
$a->attr = 5;
$b = clone $a; // $b est un clone, donc un objet distinct de $a
$b->attr = 6;

echo $a->attr."\n"; // 5
echo $b->attr."\n"; // 6
```

### Clonage personnalisé 

Le comportement du clonage peut cependant être non trivial et soulève souvent des questions: 

- Faut-il cloner également les objets référencés ? 
- Est-ce que toute les propriétés doivent être clonées ? 

Pour répondre à ces questions, il vous est possible d'écrire votre propre méthode de clonage, avec le nom "magique" `__clone()`:

[Plus d'info sur le clonage personnalisé en PHP](https://www.php.net/manual/fr/language.oop5.cloning.php)


## Les espaces de noms

Souvent, la création de classes et d'interfaces engendre un problème de nommage, car il peut devenir difficile d'éviter les problèmes de collisions de noms (deux classes ayant le même nom). Depuis PHP 5.3, il est possible d'utiliser des espaces de nom (namespace) pour éviter ce problème.

Par exemple, si le fichier alice/image.php contient:

```php
<?php
namespace Alice;

class Image
{
    // Code de la classe
}
```

On pourra l'utiliser comme cela:

```php 
<?php
require 'alice/image.php';

use Alice\Image;

$image = new Image;
```

Ainsi, la classe de `Alice` ne "pollue" pas l'espace de nom global mais est disponible sous `Alice\Image` , si quelqu'un d'autre souhaite écrire un classe de gestion d'images, il pourra le faire en utilisant un autre espace de nom.


### Multiples classes du même nom 

Si Bob écrit à son tour une classe `Image` et la place sous l'espace de noms `Bob\Image`, il sera possible d'utiliser les deux soit à l'aide de la déclaration entière du nom des classes.

```php
<?php
$a = new Alice\Image;
$b = new Bob\Image;
```

soit en important la ou les classe(s) à l'aide du mot clé `use`, par défaut, le nom de la classe (ici, `Image`) sera un raccourci vers son emplacement complet (ici, `Alice\Image` ):

```php
<?php
use Alice\Image;
$a = new Image;
$b = new Bob\Image;
```

Enfin, le mot clé `as` permet de donner un nom de substitution (ou alias) à la classe dans le fichier courant:

```php
<?php
use Bob\Image as BobImage;
use Alice\Image as AliceSuperImage; // AliceSuperImage est un alias de Alice\Image
$a = new AliceSuperImage;
$b = new BobImage;
```


## Tests d'instance 

Il est possible de tester qu'un objet est bien l'instance d'une classe en PHP à l'aide du mot clé `instanceof`:

```php
<?php
interface P {};
class A {};
class B extends A {};
class Q implements P {};
$a = new A;
$b = new B;
$q = new Q;
var_dump($a instanceof A); // true
var_dump($b instanceof A); // true
var_dump($a instanceof B); // false
var_dump($q instanceof A); // false
var_dump($q instanceof P); // true
```

Notez que si l'objet testé est l'instance d'une classe fille de la classe passée, `instanceof` retournera vrai, comme par exemple pour l'expression `$b instanceof A` ci-dessus.

Ce système fonctionne également pour tester si un objet implémente une interface, comme avec `$q instanceof P` ci-dessus.


### Crédits 

[https://php.net](https://php.net )
[https://gregwar.com/php/programmation-orientee-objet.html](https://gregwar.com/php/programmation-orientee-objet.html)
