# Aula 2 - Visualização de dados com ggplot2



Camada 1 - dados ggplot(): são as informações no formato data.frame que serão usadas nas diferentes camadas nas funções aes(), geom_*(), stat_*(), facet_*() e scale_*()

Camada 2 - mapeamento aes(): atributos estéticos, determina que colunas do data.frame serão usadas para as representações geométricas, assim como tamanho, forma, cor, preenchimento e transparência

Camada 3 - definição da geometria geom_*(): define o tipo de gráfico, como pontos, boxplots, violino, linhas, polígonos, entre outros

Camada 4 - transformações estatísticas stat_*(): modificam, quando necessário, os dados que serão incluídos no gráfico, além de produzir estatísticas como regressões

Camada 5 - sistema de coordenadas coords_*(): descreve como as coordenadas dos dados são mapeadas para o plano do gráfico

Camada 6 - facetas facets_*(): especifica como a visualização dos elementos aes() são divididos em diferentes “janelas gráficas”

Camada 7 - escala scale_*(): permite o controle das características visuais (cor, forma e tamanho) dos elementos declarados em aes()

Camada 8 - temas theme*(): controla a aparência visual dos elementos do gráfico, como fontes, cores e legenda


![Esquema gráfico ilustrando as camadas que definem a strutura de organização aditiva da gramática dos gráficos (ggplot2). No exemplo, a partir de um banco de dados, o mapeamento de quais colunas representam o eixo Y e X e de um atributo gráfico (pontos) é possível construir um gráfico de dispersão que ilustra a relação quantitativa entre a variável Y e X.](https://analises-ecologicas.com/img/cap06_fig01.png)

## Exercícios

1. A partir dos dados de `toy`




## Material de Apoio

[Data to viz](https://www.data-to-viz.com/#histogram): galeria de gráficos com códigos para serem gerados pelo ggplot

[cap. 6 - Visualização de dados](https://analises-ecologicas.com/cap6)

[Data Carpentry - Data Analysis and Visualization in R for Ecologists](https://datacarpentry.org/R-ecology-lesson/index.html)

[Different examples of charts/plots](https://depictdatastudio.com/charts/)

[Data wrapper](https://www.datawrapper.de/)

[Comunidade do Telegram sobre Data Viz](https://t.me/datavizbr)

![What would you like to show? - Flowchart](https://community.sap.com/legacyfs/online/storage/blog_attachments/2016/12/12.9.vinay_chart.jpg)

[Visualizing knowledge](https://www.pbl.nl/en/publications/visualising-knowledge)

[CODATA](https://natydasilva.github.io/CODATA/#1)
