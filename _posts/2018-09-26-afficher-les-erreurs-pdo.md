---
title: Afficher les erreurs de PDO
summary: "Il est possible que PHP PDO indique lorsqu'il rencontre une erreur"
author: Charles Desneuf
image:
tags:
    - PHP
    - PDO
---

Par défaut [PHP PDO](https://secure.php.net/manual/en/book.pdo.php), qui abstrait la communication avec différents systèmes de stockage de données, se content de retourner `false` lorsqu'il rencontre une erreur.

Cela peut, par exemple, poser des problèmes avec des requêtes invalides que l'on pense avoir été jouées correctement.

Il est possible de [modifier le comportement de PDO quant à sa gestion des erreurs](https://secure.php.net/manual/en/pdo.error-handling.php) en modifiant l'attribut gérant le mode d'erreur de l'instance que l'on utilise :

```php
$pdo = new PDO(...);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
```

* `PDO::ERRMODE_EXCEPTION` permet de renvoyer l'erreur sous forme d'exception
* `PDO::ERRMODE_WARNING` permet de renvoyer l'erreur sous forme warning
