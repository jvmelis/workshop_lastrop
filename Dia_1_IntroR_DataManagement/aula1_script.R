getwd() # obter o diretorio de trabalho
setwd("C:/Users/jvmel/Documents/PD/Worshops_lastrop/workshop_lastrop") #
# pasta<-choose.dir()
# pasta
# setwd(pasta)
getwd()
# session > (ou ctrl shift h)

### Atribuir objetos
a <- 0
1 -> b
d = 2
a*b
a+b
a+b+b
c+a
1+
  1
## vetores/vector

vetor1<- c(1,2,3,4)
vitoria
"vitoria"
nome <- "dani"  
nome
dados_pessoais <- c("Dani", "Assi", 20, NA)
dados_pessoais
dados_pessoais <- c("Dani", "Assi", 20, NULL)
dados_pessoais
dados_pessoais <- c("Dani", "Assi", 20, NaN)
log(-1)
as.numeric(dados_pessoais)
as.character(vetor1)
numero<-3.56
as.integer(numero)
round(numero)
round(numero, 1)
VF <- c(TRUE, FALSE, F, T)
VF

dados_pessoais2 <- c("John", 22, TRUE, 1.7)
dados_pessoais2
as.numeric(dados_pessoais2)
as.numeric(TRUE)
matriz1 <- matrix(1:9)
matriz1
matriz2 <- matrix(1:9, nrow = 3)
matriz2
df1 <- data.frame(
  nomes = c("John", "Dani", "Ju")
)
df1
df1 <- data.frame(
  nomes = c("John", "Dani", "Ju"),
  alturas = c(1.7, 1.6, 1.75)
)

df1
df2 <- data.frame(dados_pessoais2, dados_pessoais)
class(dados_pessoais2)
class(alturas)
df1
df1$alturas
class(df1$alturas)
# um data.frame é composto por vetores pareados um do lado do outro

df1$nomes[1]
df1$alturas[2]

# df1["linha", "coluna"]
df1[2, 1] # 2o nome da 1a coluna
df1[1, 2]
df1[c(1,2), 2]

df1[1]
df1[2] # 2a coluna
df1[,1] # 1a coluna no formato vetor
LETTERS
letters
letters[1:3]

install.packages("tidyverse")
library(tidyverse)
