---
title: "JS: Stocker des données dans le navigateur"
date: 2025-02-27 06:30:00 +0000 
categories: javascript
tags: web js frontend 
author: mdevoldere
--- 


En JavaScript, il existe trois mécanismes principaux pour le stockage des données côté client : 
- Les cookies.
- Le stockage local.
- Le stockage de session. 

Chacun d'entre eux possède ses propres cas d'utilisation et caractéristiques. Nous allons ici nous concentrer sur la comparaison du stockage local et des cookies, deux méthodes de stockage couramment utilisées dans le développement Web.


## Que sont les cookies ?

Les cookies sont de petits fichiers texte qui sont stockés sur l'ordinateur de l'utilisateur et renvoyés au serveur à chaque requête HTTP. Ils contiennent jusqu'à 4 Ko de données et sont utilisés pour stocker des informations sous forme de paires **clé=valeur**. Les cookies sont un élément essentiel du Web et sont utilisés depuis de nombreuses années pour gérer les sessions des utilisateurs, les préférences et le suivi de navigation (tracking).


**Exemple : Le code ci-dessous implémente les cookies en JavaScript.**

```html
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>JavaScript Cookies</title>
</head>
<body>
    <h1>Les Cookies avec Javascript</h1>
    <h3>
        Cliquer Set Cookie button to
        set the cookie and then Get Cookie
        button to get it.
    </h3>
    <p id="result"></p>
    <button id="setBtn">Set Cookie</button>
    <button id="getBtn">Get Cookie</button>

    <script>
        const result = document.getElementById('result');
        const setBtn = document.getElementById('setBtn');
        const getBtn = document.getElementById('getBtn');

        function setCookie() {
            if(document.cookie.length !== 0){
                result.innerHTML = 
                  `Le Cookie est déjà défini !`;
            }
            else{
                document.cookie = 
                  "visiteur: Mike DEV;";
            }
            
        }

        function getCookie(){
            if(document.cookie.length !== 0){
                result.innerHTML = 
                  `Cookie: <b>${document.cookie}</b>`;
            }
            else{
                result.innerHTML = 
                  `Please set the cookie first!!`;
            }
        }

        setBtn.addEventListener('click', setCookie);
        getBtn.addEventListener('click', getCookie);
    </script>
</body>

</html>
```

Sortir:

p1-ezgifcom-optimiser
Applications des cookies :
Les cookies sont souvent utilisés pour stocker de petites quantités de données, telles que les préférences de l'utilisateur, les jetons d'authentification et les informations de session.
Ils sont également utilisés pour suivre le comportement des utilisateurs et les préférences publicitaires.
En outre, les cookies peuvent être utilisés pour stocker des données temporaires, telles que le contenu d’un panier d’achat, qui doivent persister entre les pages mais ne sont pas nécessaires pour persister entre les visites.
Qu'est-ce que le stockage local ?
Le stockage local est une méthode de stockage côté client moderne qui fait partie de la spécification HTML5. Il vous permet de stocker jusqu'à 5 Mo de données dans des paires clé-valeur et, contrairement aux cookies, il ne renvoie pas de données au serveur à chaque requête. Le stockage local persiste jusqu'à sa suppression explicite, ce qui en fait une bonne option pour enregistrer des données qui doivent rester disponibles même après la fermeture du navigateur.

Exemple : l’exemple de code ci-dessous implémente le stockage local en JavaScript.


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, 
                   initial-scale=1.0">
    <title>JavaScript closest()</title>
</head>

<body>
    <center>
        <h1>GeeksforGeeks</h1>
        <h3>
            First Click the Set storage 
            button to set the storage and
            then Get storage button to get it.
        </h3>
        <p id="result"></p>
        <button id="setBtn">
            Set Local Storage
        </button>
        <button id="getBtn">
            Get Local Storage
        </button>
        <button id="deleteBtn">
            Delete Local Storage
        </button>
    </center>

    <script>
        const result = document.getElementById('result');
        const setBtn = document.getElementById('setBtn');
        const getBtn = document.getElementById('getBtn');
        const deleteBtn = document.getElementById('deleteBtn');

        function setStorage() {
            if(localStorage.getItem("Username") !== null){
                result.innerHTML = 
                  `Storage is already settled!!`;
            }
            else{
                localStorage.setItem("Username", "Emrit Singh");
            }
            
        }

        function getStorage(){
            if(localStorage.getItem("Username") !== null){
                result.innerHTML = 
                  `Storage: <b>${localStorage.getItem("Username")}</b>`;
            }
            else{
                result.innerHTML = 
                  `Please set the storage first!!`;
            }
        }

        function delStorage(){
            if(localStorage.getItem("Username") !== null){
                localStorage.clear();
            }
            else{
                result.innerHTML = 
                  `No storage available to delete!!`;
            }
        }

        setBtn.addEventListener('click', setStorage);
        getBtn.addEventListener('click', getStorage);
        deleteBtn.addEventListener('click', delStorage);
    </script>
</body>

</html>
Sortir:

p2-ezgifcom-optimiser
Applications du stockage local :
Le stockage local est une meilleure option pour stocker de grandes quantités de données qui doivent persister entre les visites sur un site Web. Par exemple, il peut être utilisé pour stocker les préférences de l'utilisateur, les données de jeu enregistrées ou l'état de l'application. Il peut également être utilisé pour stocker des données qui doivent persister entre les pages, mais qui n'ont pas besoin d'être renvoyées au serveur à chaque demande.

Différences entre les cookies et le stockage local
Fonctionnalité	Cookies	Stockage local
Taille	4 Ko	5 Mo
Type de données	 Cordes	Tout objet JavaScript
Envoi de données au serveur	Envoyé avec chaque demande	Non envoyé avec les demandes
Expiration	Peut être configuré pour expirer à une date ou une heure spécifique	Persiste jusqu'à ce qu'il soit effacé ou supprimé manuellement
Partage entre sous-domaines	Peut être partagé entre les sous-domaines avec une configuration appropriée	Limité au domaine spécifique
Sécurité	Peut être crypté pour plus de sécurité	Pas de cryptage, mais les données stockées peuvent être cryptées par l'application
Confidentialité	Peut être désactivé par les utilisateurs dans les paramètres de leur navigateur	Non affecté par les paramètres du navigateur de l'utilisateur
Accessibilité	Disponible dans tous les navigateurs modernes	Disponible dans tous les navigateurs modernes
Performance	 Plus lent que le stockage local	Plus rapide que les cookies
API	 API simple pour les opérations de base	API plus robuste avec des opérations plus avancées
Usage	Idéal pour les petites quantités de données et pour suivre le comportement des utilisateurs	Idéal pour les grandes quantités de données qui doivent persister entre les visites
Conclusion
Lorsque vous choisissez entre le stockage local et les cookies, il est important de prendre en compte la quantité de données que vous devez stocker, ainsi que les exigences de sécurité et de confidentialité de l'application. Les cookies sont une bonne option pour les petites quantités de données qui doivent être envoyées au serveur à chaque requête, tandis que le stockage local est mieux adapté aux grandes quantités de données qui doivent persister entre les visites sur le site Web.