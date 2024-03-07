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
public class Country
{
    public int Id { get; set; }

    public string Code { get; set; }

    public string Name { get; set; }
}
```




- [Tutoriel: Créer le contexte de base de données](https://www.entityframeworktutorial.net/efcore/entity-framework-core-dbcontext.aspx)