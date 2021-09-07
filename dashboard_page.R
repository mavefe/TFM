# dashboardPage

library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

server <- function(input, output) {
}

shinyApp(server = server, ui = ui)

# Fin dashboardPage