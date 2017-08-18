####################### shinydashboard package #######################

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Load data", tabName = "data", icon = icon("database")),
      menuItem("Charts 1", tabName = "charts1", icon = icon("line-chart")),
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
              fluidRow(
              )
      ),
      
      # Second tab - database
      tabItem(tabName = "data",
              fluidRow()
              )
      
    )
  )
)

server <- function(input, output) {
}

shinyApp(ui, server)