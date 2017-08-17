### First Shiny app

# Plot histogram of number of pensioners that are in each postcode group whilst
# live varying the other variables.

# PensionAmount - sliderInput
# Age - sliderInput
# Occupation - radioButtons
# PensionBand - checkboxGroupInput

library(shiny)
library(data.table)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Pensioners by postcode group"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Options"),
      
      sliderInput("PensionAmount", 
                  label = "Pension Amount (£000s):",
                  min = 0, max = 20, value = c(0, 20)),
  
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
  
  output$hist <- renderPlot({
    sampleDT <- readRDS("../sampleDT.rds")
    
    filterDT <- sampleDT[PensionAmount/1000 >= input$PensionAmount[1] & PensionAmount/1000 <= input$PensionAmount[2]]
    
    filterDT <- filterDT[Age >= input$Age[1] & Age <= input$Age[2]]
    
    if (input$Occupation == "Manual") {
      filterDT <- filterDT[Occupation == "M"]
    } else if (input$Occupation == "Office") {
      filterDT <- filterDT[Occupation == "O"]
    }
    
    filterDT <- filterDT[PensionBand %in% input$PensionBand]
    
    plotDT <- setkey(filterDT[, .N, by = PostcodeGroup], by = PostcodeGroup)
    
    ggplot(data = testDT, aes(x = PostcodeGroup, y = N, fill = PostcodeGroup)) + 
      geom_bar(stat = "identity") +
      guides(fill = FALSE) +
      scale_fill_brewer(palette = "Set2") +
      xlab("Postcode Group") +
      ylab("Frequency")
    
  })
  
}

shinyApp(ui = ui, server = server)