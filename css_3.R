# CSS 3. Write global CSS in header.

library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(
      HTML("p {
           color:red;
      }")
    )
  )
)

# Se puede hacer lo mismo poniendo lo siguiente:

#ui <- fluidPage(
#  includeCSS("file.css")
#)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

# Fin CSS 3