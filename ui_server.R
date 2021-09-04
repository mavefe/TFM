# ui.R y server.R

# Todo lo que viene ahora se podría meter en un archivo llamado ui.R
# sin poner "ui <-"
library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  plotOutput(outputId = "hist")
)

# Igualmente todo lo que viene ahora se podría meter en un archivo llamado 
# server.R sin poner "server <-", añadiendo también "library(shiny)" al principio
# y eliminando "shinyApp(ui = ui, server = server)"
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)

# Fin ui.R y server.R