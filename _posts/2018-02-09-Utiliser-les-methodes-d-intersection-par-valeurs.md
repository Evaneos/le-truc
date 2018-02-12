---
title: Utiliser les méthodes d'intersection par valeurs
summary: "La méthode `array_intersect` permet de récupérer l'intersection entre n tableaux. Nous allons ici voir l'utilisation avec des tableaux d'objets."
tags:
    - PHP
---

La méthode `array_intersect` permet de calculer l'intersection de deux tableaux (ou plus), contenant des valeurs scalaires.
```PHP
$tableau1 = ['un', 'deux', 'trois', 'quatre'        ];
$tableau2 = ['un', 'deux',          'quatre', 'cinq'];

array_intersect($tableau1, $tableau2); //retourne le tableau suivant:
            ['un', 'deux',          'quatre'        ];
```

Pour faire l'intersection de deux tableaux d'objets, on pourrait utiliser la méthode `array_uintersect`  (http://php.net/manual/fr/function.array-uintersect.php), qui permet d'utiliser une fonction de rappel.
```PHP
class Objet
{
    private $arg;

    public function __construct($arg){
        $this->arg = $arg;
    }
    public function egal($another){
        return $another instanceof self && $another->arg === $this->arg;
    }
}

$tableau1 = [new  Objet('un'), new Objet('deux'), new Objet('trois'), new Objet('quatre')                   ];
$tableau2 = [new  Objet('un'), new Objet('deux'),                     new Objet('quatre'), new Objet('cinq')];

array_uintersect($tableau1, $tableau2, function ($objet1, $objet2) { return $objet1->egal($objet2); }); 
//retourne le tableau suivant:
            [new  Objet('un'), new Objet('deux'), new Objet('trois'), new Objet('quatre')                   ];
```
Ce qui est faux, cette fonction ne marche pas de cette manière.
Si on lit plus attentivement la documentation : `La fonction de comparaison doit retourner un entier inférieur à, égal à, ou supérieur à 0 si le premier argument est considéré comme, respectivement, inférieur à, égal à, ou supérieur au second. Notez qu'avant PHP 7.0.0, cet entier devait être dans l'intervalle -2147483648 à 2147483647`. 
On pourrait penser qu'il suffit de comparer l'égualité des deux objets, retourner 0 quand ils sont égaux et autres choses quand ils ne le sont pas :
```PHP
$tableau1 = [new  Objet('un'), new Objet('deux'), new Objet('trois'), new Objet('quatre')                   ];
$tableau2 = [new  Objet('un'), new Objet('deux'),                     new Objet('quatre'), new Objet('cinq')];

array_uintersect($tableau1, $tableau2, function ($objet1, $objet2) { return $objet1->egal($objet2) ? 0 : 1; }); 
//retourne le tableau suivant:
            [                                                         new Objet('quatre')                   ];
```
En fait, la fonction `array_uintersect` commence par ordonner les deux tableaux, en utilisant la fonction de rappel. Il faut donc bien respecter les valeurs de retours attendus par la méthode de rappel. Pour l'intersection des deux objets, ça peut être plus difficile de définir si un objet est supérieur a l'autre, et vice-versa, le plus simple est sûrement d'implémenter la méthode `__toString` et d'utiliser la méthode `array_intersect` : 
```PHP
class Objet
{
    private $arg;

    public function __construct($arg){
        $this->arg = $arg;
    }
    public function egal($another){
        return $another instanceof self && $another->arg === $this->arg;
    }
    public function __toString(){
        return $this->arg;
    }
}

$tableau1 = [new  Objet('un'), new Objet('deux'), new Objet('trois'), new Objet('quatre')                   ];
$tableau2 = [new  Objet('un'), new Objet('deux'),                     new Objet('quatre'), new Objet('cinq')];
array_intersect($tableau1, $tableau2); //retourne le tableau suivant:
            [new  Objet('un'), new Objet('deux'),                     new Objet('quatre')                   ];
```
