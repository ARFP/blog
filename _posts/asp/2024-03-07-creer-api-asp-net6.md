---
title: "Créer une API Rest avec ASP.NET Core"
date: 2024-03-07 10:00:00 +0200 
categories: asp api dotnet
---

Dans cet article, vous apprendrez à créer une API avec ASP.NEt (.net6) et Visual Studio 2022. 

Pas à pas, cet article vous amènera à créer une API de gestion de Pays et de Villes en utilisant l'approche `Code First`.

L'approche `Code First` permet de définir le modèle de données en utilisant du code `C#` et de générer ensuite la base de données à partir de ce modèle. Cette approche est complémentaire au `Domain Driver Developement` (DDD) qui est une méthodologie de conception qui met l'accent sur le domaine métier et sur la création d'un modèle de données riche et précis.

- Le Domain Driver Development se concentre sur la conceptualisation du domaine métier
- L'approche Code First est utilisée pour implémenter le domaine métier conçu selon les principes du DDD.


## Procédure pour créer le projet

1. Ouvrir Visual Studio Community
2. Créer un projet `ASP.NET Core Web API`
3. Nommez le projet `ApiPays`
4. Sélectionner la version la plus récente du framework .NET
5. Cocher la case `Use controllers`
6. Cocher la case `Enable OpenAPI support`
7. Ajouter les packages Nuget à votre projet: 
    - `Microsoft.EntityFrameworkCore.Tools`
    - `Microsoft.EntityFrameworkCore.Design`
    - `Microsoft.EntityFrameworkCore.SqlServer`
    - `Microsoft.EntityFrameworkCore.SqlServer.Design`

## Créer les Entités

> [Tutoriel : Créer des entités](https://www.entityframeworktutorial.net/efcore/create-entities.aspx)

Dans le projet, créer un répertoire `Entity` où seront placées nos classes métier.

Dans ce répertoire, créer une classe `Country` qui représentera un pays.

Code de la classe `Country` : 

```csharp
// Entity/Country.cs
public class Country
{
    public int Id { get; set; }

    public string Code { get; set; }

    public string Name { get; set; }
}
```

Une `entité` est une classe métier qui servira de `modèle` pour la création d'une table correspondante en base de données. Dans notre cas, la classe `Country` sera convertie en table lorsque nous demanderons à `EntityFramework` de synchroniser nos entités avec la base de données. Ce point sera développé dans la suite de cet article.

`EntityFramework` reconnaitra la propriété `Id` comme la future clé primaire de la table. Dans la convention d'EntityFramework, nous aurions pu nommer la propriété `CountryId` qui aurait également été reconnue comme clé primaire.

## Créer le contexte de base de données 


> [Tutoriel: Créer le contexte de base de données](https://www.entityframeworktutorial.net/efcore/entity-framework-core-dbcontext.aspx)

Lorsque nos entités sont créées, nous pouvons créer le contexte de base de données. Il s'agit d'une classe dont le rôle sera d'interagir avec la base de données. 


Dans votre projet, créer un dossier `Database`. Dans ce répertoire , créer une classe `CountriesDbContext` qui contient le code suivant : 

```csharp
// Database/CountryDbcontext.cs
using ApiPays.Entity;
using Microsoft.EntityFrameworkCore;

namespace ApiPays.Database
{
    public class CountriesDbContext : DbContext
    {
        public DbSet<Country> Countries { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=(LocalDb)\\mssqllocaldb;Database=db_countries");
        }
    }
}
```

La classe doit obligatoirement hériter de la classe `DbContext` qui se trouve dans l'espace de noms `Microsoft.EntityFrameworkCore`.

Les entités qui doivent être synchronisées avec la base de données doivent être référencées dans une propriété de type `DbSet<>` au sein de notre contexte de base de données (ici `CountriesDbContext`).

Notre entité `Country` est ici référencée à la ligne 

```csharp 
public DbSet<Country> Countries { get; set; }
``` 

Le nom de la propriété sera le nom de la table qui sera créee dans la base de données.

Le contexte de base de données doit également connaitre les informations de connexion à la base de données. Ces informations sont précisées dans la méthode surchargée `OnConfiguring`.

```csharp
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
{
    optionsBuilder.UseSqlServer("Server=(LocalDb)\\mssqllocaldb;Database=db_countries");
}
```

**optionsBuilder.UseSqlServer:** la base de données sera SqlServer. 

**Server=(LocalDb)\\mssqllocaldb;Database=db_countries:** c'est la chaine de connexion au serveur local de Visual Studio. Il s'agit d'une instance de SQLServer Express intégrée à Visual Studio. Cette chaine de conneixon référence l'adresse du serveur `Server=(LocalDb)\\mssqllocaldb` et le nom de la base de données `Database=db_countries`. Dans le cas d'utilisation de la base de données locale, aucune authentification n'est nécessaire.


## Référencer le contexte de base de données 

Pour être reconnu par l'application, le DbContext doit être référencé dans le fichier `Program.cs` qui se trouve à la racine du projet.

Après la ligne 

```csharp
// Program.cs
var builder = WebApplication.CreateBuilder(args);
```

Ajouter la ligne : 

```csharp
// Program.cs
builder.Services.AddDbContext<CountriesDbContext>();
```


Cette ligne ajoute le CountryDbcontext créé précédemment à la liste des services disponibles dans l'application. Sans cette ligne, le CountryDbcontext ne sera pas reconnu à l'exécution.

## Synchroniser les entités et la base de données

Lorsque des nouvelles entités ont été créées ou que les entités existantes ont été modifiées, il est nécessaire d'exécuter une `Migration`.

Une migration permet de gérer l'évolution du schéma de la base de données en synchronisant les modifications apportées au modèle de données (les entités) avec la base de données elle-même.

**Fonctionnement**

1. Comparaison du modèle de données avec la structure de la base de données
2. Génération d'un script SQL pour migrer la base de données vers le nouveau modèle
3. Exécution du script SQL pour mettre à jour la base de données

**En détails, voici comment exécuter une nouvelle migration :**

1. Ouvrir la console du gestionnaire de package Nuget
2. Sélectionner le projet sur lequel appliquer la migration (dans le menu déroulant au dessus de la console)
3. Taper la commande `add-migration nom_de_la_migration`
    - Le nom de la migration est libre et permettra de l'annuler si besoin
4. Le script SQL est généré dans le répertoire **Migrations** du projet
5. Le développeur contrôle le code de la migration pour vérifier que tout est en ordre
6. Taper la commande `update-database` pour appliquer la migration et mettre à jour la base de données vers le nouveau modèle.

A chaque fois que des modifications sont apportées aux entités (le modèle de données), il sera nécessaire d'appliquer une nouvelle migration.

## Vérifier la base de données

Vous pouvez utiliser l'explorateur d'objets SQL Server de VisualStudio acessible dans le menu `Afficher --> Explorateur d'objets SQL Server` pour parcourir la base de données et vérifier la structure des tables.


## Créer le contrôleur 

Pour exposer notre entité `Country` sur l'API; il est nécessaire de créer un contrôleur qui contiendra les différentes opérations CRUD sur l'entité : 

Procédure pour créer un contrôleur : 

1. Clic droit sur le dossier `Controllers`
2. Sélectionner `Ajouter --> Contrôleur`
3. Une fenêtre s'ouvre, sélectionner `Api` dans les options puis `Contrôleur d'API avec actions, utilisant entity Framework`

![asp-api-controller](/blog/assets/img/asp-api-add-controller.jpg)

4. Le contrôleur est généré.

## Tester l'API

Enregistrer votre travail et démarrer le projet. Au démarrage, le projet est exécuté dans le navigateur web.

L'interface de Swagger s'affiche et vous devriez voir apparaitre l'entité et les opérations associées.

![asp-api-controller](/blog/assets/img/asp-api-swagger-countries.jpg)


## Les annotations 

Les annotations sont des metadonnées ajoutées au code source pour fournir des informations supplémentaires.

Dans l'approche Code First, les annotations sont utilisées pour configurer les entités et leurs attributs (format de données, validité des valeurs dans les attributs, relations entre entités...)

- [Les annotations EntityFramework](https://www.entityframeworktutorial.net/code-first/dataannotation-in-code-first.aspx)

## Les relations OneToMany

- [Les relations OneToMany avec EntityFramework](https://www.entityframeworktutorial.net/code-first/configure-one-to-many-relationship-in-code-first.aspx)

## Les relations ManyToMany

- [Les relations ManyToMany avec EntityFramework](https://www.entityframeworktutorial.net/code-first/configure-many-to-many-relationship-in-code-first.aspx)

