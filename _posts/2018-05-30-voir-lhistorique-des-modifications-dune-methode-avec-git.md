---
title: Voir l'historique des modifications d'une méthode avec Git
summary: "Il est possible de voir l'historique des modification d'une méthode au sein d'un fichier avec Git avec la command git log"
image:
tags:
    - Git
---

La commande `git log` permet de voir les logs des commits. Il est possible de ne s'intéresser qu'au changement pour une méthode particulière d'une classe grâce à l'option `-L`, `git log -L :<methodName>:<file>`.

Par exemple `git log -L :listItineraries:/src/controllers/ItineraryController.php` indiquera toutes les modifications de la méthode `ItineraryController::listItineraries`.

Pour que cela fonctionne il faut indiquet à Git comment traiter les fichiers `.php` en ajoutant à la racine du projet un 
fichier `.gitattributes` contenant :

```
*.php diff=php
```

Il est également possible d'indiquer une plage de lignes sous la forme `git log -L <start>,<end>:<file>`, ou même une regex avec `git log -L :<regex>:<file>`.
