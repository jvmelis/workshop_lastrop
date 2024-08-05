# Aula 1 - Introdução ao R e tidyverse

## O ambiente

- R

  * Por que aprender R?

Reprodutibilidade, interdisciplinaridade, gráficos, análise de dados, *free* (livre e gratuito)

- RStudio

  * Organizando seus projetos

`> pasta`

`  > scripts`

`  > dados > crus`

`          > limpos`

`  > documentos`

`+ read_me`

  * Console
  
## Definições

- objetos: 

character (string), numeric(double/integer), lógicos, NULL, NA, NaN, vector, matrix, list, array, data.frame/tibble

  * A hierarquia `logical` < `integer` < `numeric` < `character`

- função

  * Operadores Matemáticos (`*`,`%*%`) e lógicos (`<, ==, >, %in%`)
  
  * `c()`, `data.frame()`, `cbind()`, `rbind`, `summary()`, `str()`, `length()`, `dim()`
  
  * Indexação `[linha, coluna]`, `lista[[n]]`, `$`, `:`


- help, `?`, `??`

- pipe (`|>` e `%>%`)

### Criar suas próprias funções

`duplicar <- function(a){return(2*a)}`

### Usar laço (for loop)

`for(i in 2:10){print(paste("quero", i, "cafés"))}`

### Pacotes

`install.package()`

`library()`

`require()`

`devtools::install()`


## Tidyverse

- O que/Como são dados *tidy*

- Seleção e filtragem de dados 

  * select, 
  
  * filter

- Criação e modificação de variáveis 

  * `mutate`
  
  * `unite`, 
  
  * `separate`
  
  * select


- Ordenação e agrupamento de dados 

  * arrange, 
  
  * group_by, 
  
  * summarize

- Pivotagem de dados 

  * pivot_longer, 
  
  * pivot_wider

- Operações de join 

  * left_join, 
  
  * inner_join, 
  
  * full_join
  
![Diferentes tipos de joins, representados com um diagrama de Venn. Adaptado de: Wickham & Grolemund (2017)](https://analises-ecologicas.com/img/cap05_fig03.png)

## Exercícios

Baixar o arquivo [toy_Inventroy.xlsx](https://github.com/jvmelis/workshop_lastrop/blob/main/Dia_1_IntroR_DataManagement/toy_Inventory.xlsx)


## Material de apoio:

[cap. 4 - Introdução ao R](https://analises-ecologicas.com/cap4)

[cap. 5 -  Tidyverse](https://analises-ecologicas.com/cap5)
