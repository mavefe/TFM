# CSS

library(shiny)

ui <- fluidPage(
  theme = "bootswatch-cerulean.css",
  sidebarLayout(
    sidebarPanel(),
    mainPanel()
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

# Fin CSS