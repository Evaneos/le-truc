---
title: Eviter de charger les polyfill inutiles grâce à composer
summary: "Supprimer les polyfill inutiles"
tags:
    - PHP
    - Composer
    - Symfony
---

Symfony ajoute des polyfill pour des histoires de compatibilité, sans que ça ne soit forcément utile. Si vous êtes en 7.2 vous pouvez éviter de charger les polyfills vous pouvez ajouter la section "replace" dans composer :

```
    "replace": {
      "symfony/polyfill-iconv": "*",
      "symfony/polyfill-php71": "*",
      "symfony/polyfill-php72": "*",
      "symfony/polyfill-php70": "*",
      "symfony/polyfill-php56": "*",
      "symfony/polyfill-mbstring": "*",
      "symfony/polyfill-intl-icu": "*"
   }
```

Enfin il suffit de jouer la commande `composer update` afin de les supprimer. A vous d'ajuster les polyfill à supprimer en fonction de votre version.
