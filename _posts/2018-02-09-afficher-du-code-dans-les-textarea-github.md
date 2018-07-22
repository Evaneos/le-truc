---
title: Afficher du code proprement dans vos commentaires et descriptions sur Github
summary: "La syntaxe Markdown nous permet d'afficher du code dans notre texte.
Ce n'est pas toujours suffisant. Github intègre une surcouche afin de nous faciliter la vie."
author: Quentin Pautrat
tags:
    - Github
---

La syntaxe Markdown nous permet d'afficher du code dans notre texte.
Ce n'est pas toujours suffisant. Github intègre une surcouche afin de nous faciliter la vie.

Vous savez probablement afficher du code sur...

une ligne:

    `console.log('Bonjour');`

{:.center}
![Inline]({{ "/assets/2018-02-09-afficher-du-code-dans-les-textarea-github/inline.png" | absolute_url }})

ou bien sur plusieurs:

    ```
    console.log('Bonjour');
    console.log('A bientôt');

    ```

{:.center}
![Inline]({{ "/assets/2018-02-09-afficher-du-code-dans-les-textarea-github/multiligne.png" | absolute_url }})

Github nous permet d'indiquer de quel langage il s'agit afin de profiter de la coloration syntaxique:

    ```javascript
    var prenom = 'quentin';
    console.log('bonjour ' + prenom);
    ```

{:.center}
![Inline]({{ "/assets/2018-02-09-afficher-du-code-dans-les-textarea-github/typehint.png" | absolute_url }})

Permettre de copier-coller du code bien formaté est un bon début.
Cependant, en plus de devoir dupliquer une information, nous manquons cruellement de contexte.
Par exemple dans quel fichier le code est-il écrit ?

Bien-sûr on peut ajouter un lien pointant vers le fichier et même la ligne en question:

    ```javascript
    Counter.propTypes = {
    ```
    Le code est [ici](https://github.com/Evaneos/vitaminjs/blob/master/examples/counter/Counter/index.jsx#L14)

{:.center}
![Inline]({{ "/assets/2018-02-09-afficher-du-code-dans-les-textarea-github/link.png" | absolute_url }})

On peut même pointer vers un bloc de code:

    ```javascript
    Counter.propTypes = {
        value: PropTypes.number.isRequired,
        onIncrement: PropTypes.func.isRequired,
        onDecrement: PropTypes.func.isRequired,
    };
    ```
    Le code est [ici](https://github.com/Evaneos/vitaminjs/blob/master/examples/counter/Counter/index.jsx#L14-L18)


{:.center}
![Inline]({{ "/assets/2018-02-09-afficher-du-code-dans-les-textarea-github/multiline.png" | absolute_url }})

Github surligne en jaune les lignes concernées:

![Inline]({{ "/assets/2018-02-09-afficher-du-code-dans-les-textarea-github/multiline2.png" | absolute_url }})



C'est pas mal mais on peut mieux faire.

En utilisant le hash de commit, Github traduit le lien et intègre directement le code concerné!

    https://github.com/Evaneos/vitaminjs/blob/1a7b74528160833a9a1d1571b302f1c920f1951f/examples/counter/Counter/index.jsx#L14-L18

![Inline]({{ "/assets/2018-02-09-afficher-du-code-dans-les-textarea-github/permalink.png" | absolute_url }})

_Attention, il faut utiliser le hash entier._


