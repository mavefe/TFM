# Trigger observeEvent

library(shiny)

ui <- fluidPage(
  actionButton(inputId = "clicks",
               label = "Click me")
)

# Cada vez que se haga click en el botón, aparecerá en la consola el nº de veces
# que se ha hecho click.

server <- function(input, output) {
  observeEvent(input$clicks, {
    print(as.numeric(input$clicks))
  })
}

shinyApp(ui = ui, server = server)

# Fin trigger observeEvent