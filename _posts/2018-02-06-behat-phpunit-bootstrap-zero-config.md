---
title: Utiliser un fichier de configuration commun pour Behat et PhpUnit
summary: "Il est possible de regrouper la configuration pour plusieurs outils de test en utilisant un fichier de bootstrap commun."
image: /assets/2018-02-06-behat-phpunit-bootstrap-zero-config/cover/composer-autoload-code-snippet.png
tags:
    - PHP
    - Behat
    - PHPUnit
---

Lorsque l'on utilise Behat & PHPUnit dans un même projet, il peut être nécessaire de charger un même fichier `bootstrap.php` qui initialise l'environnement pour chacun des outils.

Composer à la rescousse, il nous permet d'autoloader directement le fichier en environnement de développement :

```
  "autoload-dev": {
    "psr-4": {
       ...
    },
    "files": [
      "tests/bootstrap.php" //notre fameux bootstrap
    ]
  }
```

`compose dump-autoload` permettra d'inclure directement le fichier `bootstrap.php` avant de lancer les tests. Désormais il n'est plus nécessaire de configurer les outils de tests indépendamment.
