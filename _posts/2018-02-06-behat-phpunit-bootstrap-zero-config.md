---
title: Utiliser le même fichier bootstrap pour behat & phpunit avec 0 config sur les outils
summary: "Bootstrap de test sans configuration"
tags:
    - PHP
    - Behat
    - PHPUnit
---

Lorsque vous utilisez Behat & PHPUnit dans un même projet, vous vous retrouvez à charger le bootstrap.php qui initialise votre environement dans chacun des outils. C'est fastidieux et on finit par regarder la doc sur internet sur interet, bref une perte de temps.

Voici comment le faire sans se prendre le choux, et en plus c'est centralisé. Composer à la rescousse.

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

`composer dump-autoload` composer includera automatiquement le fichier avant de lancer les tests. Aucune config n'est requise sur nos outils de test.