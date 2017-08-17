### First Shiny app
# Plot age against pension amount with "live" variables postcode group,
# occupation, and pension band.

library(shiny)
library(data.table)
load("~/My Documents/R Scripts/RShiny/SampleData.RData")

ui <- fluidPage(
  titlePanel("Age vs Pension Amount"),
  sidebarLayout(
    mainPanel("Filter options"),
    sidebarPanel()
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)