### First Shiny app

# Plot histogram of number of pensioners that are in each postcode group whilst
# live varying the other variables.

# PensionAmount - sliderInput
# Age - sliderInput
# Occupation - radioButtons
# PensionBand - checkboxGroupInput
# PostcodeGroup - checkboxGroupInput

library(shiny)
library(data.table)
library(ggplot2)
library(reshape2)

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
      
      checkboxGroupInput("PostcodeGroup",
                         label = "Postcode Group",
                         choices = LETTERS[1:7],
                         selected = LETTERS[1:7])
  ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  
  output$plot <- renderPlot({
    sampleDT <- readRDS("../sampleDT.rds")
    
    filterDT <- sampleDT[PensionAmount/1000 >= input$PensionAmount[1] & PensionAmount/1000 <= input$PensionAmount[2]]
    
    filterDT <- filterDT[Age >= input$Age[1] & Age <= input$Age[2]]
    
    if (input$Occupation == "Manual") {
      filterDT <- filterDT[Occupation == "M"]
    } else if (input$Occupation == "Office") {
      filterDT <- filterDT[Occupation == "O"]
    }
    
    filterDT <- filterDT[PostcodeGroup %in% input$PostcodeGroup]
    
    plotsDT <- split(filterDT[, c("PensionAmount", "Age", "PostcodeGroup")], 
                     PostcodeGroup)
    plotsDT <- lapply(plotsDT, function (DT) {
      return(DT[,-3])
    })
    meltDT <- melt(plotsDT, id = "Age") 
    
    ggplot(data = meltDT, aes(x = Age, y = value, group = variable, colour = L1)) + 
      geom_point() +
      scale_fill_brewer(palette = "Set2") +
      ylab("Pension amount (£)") +

    
  })
  
}

shinyApp(ui = ui, server = server)