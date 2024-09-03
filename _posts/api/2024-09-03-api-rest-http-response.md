---
title: "API Rest: Les réponses HTTP"
date: 2024-09-03 06:45:00 +0000 
categories: api
tags: web api rest 
author: mdevoldere
--- 

Une API peut prendre en charge plusieurs types de réponse. Il est préférable d'utiliser un type de contenu JSON par défaut. Lorsqu'une API prend en charge plusieurs types de contenu, le client peut spécifier le type de contenu souhaité avec l'en-tête `Accept`.

Le tableau suivant présente une liste des types de contenu courants :

| Type de contenu | Description |
| --- | --- |
| application/json | Par défaut. Type de contenu pour un corps de réponse JSON. |
| application/xml | Type de contenu pour un corps de réponse XML. Doit être utilisé lorsque le XML est illisible par les utilisateurs occasionnels. |
| texte/xml | Type de contenu pour un corps de réponse XML. Doit être utilisé lorsque le XML est lisible par les utilisateurs occasionnels. |


Lorsque des détails supplémentaires sont nécessaires dans une réponse d'erreur, l'API doit utiliser des erreurs définies par l'application et les fournir dans un objet d'erreur dans le corps de la réponse.

Dans le RFC3023 de XML, il est indiqué que cela text/xml est destiné au contenu XML qu'un utilisateur occasionnel est capable de lire, alors que application/xml est préféré lorsque le contenu XML est illisible par un utilisateur occasionnel.

## Codes d'état HTTP

Les API REST doivent utiliser les codes de statut HTTP pour donner aux clients le résultat le plus approprié du traitement de la demande.

Une API doit au moins utiliser les codes d’état HTTP suivants pour les méthodes HTTP correspondantes :

| Code | Signification | GET | POST | PUT | PATCH | DELETE |
| --- | --- | --- | --- | --- | --- | --- |
| 200 | OK | X |  | X | X | X |
| 201 | Created |  | X |  |  |  |
| 202 | Accepted |  | X | X | X |  |
| 204 | No Content | X |  | X | X | X |
| 303 | See Other |  | X |  |  |  |
| 400 | Bad Request |  | X | X | X |  |
| 401 | Unauthorized | X | X | X | X | X |
| 403 | Forbidden | X | X | X | X | X |
| 404 | Not Found | X | X | X | X | X |
| 500 | Server Error | X | X | X | X | X |


## Général

- `401` doit être renvoyé lorsque le client ne parvient pas à s'authentifier.
- `403` doit être renvoyé lorsque le client est authentifié mais ne dispose pas de l'autorisation nécessaire pour effectuer l'opération.
- `404` doit être renvoyé lorsque le chemin statique de la requête n'existe pas sur le serveur.
- `500 `doit être renvoyé lorsque le serveur rencontre une erreur inattendue, de préférence avec un objet d'erreur .

## GET

Pour récupérer une ressource ou un ensemble de ressources.

`200`doit être renvoyé en cas de succès. Si une collection demandée est vide ou si l'utilisateur n'a pas l'autorisation d'y accéder, 200elle doit quand même être renvoyée avec un tableau vide.

`204` doit être renvoyé lorsque l'url statique demandée existe mais qu'aucune ressource n'existe ou que l'utilisateur n'a pas l'autorisation d'y accéder.


## POST

Pour créer une ressource.

- `201` doit être renvoyé lors de la création de la ressource. Le corps de la réponse doit contenir la ressource créée.
- `202` doit être renvoyé lorsque la demande a été acceptée pour traitement mais n'a peut-être pas encore été traitée ou complétée.
- `303` doit être renvoyé si la ressource existe déjà sur le serveur de ressources. La réponse doit contenir l'entête `Location` contenant l'URI de la ressource existante.
- `400` doit être renvoyé si la demande n'est pas valide, c'est-à-dire si la ressource existe déjà ou contient des champs non valides.

## PUT

Pour mettre à jour une ressource existante.

- `200` ou `202` doit être renvoyé lorsque la ressource est mise à jour avec succès. Le corps de la réponse doit contenir la ressource mise à jour.
- `204` doit être renvoyé lorsque la ressource n'est pas trouvée ou que l'utilisateur n'a pas l'autorisation de la mettre à jour.
- `400` doit être renvoyé lorsque la demande est invalide, c'est-à-dire que la ressource contient des champs invalides ou que le format de données est incorrect.

## PATCH

Pour effectuer une mise à jour partielle sur une ressource.

- `200` ou `202` doit être renvoyé lorsque la ressource est mise à jour avec succès. Le corps de la réponse doit contenir la ressource mise à jour.
- `204` doit être renvoyé lorsque la ressource n'est pas trouvée ou que l'utilisateur n'a pas l'autorisation de la mettre à jour.
- `400` doit être renvoyé lorsque la demande est invalide, c'est-à-dire que la ressource contient des champs invalides.

## DELETE

Pour supprimer une ressource.

- `200` doit être renvoyé lorsque la ressource est supprimée et qu'un contenu est nécessaire dans la réponse.
- `204` doit être renvoyé lorsque la ressource est supprimée, n'existe pas ou que l'utilisateur n'a pas l'autorisation de la supprimer et qu'il n'y a aucun contenu en réponse.

## Différences entre 204 et 404

Le code **204** indique que l'URI demandée est valide (correspond à une route de l'API) mais qu'aucune ressource correspondante n'existe en base de données.

Le code **404** peut être utilisé lorsque l'URI demandée ne correspond à aucune route de l'API.

