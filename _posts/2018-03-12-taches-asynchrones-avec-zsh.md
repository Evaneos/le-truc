---
title: Dynamiser le shell avec les tâches asynchrones
summary: "L'initialisation d'un shell peut vite devenir longues à force d'y ajouter divers tâches. Voici comment rendre asynchrone une parties de ces tâches"
image:
tags:
    - Zsh
    - Unix
---

Soyons honnête, on passe tous pas mal de temps et d'itérations à rendre nos shell plus efficaces et agréables. Nos workflow y sont très présents et c'est l'un des premiers truc que l'on pense à backup, nos précieux dot files.

L'inconvéniant c'est qu'à force de les enrichir, le prompt deviens de plus en plus lent et un shell peut vite prendre plusieurs secondes à démarrer.

Pour ma part, avec l'utilisation de `docker-machine`, je dois à chaque démarrage de mon shell éxecuter la commande `eval $(docker-machine env)` afin de rendre disponible les variable nécessaires à `docker`. C'est long, c'est lourd et c'est synchrone !

## Pré-requis

La solution que j'ai trouvé s'appelle simplement [zsh-async](https://github.com/mafredri/zsh-async). Cette lib est utilisé notament par le thème zsh [sindresorhus/pure](https://github.com/sindresorhus/pure) pour gérer l'affichage du nom de la branche du repo git du dossier courant et de son status.

On installe tout ça et go.

## Mise en place

`zsh-async` utilise un principe de worker, de callback et de jobs. Étape par étape ça donne :
- créer le worker
- attacher un callback
- lancer le nouveau job
- le callback s'éxecute
- bien penser à faire le ménage si l'on ne réutilise pas le worker

La petite subtilité, c'est que la tâche éxectuté dans un job appartiendra à un autre contexte et ne pourra donc pas faire d'`export` dans le shell courant (entre autre).

```zsh
# on initialise aync
# (inutile si vous avez utilisé antigen pour installer la lib)
source ./async.zsh
async_init

# on créer un nouveau worker 
async_start_worker docker_machine_init

# on définit notre callback qui aura pour mission d'évaluer le résultat du job dans le shell courant
docker_machine_callback() {
    # $3 correspond à l'output sur stdout
    eval $3
    # on détruit le worker
    async_stop_worker docker_machine_init
}

# on attache notre callback au worker
async_register_callback docker_machine_init docker_machine_callback

# enfin on lance la tâche que l'on souhaite éxecuter
async_job docker_machine_init docker-machine env
```


