### R Shiny - initial testing

library(shiny)
library(data.table)
HP <- readRDS("./HP")
load("~/My Documents/R Scripts/RShiny/SampleData.RData")

# Template
ui <- fluidPage(
  titlePanel("Title"),
  
  sidebarLayout(
    sidebarPanel(),
    mainPanel()
  )
                )

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)

# This runs, but for development purposes Shiny apps should be put into their 
# own directories and run by (e.g. for the directory ./newdir):
runApp("newdir")