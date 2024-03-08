---
title: "Créer une API Rest avec ASP.NET Core"
date: 2024-03-07 10:00:00 +0200 
categories: asp api dotnet
---

Dans cet article, vous apprendrez à créer une API avec ASP.NEt (.net6) et Visual Studio 2022. 

Pas à pas, cet article vous amènera à créer une API de gestion de Pays et de Villes.


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

## Création du contexte de base de données 

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
`
Cette ligne ajoute le CountryDbcontext créé précédemment à la liste des services disponibles dans l'application. Sans cette ligne, le CountryDbcontext ne sera pas reconnu à l'exécution.

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

- TODO 

## Les relations OneToMany

- TODO