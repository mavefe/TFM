# dashboardPage

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Encabezado"),
  dashboardSidebar("Barra lateral"),
  dashboardBody("Cuerpo")
)

server <- function(input, output) {}

shinyApp(server = server, ui = ui)

# Fin dashboardPage