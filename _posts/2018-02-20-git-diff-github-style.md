---
title: Vos git diff via une UI à la Github.
summary: "Votre workflow git intègre sûrement une utilisation importante de git diff. Voyons comment intégrer une belle UI de diff à la Github"
tags:
    - git
    - utilitaire
---

Que ce soit pour faire la review d'une PR ou vérifier les **Files changed** de vos propres PRs, vous avez probablement eu affaire aux diff de Github. Imaginez maintenant que vos `git diff` en local renvoient vers une UI HTML aussi plaisante que celle de Github, intéressant n'est-ce pas ?

Tout se trouve dans cette librairie `npm` (et [son repository](https://www.npmjs.com/package/pretty-diff)).

## Installation & paramétrage

Voyons ensemble comment paramétrer ce petit utilitaire.

L'installation se fait simplement sous macOs :

```shell
# Brew
/usr/bin/ruby -e "$(curl -fsSL \
    https://raw.githubusercontent.com/Homebrew/install/master/install \
)"

# Dépendance de la lib
brew install node

# La librairie en elle-même
npm install -g pretty-diff
```

Quant au paramétrage, je vous donne mon avis, probablement biaisé, à prendre ou à laisser donc.

La librairie n'étant pas standard, vous aurez la majorité des options et arguments de `git diff` à portée de main mais **pas tous**. Je vous conseille donc de ne pas écraser `diff` dans votre `.gitconfig`.

Pour nuancer mon avis, je vous partage mon expérience : je suis en télétravail et fais beaucoup de pair avec mes collègues en partageant mon terminal sous `tmux` ; le fait d'avoir l'output de `git diff` en ligne de commande s'avère pratique pour faire le tour, ensemble avec mon/mes collègue.s, des modifications de notre commit.

Ma solution est un alias git et quelques alias shell, tout ce qu'il y a de plus classique :

```shell
# Alias git
git config --global alias.pretty-diff pretty-diff

# Alias shell
alias gd="git pretty-diff"
alias gds="git pretty-diff --staged"
```

## Utilisation

Le comportement de `pretty-diff` est très similaire à celui du `diff` standard :

{:.center} ![Inline]({{ "/assets/2018-02-20-git-diff-github-style/git-pretty-diff_usages.png" | absolute_url }})

Le tout dans une UI très sympathique :

{:.center} ![Inline]({{ "/assets/2018-02-20-git-diff-github-style/git-pretty-diff_sneak_peek.png" | absolute_url }})
