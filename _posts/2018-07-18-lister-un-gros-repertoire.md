---
title: Lister un répertoire de plusieurs millions de fichiers efficacement
summary: "On le sait… ce n'est pas une bonne idée de mettre des millions de fichier dans le même répertoire. Tout devient plus compliqué, ne serait-ce que lister son contenu !"
image: /le-truc/assets/2018-07-18-lister-un-gros-repertoire/cover/stars.jpg
tags:
    - Unix
---

Le coup classique. On commence à stocker quelques fichiers dans un dossier sur un disque. Puis, avec le temps et l'augmentation du traffic, ce qui ne devait stocker "que" quelque milliers de fichiers se retrouve à en détenir plusieurs millions. Le problème avec ce genre de situation, c'est qu'un simple inventaire devient mission impossible. Et pourtant !

![cover](/le-truc/assets/2018-07-18-lister-un-gros-repertoire/cover/stars.jpg)

Lorsque vous faites un `ls` dans un répertoire le process va commencer par établir une liste de tous les fichiers présents dans le répertoire. Puis essaiera de les sortir sur `STDOUT` ordonnés par ordre alphabétique. Là, on sent le truc venir. Bien que ça ne pose aucun problème en règle générale, avant même de commencer à _output_ le résultat, `ls` va charger en mémoire l'intégralité des chemins des fichiers qu'il essaie de lister.

La suite, est évidemment, une occupation en RAM délirante et un CPU qui prend le tarif de sa vie (un excellent moyen de crasher une machine) et le ~~mieux~~ pire là dedans, c'est que vous ne verrez pas apparaître, ne serait-ce que, la première ligne du résultat.

## Find? a new sherif in town?

Une solution est d'utiliser `find`, qui, à l'inverse de `ls` travaille de façon incrémentale.

```bash
❯ find . -maxdepth 1
```

**L'ennui** c'est que `find` prendra **beaucoup de temps** à executer la commande à cause des tests qu'il fait pour _matcher_ les fichiers que l'on recherche

## Back to _LS_

Si l'on revient sur `ls` rapidement, et que l'on s'interesse à son `man`, on découvre quelques options qui pourraient nous aider.

```man
     -1      (The numeric digit ``one''.)  Force output to be one entry per line.  This is the default
             when output is not to a terminal.
     -f      Output is not sorted.  This option turns on the -a option.
```

Le `-1` c'est bonus, on affiche simplement le nom du fichier sur une ligne complète

```bash
❯ ls -1
2018-01-25-Obtenir-un-tableau-dobjets-indexe-par-id-avec-pdo.md
2018-01-25-aller-plus-loin-avec-beberlei-assert.md
2018-01-25-composer-and-symfony-polyfill.md
2018-02-06-Libérer-de-lespace-disque-avec-docker-system-prune.md
2018-02-06-behat-phpunit-bootstrap-zero-config.md
2018-02-06-travailler-avec-une-version-non-publiee-dune-librarie-avec-composer.md
2018-02-09-Utiliser-les-methodes-d-intersection-par-valeurs.md
2018-02-09-afficher-du-code-dans-les-textarea-github.md
2018-02-13-ouvrir-une-issue-github-depuis-le-code.md
2018-02-20-git-diff-github-style.md
2018-03-12-taches-asynchrones-avec-zsh.md
2018-03-28-antigen-le-gestionnaire-de-paquets-pour-zsh.md
2018-04-22-diviser-une-chaine-de-caractères-en-es6.md
2018-05-30-voir-lhistorique-des-modifications-dune-methode-avec-git.md
2018-07-18-lister-un-gros-repertoire.md
```

On l'a vu plus haut, l'inconvénient de `ls` est qu'il charge en mémoire avant de faire des opérations de tri. Grâce au _flag_ `-f` on s'affranchit de cette contrainte et `ls` retournera les résultats au fur et à mesure sur `STDOUT`

```bash
❯ ls -f1
.
..
2018-02-20-git-diff-github-style.md
2018-02-13-ouvrir-une-issue-github-depuis-le-code.md
2018-04-22-diviser-une-chaine-de-caractères-en-es6.md
2018-03-28-antigen-le-gestionnaire-de-paquets-pour-zsh.md
2018-01-25-Obtenir-un-tableau-dobjets-indexe-par-id-avec-pdo.md
...
```

Et pourquoi s'arrêter là ! Une autre astuce, est d'invoquer le binaire directement, afin de s'assurer qu'aucune conf obscure ne vienne faire des opérations que l'on aurai pas anticipé (genre le truc qui met de jolies couleurs sur les outputs, ou encore les variables d'environnement ayant un impact sur `ls`).

```bash
❯ \/bin/ls -f1
.
..
2018-02-20-git-diff-github-style.md
2018-02-13-ouvrir-une-issue-github-depuis-le-code.md
2018-04-22-diviser-une-chaine-de-caractères-en-es6.md
2018-03-28-antigen-le-gestionnaire-de-paquets-pour-zsh.md
2018-01-25-Obtenir-un-tableau-dobjets-indexe-par-id-avec-pdo.md
...
```

Enfin, vu que l'on parle de millions d'entrées, plutôt que d'_output_ sur `STDOUT` on va gentillement envoyer tout ça dans un fichier texte.

```bash
❯ /bin/ls -f1 1> ./mon-fichier.txt
```

Victoire ! Non seulement ça fonctionne mais en plus c'est "**presque** sans douleur". La **limitation avec cette approche** c'est les I/O qui prennent très très cher. Si vous avez un process genre NGinx à côté, pensez à bien le monitorer.

## Le petit plus

Moyen mnémotechnique pour s’en souvenir : `-f1`, parce que ça trace 🏎 !  
