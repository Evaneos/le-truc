---
title: Travailler avec une version non publiée d'une librairie avec composer
tags:
    - PHP
    - Composer
---

On a parfois besoin de voir comment va se comporter une librairie une fois utilisée dans un projet avant de vouloir en 
publier une nouvelle version.

Une solution peut-être de créer un [alias composer](https://getcomposer.org/doc/articles/aliases.md) vers la branche 
du repository de la librarie qui nous intéresse.

Par exemple, si l'on veut utiliser la branche `branch-name` en tant que version `0.7.0` de la librarie `author\library` 
on peut modifier le fichier `composer.json` pour indiquer dans le bloc `require` `"author/library": "dev-branch-name as 0.7.0"`.

Il est important de noter que le nom de la branche est préfixé de `dev-`.


