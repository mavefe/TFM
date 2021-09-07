# CSS 4. Write individual CSS in a tag's style attribute.

library(shiny)

ui <- fluidPage(
  tags$h1("Title", style = "color:red;")
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

# Fin CSS 4