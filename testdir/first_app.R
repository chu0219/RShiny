### First Shiny app

# Plot histogram of number of pensioners that are in each postcode group whilst
# live varying the other variables.

# PensionAmount - sliderInput
# Age - sliderInput
# Occupation - radioButtons
# PensionBand - checkboxGroupInput

library(shiny)
library(data.table)
load("~/My Documents/R Scripts/RShiny/SampleData.RData")

ui <- fluidPage(
  titlePanel("Pensioners by postcode group"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Options"),
      
      sliderInput("PensionAmount", 
                  label = "Pension Amount (£):",
                  min = 0, max = 20000, value = c(0, 20000)),
  
      sliderInput("Age", 
                  label = "Age:",
                  min = 60, max = 100, value = c(60, 100)),
      
      radioButtons("Occupation",
                  label = "Occupation type",
                  choices = c("All", "Manual", "Office")),
      
      checkboxGroupInput("PensionBand",
                  label = "Pension Band",
                  choices = LETTERS[1:5],
                  selected = LETTERS[1:5])
  ),
    
    mainPanel(
      plotOutput("hist")
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)