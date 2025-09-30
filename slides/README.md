# rep slides

Code Quarto pour les diapos
# Ma slide {background-color="#1c191c"}
Tete de chapitre = 1 slide
Apparaît dans le plan

## Section dans 1 chapitre
Commence une nouvelle diapo

### Sous section

--- séparateur de diapo

. . . etape d'affichage

Pour afficher progressivement les élément d'une liste :
::: {.incremental}
- Eat spaghetti
- Drink wine
:::

## Slide Title {.smaller}
Use the .smaller class to use a smaller typeface so that more text fits on the slide.

Use the .scrollable class to make off-slide content available by scrolling. 

Both of these options can also be applied globally to all slides as follows:

---
format:
  revealjs:
    smaller: true
    scrollable: true
---

Colonnes : bien laisser des lignes blanches avant et après les balises

:::: {.columns}

::: {.column width="60%"}
Left column
:::

::: {.column width="40%"}
Right column
:::

::::

Partie centrée :

::: {.center}

:::

Note de bas de page et aside

Exemple ^[A footnote]

::: aside
Some additional commentary of more peripheral interest.
:::

```{.bash}
$ quarto render slides --profile slides --no-clean
```
