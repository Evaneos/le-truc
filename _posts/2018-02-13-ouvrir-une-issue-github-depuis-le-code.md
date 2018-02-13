---
title: Ouvrir une issue depuis le code sur Github.
summary: "Ouvrir une issue Github qui concerne une partie du code est monnaie courante. Nous allons voir comment la plateforme nous facilite la tâche."
tags:
    - Github
---

Ouvrir une issue Github qui concerne une partie du code est monnaie courante.
Les cas sont nombreux: bug, refacto, typo, nommage, etc...


[Dans un précédent article]({{ site.baseurl }}{% post_url 2018-02-09-afficher-du-code-dans-les-textarea-github %}) nous avons vu comment rendre facile l'inclusion de code dans nos descriptions sur Github.

Cela nous facilite un peu la vie mais on peut faire encore plus simple.

Github nous permet d'ouvrir une issue directement depuis le code!

Dans la vue d'un fichier il est possible de sélectionner une ligne, ou même plusieurs lignes de codes en maintenant la touche `MAJ` enfoncée.

Un menu contextuel est disponible avec différentes options. On peut copier les lignes directement.
Il est aussi possible d'obtenir le permalien qu'on pourra copier dans une description.
On peut aussi faire un `git blame` sur les lignes concernées.

![Inline]({{ "/assets/2018-02-13-ouvrir-une-issue-github-depuis-le-code/contextual-menu.png" | absolute_url }})

Ce qui nous intéresse est la possibilité de créer une issue. Github va automatiquement inclure les lignes de codes dans la description!