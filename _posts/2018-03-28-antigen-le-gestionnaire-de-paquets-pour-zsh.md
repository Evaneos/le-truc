---
title: Antigen, le gestionnaire de paquets pour zsh
summary: "Antigen est un ensemble de fonctions qui permettent de gérer facilement les modules de votre shell zsh. Le concept est pratiquement le même que les bundles vim+pathogen."
author: Antoine Lépée
image:
tags:
    - Zsh
    - Unix
    - antigen
    - dotfiles
---

[Antigen](http://github.com/zsh-users/antigen) est un ensemble de fonctions qui permettent de gérer facilement les modules de votre shell zsh. Le concept est équivalent aux bundles "vim+pathogen".

En quelques mots : c'est un outil efficace pour étendre les capacités de votre shell, tout en conservant une config lisible et maintenable.

```zsh
# dans ~/.zshrc

# Initialisation d'Antigen
source /usr/local/share/antigen/antigen.zsh

# Récupération de "bundles"
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Ajout d'un thème.
antigen theme sindresorhus/pure

# Appliquer l'ensemble des changements
antigen apply
```


## Installation

### avec Homebrew
```zsh
brew install antigen
echo "source /usr/local/share/antigen/antigen.zsh" >> $HOME/.zshrc
```

### avec cURL
```zsh
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
echo "source $HOME/.antigen/antigen.zsh" >> $HOME/.zshrc
```

La liste des approches pour installer antigen est disponible dans le [wiki du repo](https://github.com/zsh-users/antigen/wiki/Installation).

## Mise en place

Antigen permet l'installation de bundles depuis :
- des repos github
- oh-my-zsh
- prezto

Son mode de fonctionnement est assez simple. Lorsque vous utilisez la commande `antigen bundle user/repo`, antigen fait un clone du repo et exécute les fichiers `*.plugin.zsh` s'y trouvant.

### Depuis un repo Github

```zsh
# dans ~/.zshrc

# Initialisation d'Antigen
source /usr/local/share/antigen/antigen.zsh

# Récupération de "bundles" depuis github
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Appliquer l'ensemble des changements
antigen apply
```


### [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins)


```zsh
# dans ~/.zshrc

# Initialisation d'Antigen
source /usr/local/share/antigen/antigen.zsh

# Chargement de oh-my-zsh comme librairie par défaut (robbyrussell/oh-my-zsh).
antigen use oh-my-zsh

# Récupération de "bundles" depuis la librairie par défaut
antigen bundle git
antigen bundle brew

# Appliquer l'ensemble des changements
antigen apply
```

## En composant

Avec quelques lignes, on peut rapidement se composer une config assez robuste et prête à l'emploi.

`~/.zshrc`
```zsh
# Init antigen
source /usr/local/share/antigen/antigen.zsh

# Chargement de oh-my-zsh comme librairie par défaut (robbyrussell/oh-my-zsh).
antigen use oh-my-zsh

# Récupération de "bundles" depuis la librairie par défaut
antigen bundle git
antigen bundle colorize
antigen bundle colored-man-pages

# Récupération de "bundles" depuis github
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Ajout d'un thème.
antigen theme sindresorhus/pure

# Appliquer l'ensemble des changements
antigen apply
```

## Quelques config d'Evaneossiens


**[Johann Saunier](https://github.com/ProPheT777)**
```zsh
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle docker-compose
antigen bundle github
antigen bundle colorize

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle bobsoppe/zsh-ssh-agent
antigen bundle desyncr/auto-ls

antigen theme refined

antigen apply
```

**[Fabien Huitelec](https://github.com/fhuitelec)**
```zsh
CURRENT_DIR=$(dirname $0)
source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle mafredri/zsh-async

export ANTIGEN_LOG=~/antigen.log
antigen bundle $CURRENT_DIR/zsh/themes/killer-theme.zsh-theme --no-local-clone

antigen apply
```

**[Antoine Lépée](https://github.com/alepee)**
```zsh
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle node
antigen bundle kubectl
antigen bundle brew
antigen bundle colorize
antigen bundle colored-man-pages

antigen bundle mafredri/zsh-async
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme sindresorhus/pure

antigen apply
```
