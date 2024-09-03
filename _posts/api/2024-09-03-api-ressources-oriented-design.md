---
title: "API: Modélisation orientée ressource"
date: 2024-09-03 06:30:00 +0000 
categories: api
tags: web api rest 
author: mdevoldere
--- 

La structure d'une API doit suivre une conception orientée ressources, qui doit permettre des interfaces de services Web plus simples et plus cohérentes, faciles à utiliser et à entretenir. Les données (ressources) doivent contrôler la conception du service, car les données sont l'acteur clé et le service est centré sur la mise à disposition de ces données.

## Flux de conception

L'idée fondamentale est que les technologies de base, bien comprises et bien connues du Web actuel (HTTP, URI, JSON et XML) doivent être utilisées conformément à leurs principes de conception. Cela facilite la conception de services Web dotés d'interfaces simples et cohérentes, et qui sont faciles à utiliser et à entretenir. Ces services Web seront également plus faciles à optimiser pour fonctionner avec l'infrastructure existante du Web.

L'architecture orientée ressources (ROA) se compose de quatre concepts :

- Les Ressources
- Leurs noms (URI)
- Leurs représentations
- Les liens entre eux et les quatre propriétés :
    - Adressabilité
    - Apatridie
    - Connectivité
    - Une interface uniforme

Le Guide de conception suggère de suivre les étapes suivantes lors de la conception d’API orientées ressources.

- Déterminer les types de ressources fournies par une API.
- Déterminer les relations entre les ressources.
- Décider des schémas de noms de ressources en fonction des types et des relations.
- Décider des schémas de ressources.
- Associer un ensemble minimal de méthodes aux ressources. Utiliser autant que possible les méthodes standard (verbes HTTP).

## Ressources

Une API orientée ressources est généralement modélisée sous la forme d'une hiérarchie de ressources, où chaque nœud est soit une ressource simple, soit une collection de ressources. Pour des raisons pratiques, on les appelle souvent respectivement **ressource** et **collection**.

Une **collection** contient une liste de ressources du même type. Par exemple, un utilisateur possède une collection de photos.

Une **ressource** possède un état et zéro ou plusieurs sous-ressources. Chaque sous-ressource peut être soit une ressource simple, soit une collection de ressources.

Un **nom de ressource** se compose du type de la ressource, de son identifiant, du nom de ressource de son parent et du nom du service API. Le type est appelé ID de collection et l'identifiant est appelé ID de ressource . Les ID de ressource sont généralement des identifiants séquentiels ou aléatoires attribués par le service API, bien qu'il soit également possible d'accepter des ID de ressource personnalisés de la part des clients. Les ID de collection doivent être la forme plurielle du nom utilisé pour la ressource et les ID de ressource doivent être immuables.

Vous trouverez ci-dessous deux exemples de noms de ressources valides :

![capture uri](/blog/assets/img/api-resource-uri.jpg)

```
// Utilisateur

monapi.fr/v1/users/1
\_______/ | \____/ |
    |     |   |    |
    |     |   |     \
    |     |   |      Resource ID
    |     |    \
    |     |     Collection ID
    |     |        (type)
    |      \
    |      Major version
     \
     API service name
```

```
// Photo 

monapi.fr/v1/users/1/photos/1
\_______/ | \____/  \_____/ |
    |     |    |       |    |
    |     |    |       |     \
    |     |    |       |      Resource ID
    |     |    |       |        (type)
    |     |    |        \
    |     |    |         Collection ID
    |     |    |            (type)
    |     |     \
    |     |      Resource name of parent resource
    |      \
    |      Major version
     \
     API service name
```
