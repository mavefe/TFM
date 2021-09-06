# Layout functions

library(shiny)

# Dentro de "column()" se pueden meter funciones como sliderInput, plotOutput, etc.

ui <- fluidPage(
  fluidRow(
    column(3, "In the row"), # columna de ancho 3
    column(5, "and in the same row") # seguida de columna de ancho 5 en la misma fila
  ),
  fluidRow(
    column(4, offset = 8, "In other row") # debajo, una columna de ancho 4 con offset = 8
                                          #, que la mueve a la derecha
  )
)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)

# Fin layout functions