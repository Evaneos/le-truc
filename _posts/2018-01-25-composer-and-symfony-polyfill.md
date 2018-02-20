---
title: Eviter de charger les polyfills inutiles grâce à composer
summary: "Supprimer les polyfills PHP inutiles inclus par Symfony."
tags:
    - PHP
    - Composer
    - Symfony
image: /assets/2018-01-25-composer-and-symfony-polyfill/cover/replace-pollyfills-code-snippet.png
---

Symfony ajoute des polyfills pour des histoires de compatibilité, sans que ça ne soit forcément utile. Si vous êtes en 7.2 vous pouvez éviter de charger les polyfills en ajoutant à la section "replace" de composer :

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

Enfin il suffit de jouer la commande `composer update` afin de les supprimer. À vous d'ajuster les polyfills à supprimer en fonction de votre version de PHP.
