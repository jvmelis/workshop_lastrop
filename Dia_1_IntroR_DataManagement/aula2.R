# cerquilha (hashtag) faz com que ignore a linha
# script ajuda a manter o que voce vai fazer e o que vc fez
# quando vc salva o script, RStudio assume a pasta onde vc salvou como "working directory"
# existem objetos e funções. o padrao de ambos é começar com letra
d1 <- "funciona"
1d <- "nao funciona"
# caracteres como valores deve estar entre aspas ("")
caracter <- "2"
numero <- 2
class(caracter)
class(numero)
# Toda funcao tem os parentes depois de seu nome. Ex: round(2.78)
round(2.78)
round(2.78, digits = 1) # digits é um argumento da funcao round
?round() # abre o help da funcao
# Para mudar a classe do objeto, voce pode usar as funcoes as.... Ex:
as.numeric(caracter)
# Importante lembrar da hierarquia de classes para nao perder informaçoes.
exemplo <- "nome"
as.numeric(exemplo) # retorna valor NA

# Para construir um vetor, usando a funcao c()
vetor <- c(1:10) # vetor de 1 a 10
vetor
vetor2 <- c("a", "cade", "alunos")
vetor2
vetor3 <- c(1, "letra", NA, NULL, NaN, TRUE)
vetor3
# ctrl + enter ou cmd + enter para rodar a linha do script
# eh possivel selecionar o objeto e rodar somente ele no console
(vetor4<-LETTERS[1:5])
# [] servem para voce usar o index do objeto
# no caso de um vetor, sera o numero do elemento de 1 a n, 
# sendo n o numero de elementos no vetor
length(vetor3)
vetor3[2] # retorna 2o elemento
vetor[-1] # elimina o primeiro elemento
vetor3[c(1,3)]
vetor3[1,3] # dá erro, pois um vetor so tem 1 dimensao (comprimento)


# Dataframes tem 2 dimensoes, logo, utiliza-se [linha, coluna]
# Data.frames que sao vetores em paralelo
(df1<- data.frame(vetor, vetor3))
(df2<- data.frame(vetor, vetor2))

# pipe %>% (ctrl/cmd + shift + m)
vetor %>%  data.frame(vetor3) # precisa do pacote magritR
# mas tem o pipe nativo que |>
vetor |>  data.frame(vetor3)
1:10 |> 
  c(12, 15) |> 
  data.frame(vetor2) |> 
  summary()

# como construir uma funcao

dobrar <- function(numero){
  numero_dobrado <- numero*2
  return(numero_dobrado)
}
dobrar(256)

calcular_biomass <- function(h, dap, wd){
  AGB = exp(h*dap*wd)
  return(AGB)
}
calcular_biomass(h=10, dap=20, wd=0.3)
calcular_biomass(10, 20, 0.3)
calcular_biomass(dap=20, h=10,  wd=0.3)

calcular_biomass <- function(h, dap, wd=0.3){
  AGB = exp(h*dap*wd)
  return(AGB)
}
calcular_biomass(10, 20)
calcular_biomass(10, 20, wd=0.6)
calcular_biomass(10, 20, 0.6)


# tidyverse
install.packages("tidyverse") # se nao tiver baixado, use essa linha
library(tidyverse) # ativa a biblioteca
require(tidyverse) # TRUE ou FALSE
if(!require(pacman)){install.packages("pacman")}
pacman::p_load(BIOMASS)


## Leitura dos dados
# R so "le" csv
read.csv("toy_byplot.csv") # "americano"
(toy_byplot<-read.csv2("toy_byplot.csv")) # "brasileiro"


(toy_byplot2 <- readxl::read_xlsx("toy_byplot.xlsx"))
print(toy_byplot2, n=99)

(toy_inventory <- readxl::read_xlsx("toy_Inventory.xlsx"))
?readxl::read_xlsx

(toy_inventory <- readxl::read_xlsx("toy_Inventory.xlsx",
                                    na = "NA"))

# funcoes tidyverse
# select
# select(dataframe, nome_coluna) # nome da funcao
dplyr::select() # redundancia para evitar conflito nos nomes das funcoes
dplyr::select(toy_inventory, plot_id)
dplyr::select(toy_inventory, -plot_id)

toy_inventory[,-1]
toy_inventory[, 1]

toy_inventory |>
  select(plot_id, date, dead)

select(toy_inventory, plot_id, date, dead)

toy_inventory |>
  dplyr::select(plot_id, date, dead)

# dplyr::filter(dataframe, operacao_logica)
is.na(toy_inventory$dd)
!is.na(toy_inventory$dd)
dplyr::filter(toy_inventory, is.na(dd))
dplyr::filter(toy_inventory, !is.na(dd))
toy_inventory|>
  dplyr::filter(!is.na(dd))

toy_inventory|>
  dplyr::filter(!is.na(dd)) |>
  select(plot_id, date)

toy_dead <- toy_inventory|>
  dplyr::filter(!is.na(dd))

# dplyr::mutate(dataframe, nova_coluna = o_que_vc_quer)

toy_inventory|>
  dplyr::mutate(dbh_cm_numero = as.numeric(dbh_cm) )|>
  dplyr::select(dbh_cm_numero, dbh_cm)

toy_inventory|>
  dplyr::mutate(dbh_cm_numero = as.numeric(dbh_cm),
                Area_seccao = pi*(dbh_cm_numero/2)^2)|>
  dplyr::select(dbh_cm_numero, dbh_cm, Area_seccao)

# Caused by warning:
# ! NAs introduzidos por coerção 

toy_inventory|>
  dplyr::mutate(dbh_cm_numero = as.numeric(dbh_cm) ) |>
  dplyr::select(dbh_cm_numero, dbh_cm) |>
  dplyr::filter(is.na(dbh_cm_numero))

toy_inventory <- toy_inventory|>
  dplyr::mutate(dbh_cm_numero = stringr::str_replace(dbh_cm, ";", "."),
                dbh_cm_numero = as.numeric(dbh_cm_numero),
                Area_seccao = pi*(dbh_cm_numero/2)^2) 


