---
title: Diviser une chaîne de caractères en ES6
summary: "Grâce à la décomposition apportée par la version ES2015 de javascript, il est facile de diviser une chaîne de caractères"
image:
tags:
    - javascript
    - es6
---

Afin de diviser une chaîne de caractères, il existe la méthode `split` qui nous renvoie un tableau de chaque caractère.

```javascript
const cake = 'cake';

const slicedCake = cake.split('');
// ['c', 'a', 'k', 'e' ]
```

Depuis la version ES2015, il est possible d'utiliser l'opérateur de décomposition (spread operator) afin de diviser une chaîne de caractères.

```javascript
const cake = 'cake';

const slicedCake = [...cake];
// ['c', 'a', 'k', 'e' ]
```
