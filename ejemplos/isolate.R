# Isolate

library(shiny)

# Vamos a buscar una forma de prevenir que al modificar el título en la app,
# se calcule de nuevo el gráfico. Isolate() devuelve el resultado como un valor
# no reactivo.

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  textInput(inputId = "title",
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  plotOutput(outputId = "hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num), 
         main = isolate({input$title}))
  })
}

shinyApp(ui = ui, server = server)

# Fin isolate