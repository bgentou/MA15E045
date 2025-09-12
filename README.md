# MA15Y030

Site Ouèbe du cours *Bases de données* MA15Y030 Université Paris Cité UFR de Mathématiques

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
