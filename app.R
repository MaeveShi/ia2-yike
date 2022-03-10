library(dash)
library(dashBootstrapComponents)
library(dashHtmlComponents)
library(dashCoreComponents)
library(dplyr)
library(ggplot2)
library(plotly)

summary <- read.csv("data/summary.csv")
app <- Dash$new(external_stylesheets = dbcThemes$BOOTSTRAP)

p <- summary %>%
  group_by(Year, Genre) %>%
  filter(Year == 2015) %>%
  add_count(Genre) %>%
  ggplot(aes(y = reorder(Genre, n))) +
  geom_bar()


app$layout(dccGraph(figure=ggplotly(p)))

app$run_server(host = '0.0.0.0')
