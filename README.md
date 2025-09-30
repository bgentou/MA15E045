# MA15E045

Site du cours *Bases de données* L3 Miashs Université Paris Cité UFR de Mathématiques

Quarto
******
listes à puces 

* A
  * B
    * C

*gras*, **italique**

[link](https://example.com){target="_blank"}  lien ouvert dans une nouvelle page

Insérer une image : ![legende](chat.jpg)

Lien interne : {#eq-hypothenuse} puis @eq-hypothenuse pour y référer

Pour construire les slides 

Tableaux

| fruit  | price  |
|--------|--------|
| apple  | 2.05   |

devient
fruit 	price
apple 	2.05

Et avec les “:”, contrôler l’alignement dans les cellules :

| gauche  | centré  | droite |
|:--------|:-------:|-------:|
| 1.99    | 1.99    | 1.99   |

Lites numérotées

Attention à l'indentation !

1) something 1 
1) something 2

ou 

@.

a) something
a) something


Commande Git
************

```{.bash}
$ git clone https://github.com/bgentou/MA15E045.git  chemin
$ cd chemin
$ git lfs pull 

```

Pour construire le site, dans cet ordre 

```{.bash}
$ quarto render [--to html]
$ quarto render slides --profile slides --no-clean
$ quarto render solutions  [--to html] --profile solution --no-clean
$ quarto render exams [--to html] --profile solution --no-clean
```

Pour publier le site 

```{.bash}
$ quarto publish gh-pages --no-render 
```

[https://bgentou.github.io/MA15E045/](https://bgentou.github.ioMA15E045/)

Pour construire les sujets de TD en pdf

```{.bash}
$ quarto render workshops --to pdf --no-clean
```

Pour construire les solutions en pdf

```{.bash}
$ quarto render solutions --to pdf --profile solution --no-clean
```
