# Crear input con una función input

library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num", # Es el Input name (para uso interno)
              label = "Choose a number", # Etiqueta para mostrars
              value = 25, min = 1, max = 100) # Argumentos específicos de esta función input
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

# Fin crear input con una función input

## Otros ejemplos de funciones input:

# actionButton()
# submitButton()
# checkboxInput()
# chekboxGroupInput()
# dateInput()
# dateRangeInput()
# fileInput()
# numericImput()
# passwordInput()
# radioButtons()
# selectInput()
# sliderInput()
# textInput()

## Fin otros ejemplos de funciones input