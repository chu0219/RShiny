### R Shiny - initial testing

library(shiny)
library(data.table)
DT <- readRDS("./HP")
load("~/My Documents/R Scripts/RShiny/SampleData.RData")

# Template
ui <- fluidPage(
  titlePanel("Title")
                )

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)