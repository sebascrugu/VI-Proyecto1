library(dplyr)
library(ggplot2)
library(plotly)
library(treemapify)

data <- read.csv("accidentes_transito_con_victimas_2016_2022.csv", sep = ";")

barChartTipoAccidente <- ggplot(data, aes(x = Tipo.de.accidente)) +
  geom_bar(fill = "#00abff", colour = "black") + 
  theme(axis.text.x = element_text(angle = -25, hjust = 0)) + labs(
    x = "Tipo de Accidente",
    y = "Frecuencia"
  )

ggplotly(barChartTipoAccidente)

dfProvincia = data %>% count(Provincia)

treeMapProvincia <- plot_ly(dfProvincia, 
                            labels = ~ Provincia,
                            parents = NA,
                            values = ~ n, 
                            type = "treemap",
                            hovertemplate = "Provincia: %{label}<br>Frecuencia: %{value}<extra></extra>"
                            )

treeMapProvincia

barChartHoraAccidente <- ggplot(data, aes (x = Hora)) +
  geom_bar(fill = "#00abff", colour = "black") + 
  theme(axis.text.x = element_text(angle = -30, hjust = 0)) + labs(
  x = "Hora del Accidente",
  y = "Frecuencia"
)

ggplotly(barChartHoraAccidente)