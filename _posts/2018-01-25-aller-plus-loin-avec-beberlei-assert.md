---
title: Gérer les cas null et les collections avec beberlei/assert
summary: "La librairie beberlei/assert permet de combiner les assertions, de vérifier que plusiers éléments répondent à la même contrainte
ou de s'assurer que s'ils ne répondent pas à la contrainte ils sont null."
author: Charles Desneuf
tags:
    - PHP
---

La librairie [`beberlei/assert`](https://github.com/beberlei/assert), qui sert à se protéger contre les paramètres invalides proposes des combinaisons utiles.

Par exemple il est possible d'ajouter [`nullOr`](https://github.com/beberlei/assert#nullor-helper) au nom d'une assertion (ex: `nullOrString`) afin de valider que l'on a bien une valeur `null` ou le type attendu.

Il est également possible de préfixer [`all`](https://github.com/beberlei/assert#all-helper) les types `Traversable` (ex: `allIsInstanceOf`) pour s'assurer que tous les éléments correspondent bien au type attendu.

La combinaison des deux fonctionne également, il suffit de mettre le `A` en minuscule (ex: `nullOrallString`).

La library propose également de chainer différentes assertions, par exemple:

```php
Assert::thatAll($coolArray)
    ->nullOr()
    ->string('You\'re messing up dude');
```
