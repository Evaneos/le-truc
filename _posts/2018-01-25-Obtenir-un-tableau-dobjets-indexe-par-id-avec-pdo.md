---
title: Obtenir un tableau d'objets indexé par id avec PDO
tags:
    - PHP
    - PDO
    - SQL
---

La [méthode `fetchAll`](http://php.net/manual/fr/pdostatement.fetchall.php) de PDO dispose de plusieurs options intéressantes pour récupérer un tableau d'objets depuis la base de données :

## PDO::FETCH_UNIQUE

Cette option utilise le premier champ de la requète comme clé du tableau retourné.

```php
$sql = <<<SQL
	SELECT id, id, name
	FROM users
	WHERE id IN (12, 78)
SQL;


$sth = $pdo->prepare($sql);
$sth->execute([$accommodation]);

$users = $sth->fetchAll(\PDO::FETCH_UNIQUE); 
/* $users = [
	12 => ['id' => 12, 'name' => 'Maitre Jojo'],
	78 => ['id' => 78, 'name' => 'Maitre Pierre'],
	];
*/
```

## PDO::FETCH_CLASS

Cette option permet d'hydrater un objet de la classe définie :

```php
class User {}

$sql = <<<SQL
	SELECT id, id, name
	FROM users
	WHERE id IN (12, 78)
SQL;


$sth = $pdo->prepare($sql);
$sth->execute([$accommodation]);

$users = $sth->fetchAll(\PDO::FETCH_CLASS, User::class); 
/* $users = [
	0 => User('id' => 12, name => 'Maitre Jojo'),
	1 => User('id' => 78, 'name' => 'Maitre Pierre'),
	];
*/
```

## Combo

En utilisant un pipe `|` il est possible de cummuler les options :


```php
class User {}

$sql = <<<SQL
	SELECT id, id, name
	FROM users
	WHERE id IN (12, 78)
SQL;


$sth = $pdo->prepare($sql);
$sth->execute([$accommodation]);

$users = $sth->fetchAll(\PDO::FETCH_UNIQUE|\PDO::FETCH_CLASS, User::class); 
/* $users = [
	12 => User('id' => 12, name => 'Maitre Jojo'),
	78 => User('id' => 78, 'name' => 'Maitre Pierre'),
	];
*/
```


## PDO::FETCH_KEY_PAIR

Petite appartée, `PDO::FETCH_KEY_PAIR` permet de retourner un tableau de clé => valeur. La requête ne doit selectionner que 2 champs.

