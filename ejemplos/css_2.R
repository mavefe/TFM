# CSS 2. Link to an external CSS file.

library(shiny)

ui <- fluidPage(
  tags$head(
    tags$link(
      rel = "stylesheet",
      type = "txt/css",
      href = "file.css")
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

# Fin CSS 2