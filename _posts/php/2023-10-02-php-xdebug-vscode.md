---
title: "PHP et XDebug avec VSCode"
date: 2023-10-06 14:30:00 +0200 
categories: php
tags: php xdebug vscode 
author: mdevoldere
--- 

Cet article explique comment utiliser XDebug avec PHP sur Visual Studio Code.

- Ouvrir un terminal et entrer : `php -i > phpinfo.txt`.
- Copier tout le contenu du fichier **phpinfo.txt** généré.
- Rendez-vous sur [xdebug.org/wizard](https://xdebug.org/wizard).
- Coller le contenu copié dans le formulaire.
- Suivre les instructions pour télécharger et renommer xdebug.
- Ajouter les lignes suivantes dans le fichier **php.ini** de votre installation PHP.

```ini
# php.ini

zend_extension = xdebug

[XDebug]
xdebug.remote_enable = 1
xdebug.remote_autostart = 1
xdebug.remote_host=localhost
xdebug.remote_port=9000
```

- Ouvrir le dossier de votre projet dans Visual Studio Code.
- Créer le fichier **.vscode/launch.json**.
- Dans ce fichier, collez le JSON suivant.


```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003
        },
        {
            "name": "Launch currently open script",
            "type": "php",
            "request": "launch",
            "program": "${file}",
            "cwd": "${fileDirname}",
            "port": 0,
            "runtimeArgs": [
                "-dxdebug.start_with_request=yes"
            ],
            "env": {
                "XDEBUG_MODE": "debug,develop",
                "XDEBUG_CONFIG": "client_port=${port}"
            }
        },
        {
            "name": "Launch Built-in web server",
            "type": "php",
            "request": "launch",
            "runtimeArgs": [
                "-dxdebug.mode=debug",
                "-dxdebug.start_with_request=yes",
                "-S",
                "localhost:0"
            ],
            "program": "",
            "cwd": "${workspaceRoot}/www/",
            "port": 9003,
            "serverReadyAction": {
                "pattern": "Development Server \\(http://localhost:([0-9]+)\\) started",
                "uriFormat": "http://localhost:%s",
                "action": "openExternally"
            }
        }
    ]
}
```

- Dans la section **Launch Built-in web server** : 
    - Adapter le dossier de l'attribut `cwd` pour le faire correspondre au dossier de lancement de votre site.
- Rendez-vous dans la section DEBUG de VSCode. 
- Selectionner **Launch Built-in web server**.
