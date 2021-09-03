# App básica

library(shiny)
ui <- fluidPage("Hola mundo")

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

# Fin app básica