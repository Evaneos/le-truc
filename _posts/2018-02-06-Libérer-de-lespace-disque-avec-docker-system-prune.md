---
title: Libérer de l'espace disque avec docker system prune
summary: "La commande docker system prune permet de retirer images et containers inutilisés"
tags:
    - Docker
    - CLI
    - Unix
---
Faire un `docker system prune` de temps à autre permet de libérer de l'espace disque. Afin de connaitre l'espace potentiellement gangable, `docker system df` permet de connaitre l'utilisation de l'espace disque.

```
TYPE                TOTAL               ACTIVE              SIZE                RECLAIMABLE
Images              263                 68                  90.85GB             57.18GB (62%)
Containers          184                 4                   14.42GB             14.42GB (100%)
Local Volumes       106                 76                  29.82GB             91.38MB (0%)
Build Cache                                                 0B                  0B
```

 `docker system prune` retire :
* les conteneurs arrêtés
* les réseaux non-utilisés par au moins un conteneur
* les images non-utilisées
* les volumes qui ne sont pas attachés à un conteneur qui tourne (attention à la perte de donnée, db etc)
* le cache du build

À utiliser avec précaution si vous ne voulez pas perdre vos données locales.
