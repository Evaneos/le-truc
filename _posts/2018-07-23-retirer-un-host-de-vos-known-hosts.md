---
title: Retirer un host de vos ~/.ssh/known_hosts
summary: "Quand on joue avec plusieurs instances qui pointe vers un même nom de domaine, SSH se montre, en général, réticent vis-à-vis de notre ~/.ssh/known_hosts. Ce petit tip permet de gérer ça avec une simple commande."
image: /le-truc/assets/2018-07-23-retirer-un-host-de-vos-known-hosts/cover/tunnel.jpg
tags:
    - Unix
    - SSH
---

Je vais illustrer ce **truc** avec un petit scénario :

Vous êtes en train de jouer avec une instance DigitalOcean qui pointe vers `un-truc.evaneos.fr` et vous vous retrouvez à re-créer votre instance.

Vous souhaitez accéder à votre instance avec `ssh badass@un-truc.evaneos.fr` quand, tout à coup, SSH se met à râler :

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:LQtMWzkR45zMvYHGNwfBdueYYFC64eb+33OA/tGM2yd.
Please contact your system administrator.
Add correct host key in /Users/someone/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /Users/someone/.ssh/known_hosts:22
ECDSA host key for un-truc.evaneos.fr has changed and you have requested strict checking.
Host key verification failed
```

## Pourquoi SSH râle ?

Plutôt que de vous expliquer vaguement ce qui se cache derrière ce message, je vous redirige vers [un thread StackExchange](https://superuser.com/a/422008).

Petit avertissement : lisez bien la section **Bottom line**.

## Solution

La première solution qui vous vient à l'esprit est d'aller éditer le fichier `~/.ssh/known_hosts` à la main et supprimer la ligne 22.

Ca fonctionne mais il y a de fortes chances que vous trouviez ça assez pénible.

Il y a, cependant, une solution bien plus simple :

```
ssh-keygen -R un-truc.evaneos.fr
```

Voici un petit extract de `man ssh-keygen` pour expliquer ce que fait cette commande :

```
-R hostname
    Removes all keys belonging to hostname from a known_hosts file.
```

Notez que le paramètre `${hostname}` peut être un nom d'hôte comme une adresse IP.