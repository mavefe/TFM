# Reactive

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  plotOutput(outputId = "hist"),
  verbatimTextOutput("stats")
)

server <- function(input, output) {
  data <- reactive({
    rnorm(input$num)
  })
  output$hist <- renderPlot({
    #hist(rnorm(input$num)) al definir arriba "data", se puede poner en función de "data":
    hist(data())
  })
  output$stats <- renderPrint({
    #summary(rnorm(input$num)) y lo mismo aquí:
    summary(data())
  })
}

shinyApp(ui = ui, server = server)

# Fin reactive