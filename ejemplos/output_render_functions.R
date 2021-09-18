# Crear output con una función output

library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  plotOutput(outputId = "hist")
)

# Hay que definir el funcionamiento del objeto output en el server function
# Aquí se usa la reactividad, ya que cada vez que la persona cambie el input, también se cambiará el output

server <- function(input, output) {
  output$hist <- renderPlot({ #el nombre de output$XXX debe ser el mismo que el de outputId
    #title <- "100 random normal values" se puede utilizar si el valor input fuera siempre 100
    hist(rnorm(input$num))#, main = title) #el nombre de input$XXX debe ser el mismo que el de inputId
  })                                       #si se usa title, descomentar main = title
}

shinyApp(ui = ui, server = server)

# Fin crear output con una función output

## Otros ejemplos de funciones output:

# dataTableOutput()
# htmlOutput()
# imageOutput()
# tableOutput()
# textOutput()
# uiOutput()
# verbatimTextOutput()

## Fin otros ejemplos de funciones output

## Otros ejemplos de funciones render:

# renderDataTable()
# renderImage()
# renderPrint()
# renderTable()
# renderText()
# renderUI()

## Fin otros ejemplos de funciones render