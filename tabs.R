####################### R Shiny app with tabs #######################

library(shiny)

ui <- fluidPage(
  titlePanel("Insert Title"),
  
  tabsetPanel(
    tabPanel(title = "tab1"
             ),
    
    tabPanel(title = "tab2"
             ),
    
    tabPanel(title = "tab3"
             )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)