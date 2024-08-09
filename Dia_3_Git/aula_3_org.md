# Aula 3 - Introdução ao Git e GitHub

Utilizando a [aula do Rladies-SP](https://www.youtube.com/watch?v=2gmofUthjKk&t=187s), é extremamente fácil:

## Primeiro passo

Instalar o [GIT](https://git-scm.com/downloads)

## Segundo passo - Configurar o Git e GitHub em seu Rstudio
Este passo só será realizado quando for a primeira vez. Se você

* Ter o pacote `usethis`
`install.packages("usethis")`

* Apresentar-se ao git

Por Rscript:

`usethis::use_git_config(user.name = "Seu Nome", user.email = "seunome@mail.com" `

Pelo terminal seria:

`$ git config --global user.name "Seu Nome"`
`$ git config --global user.email "seunome@mail.com"`

* Abrir o arquivo .Renviron

`usethis::edit_r_environ()`

* Criar um token no Github
  
* Adicionar o github token no arquivo .Renviron
  
* Reiniciar o Rstudio
  

### Principais comandos no git

git diff


## Exercícios

## Material de apoio:

[Ben Dêivide - RapidinhasR(0005) - Sincronizando Projeto R/RStudio ao GitHub](https://www.youtube.com/watch?v=0tYss8T7Mew): 

[RLadies São Paulo - Contribuindo através da interface web do GitHub - playlist](https://www.youtube.com/watch?v=nR_HsQS_xS0&list=PLufjVrrUAoSdny-WECY4Gr2pn5OQGG_FN&index=3): É uma playlist feita pelo Rladies de São Paulo (SP) onde é feito:
* Apresentação do Rladies (4:41)
* O que é "open source" (21:02)
* Introdução ao GIT (40:26)
* Introdução ao GitHub (35:53)
* Conheça o Hackatorberfest (Contribuindo via GitHub)
* 

[RLadies Goiânia -  Introdução a utilização do Git e Github no RStudio](https://youtu.be/uQL6NOSd9cc?si=wAa10BaYTNSZ-mWt&t=1722): Já coloquei diretamente no começo da aula. São 2 horas e meia com a [Beatriz Milz](https://beamilz.com/) ensinando o passo a passo durante um evento online das Rladies de Goiânia.
