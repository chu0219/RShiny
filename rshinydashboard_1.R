####################### shinydashboard package #######################

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "R Shiny Dashboard - test"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Load data", tabName = "data", icon = icon("database")),
      menuItem("Charts 1", tabName = "charts1", icon = icon("line-chart"),
               menuSubItem("Sub-item 1", tabName = "subitem1"),
               menuSubItem("Sub-item 2", tabName = "subitem2")),
      menuItem("Charts 2", tabName = "charts2", icon = icon("bar-chart")),
      menuItem("Some money info", tabName = "tab3", icon = icon("gbp")),
      menuItem("Tables", tabName = "tables", icon = icon("table")),
      menuItem("More info", tabName = "tab5", icon = icon("file-text-o")),
      menuItem("Github repositry", tabName = "github", icon = icon("github")),
      menuItem("Contact", tabName = "contact", icon = icon("envelope-o"))
      )
  ),
  
  dashboardBody(
    tabItems(
      # First tab - dashboard
      tabItem(tabName = "dashboard",
              # Title of tab
              h2("Dashboard"),
              
              # Tab box
              fluidRow(
                tabBox(
                  title = "Data tab box",
                  id = "tabbox1", height = "250px",
                  tabPanel("Male", "Data for males"),
                  tabPanel("Female", "Data for females")
                )
              ),
              
              # Info boxes
              fluidRow(
                infoBox("Dataset size", 10000, icon = icon("users")),
                infoBox("Year", "2016 - 2017", icon = icon("calendar"), color = "orange"),
                infoBox("Gender", "Male", icon = icon("venus-mars"), color = "green")
              )
      ),
      
      # Second tab - database
      tabItem(tabName = "data",
              h2("Load Data"),
              fileInput("DT", label = "Upload data"),
              conditionalPanel(
                condition = "output.file_import_ready",
                selectInput("select", label = "Variable name: age",
                            choices = c("Age", "PenBand", "PostcodeGroup", "Occupation"))
              )
              ),
      
      
      # Contact tab
      tabItem(tabName = "contact",
              h2("Contact"),
              p("If you have any problems using this R Shiny app, please contact:"),
              p("Chuyi Yang"),
              p("chuyi.yang@hymans.co.uk")
      )
      
    )
  )
)

server <- function(input, output) {
  
  output$file_import_ready <- reactive({
    return(!is.null(input$DT))
  })
  
  outputOptions(output, "file_import_ready", suspendWhenHidden = FALSE)
  
}

shinyApp(ui, server)