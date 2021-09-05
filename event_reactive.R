# EventReactive

library(shiny)

# Vamos a hacer que el gráfico no se actualice hasta que pulsemos el botón.

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  actionButton(inputId = "go",
               label = "Update"),
  plotOutput("hist")
)

server <- function(input, output) {
  data <- eventReactive(input$go, {
    rnorm(input$num)
  })
  output$hist <- renderPlot({
    hist(data())
  })
}

shinyApp(ui = ui, server = server)

# Fin eventReactive