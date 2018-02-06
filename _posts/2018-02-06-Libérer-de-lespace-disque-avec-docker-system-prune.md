---
title: Libérer de l'espace disque avec docker system prune
summary: "La commande docker system prune permet de retirer images et containers inutilisés"
tags:
    - Docker
    - CLI
    - Unix
---
Faire un `docker system prune` de temps à autre permet de libérer de l'espace disque.

Cette commande retire :
* les conteneurs arrêtés
* les réseaux non-utilisés par au moins un conteneur
* les images non-utilisées
* le cache du build

À utiliser avec précaution si vous ne voulez pas perdre vos données locales.
