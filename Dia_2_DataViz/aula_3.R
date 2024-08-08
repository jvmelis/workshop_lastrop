library(tidyverse)
wd<-getwd()
byplot <- readxl::read_xlsx(path = paste0(wd, "/Dia_1_IntroR_DataManagement/toy_byplot.xlsx"))
inventory_raw <-readxl::read_xlsx(path = paste0(wd, "/Dia_1_IntroR_DataManagement/toy_Inventory.xlsx"),
                              na = "NA")


inventory <- inventory_raw |>
  dplyr::mutate(dbh_cm_numero = stringr::str_replace(dbh_cm, ";", "."),
                dbh_cm_numero = as.numeric(dbh_cm_numero),
                dead_logical = as.logical(as.numeric(dead)),
                htot_numero = as.numeric(htot)
  ) 
# Valores de dead estão ok?
table(inventory$dead_logical)
table(inventory$dead)
# R: Sim!

# Mas tivemos problemas com os valores de altura, pois inseriu NA. Qual valor foi?
inventory |>
  dplyr::filter(is.na(htot_numero)) |> # valores NA de altura
  dplyr::filter(!is.na(htot))          # valores que não eram NA quando eram character

# R: Era o problema de uma vírgula no lugar do ponto
# Fazer a transformação:
inventory <- inventory_raw |>
  dplyr::mutate(dbh_cm_numero = stringr::str_replace(dbh_cm, ";", "."),
                dbh_cm_numero = as.numeric(dbh_cm_numero),
                dead_logical = as.logical(as.numeric(dead)),
                htot = stringr::str_replace(htot, ",", "."),
                htot_numero = as.numeric(htot)
  ) 

## dplyr::group_by()

inventory |>
  dplyr::group_by(plot_id)

inventory |>
  dplyr::group_by(plot_id, tree_id)

### ?dplyr::summarise() | dplyr::summarize()
### ?dplyr::summarise_all()
# Um resumo das informações sem agrupamento:
inventory |>
  dplyr::summarise(media_altura = mean(htot_numero, na.rm = T),
                   altura_max = max(htot_numero, na.rm=TRUE),
                   altura_min = min(htot_numero, na.rm=TRUE),
                   sd_altura = sd(htot_numero, na.rm = T),
                   n_elementos = dplyr::n() )
# Um resumo das informações com agrupamento por parcela:
inventory |>
  dplyr::group_by(plot_id) |>
  dplyr::summarise(media_altura = mean(htot_numero, na.rm = T),
                   altura_max = max(htot_numero, na.rm=TRUE),
                   altura_min = min(htot_numero, na.rm=TRUE),
                   sd_altura = sd(htot_numero, na.rm = T),
                   n_elementos = dplyr::n() )
# Um resumo das informações com agrupamento por parcela e individuo:
inventory |>
  dplyr::group_by(plot_id, tree_id) |>
  dplyr::summarise(media_altura = mean(htot_numero, na.rm = T),
                   altura_max = max(htot_numero, na.rm=TRUE),
                   altura_min = min(htot_numero, na.rm=TRUE),
                   ind_morto = mean(dead_logical),
                   ind_morto = ifelse(ind_morto == 1, TRUE, FALSE),
                   n_ramos = dplyr::n() ) 

# tidyr::pivot_longer() 
# tidyr::pivot_wider()

lista_spp <- inventory |> 
  dplyr::group_by(plot_id, scientific_name) |>
  dplyr::summarise(n_ramos = dplyr::n())
lista_spp # formato long  

tabela_especies <- tidyr::pivot_wider(lista_spp,
                   names_from = plot_id,
                   values_from = n_ramos)

tidyr::pivot_longer(tabela_especies,
                    !scientific_name,
                    names_to = "plot_id",
                    values_to = "n_ramos")
## 
## dplyr::left_join()
## dplyr::inner_join()
## dplyr::right_join()
## dplyr::full_join()
dplyr::left_join(byplot, inventory, by="plot_id") 
dplyr::left_join(byplot, inventory, by="plot_id") |>
  dplyr::filter(is.na(tree_id))

dplyr::right_join(inventory, byplot, by="plot_id") |>
  dplyr::filter(is.na(tree_id))

dplyr::left_join(inventory, byplot, by="plot_id") |>
  dplyr::filter(is.na(tree_id))


## plot
plot(inventory$htot_numero, inventory$dbh_cm_numero )
inventory_clean <- inventory |>
  dplyr::filter(htot_numero<150 & dbh_cm_numero< 1000)
plot(inventory_clean$htot_numero, inventory_clean$dbh_cm_numero )
library(ggplot2)

ggplot(inventory_clean) # camada 1

ggplot(inventory_clean,                         # camada 1
       aes(x = htot_numero, y = dbh_cm_numero)) # + camada 2

ggplot(inventory_clean,                          # camada 1 - dados brutos
       aes(x = htot_numero, y = dbh_cm_numero))+ # camada 2 - mapeamento
  geom_point()                                   # camada 4 - definição da geometria


ggplot(inventory_clean,                          
       aes(x = htot_numero, y = dbh_cm_numero))+ 
  geom_point() +
  facet_wrap(~plot_id)                          # camada 6 - facetas

ggplot(inventory_clean,                          
       aes(x = htot_numero, y = dbh_cm_numero))+ 
  geom_point() +
  facet_grid(.~plot_id)                        # faceta distribuindo no eixo x

ggplot(inventory_clean,                          
       aes(x = htot_numero, y = dbh_cm_numero))+ 
  geom_point() +
  facet_grid(plot_id~.)                        # faceta distribuindo no eixo y

byplot_clean <- dplyr::left_join(inventory_clean, byplot)

ggplot(byplot_clean,                          
       aes(x = htot_numero, y = dbh_cm_numero))+ 
  geom_point() + 
  facet_grid(Forest_type ~ typology )          # faceta distribuindo nos eixos x e y

# Eh possivel atribuir o ggplot como objeto e ir atribuindo novas camadas
grafico <- ggplot(byplot_clean,                          
       aes(x = htot_numero, y = dbh_cm_numero))+ 
  geom_point() + 
  facet_grid(Forest_type ~typology ) 

grafico +
  theme_linedraw()  # camada 8 - temas
grafico +
  theme_bw()

grafico +
  theme_minimal()

grafico <- ggplot(inventory_clean,                          
       aes(x = htot_numero, y = dbh_cm_numero))+ 
  geom_point()
grafico
grafico +
  scale_y_log10()+
  scale_x_log10()

# Grafico Boxplot
ggplot(byplot_clean,                          
       aes(y = dbh_cm_numero, x = typology))+ 
  geom_boxplot() +
  scale_y_log10()

## Consultar data-to-viz para fazer graficos

# byplot_clean |> esquisse::esquisser()
