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

Colonnes : bien laisser des lignes blanches avant et après les balises

::::: {.columns}

::: {.column width="65%"}

:::

:::::

Partie centrée :

::: {.center}

:::

Pour construire les slides 

```{.bash}
$ quarto render slides --profile slides --no-clean
```
