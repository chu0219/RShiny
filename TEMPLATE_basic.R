####################### R Shiny - basic template #######################

library(shiny)

ui <- fluidPage(
  titlePanel("Insert Title"),
  
  sidebarLayout(
    sidebarPanel(),
    mainPanel()
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)