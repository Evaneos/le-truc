---
title: Eviter de charger les polyfill inutile grâce à composer
summary: "Supprimé les polyfill inutiles"
tags:
    - PHP
    - Composer
    - Symfony
---

Si vous êtes en 7.2 vous pouvez éviter de charger de les polyfills vous pouvez ajouter la section "replace" dans composer :

```
    "replace": {
      "symfony/polyfill-iconv": "*",
      "symfony/polyfill-php71": "*",
      "symfony/polyfill-php72": "*",
      "symfony/polyfill-php70": "*",
      "symfony/polyfill-php56": "*"
   }
```

puis jouer la command `composer update` afin de les supprimer. A vous d'ajuster les polyfill à supprimer en fonction de votre version.