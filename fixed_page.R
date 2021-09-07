# fixedPage

library(shiny)

# Crea una página con un ancho predeterminado de 724, 940 o 1170 píxeles (según la ventana del navegador).

ui <- fixedPage(
  title = "Hello, Shiny!",
  fixedRow(
    column(width = 4,
           "4"
    ),
    column(width = 3, offset = 2,
           "3 offset 2"
    )
  )
)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)

# Fin fixedPage