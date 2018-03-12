---
title: Antigen, le gestionnaire de paquets pour zsh
summary: "Antigen est un ensemble de fonctions qui permettent de gérer facilement les modules de votre shell zsh. Le concept est pratiqement le même que les bundles vim+pathogen."
image:
tags:
    - Zsh
    - Unix
---

[Antigen](http://github.com/zsh-users/antigen) est un ensemble de fonctions qui permettent de gérer facilement les modules de votre shell zsh. Le concept est pratiqement le même que les bundles `vim+pathogen`.

En quelques mots : c'est un outil efficace pour étendre les capacités de votre shell, tout en conservant une config lisible et maintenable.

```zsh
# Init antigen
source /usr/local/share/antigen/antigen.zsh

# Bundles from github
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme sindresorhus/pure

# Tell antigen i'm done
antigen apply
```


## Installation

```zsh
# Homebrew
brew install antigen
echo "source /usr/local/share/antigen/antigen.zsh" >> $HOME/.zshrc
```

```zsh
# cURL
curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
echo "source $HOME/.antigen/antigen.zsh" >> $HOME/.zshrc
```

La liste des approches pour installer antigen est disponible sur le [wiki du repo](https://github.com/zsh-users/antigen/wiki/Installation).

## Mise en place

Antigen permet l'installation de bundles depuis :
- des repos github
- oh-my-zsh
- prezto

Son mode de fonctionnement est assez simple. Lorsque vous utilisez la commande `antigen bundle user/repo`, antigen fait un clone du repo et exécute les fichiers `*.plugin.zsh` s'y trouvant.

### Depuis un repo Github

```zsh
# Bundles from repo
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen i'm done
antigen apply
```


### [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins)


```zsh
# Load oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle brew

# Tell antigen i'm done
antigen apply
```

## En composant

Avec quelques lignes, on peut rapidement se composer une config assez robuste et prête à l'emploi.

```zsh
# Init antigen
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle node
antigen bundle brew
antigen bundle colorize
antigen bundle colored-man-pages

# Bundles from github.
antigen bundle mafredri/zsh-async
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme sindresorhus/pure

# Tell antigen i'm done
antigen apply
```
