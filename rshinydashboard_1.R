####################### shinydashboard package #######################

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Tab 1", tabName = "tab1", icon = icon("line-chart")),
      menuItem("Tab 2", tabName = "tab2", icon = icon("bar-chart")),
      menuItem("Tab 3", tabName = "tab3", icon = icon("gbp")),
      menuItem("Tab 4", tabName = "tab4", icon = icon("table")),
      menuItem("Tab 5", tabName = "tab5", icon = icon("file-text-o")),
      menuItem("Tab 6", tabName = "tab6", icon = icon("github")),
      menuItem("Tab 7", tabName = "tab7", icon = icon("envelope-o"))
      )
  ),
  
  dashboardBody(
  )
)

server <- function(input, output) {
}

shinyApp(ui, server)