# Layers of panels

library(shiny)

# Por ejemplo, con wellPanel aparece todo dentro de un mismo panel gris.
# Con tabsetPanel y tabPanel, se divide en pestañas.
# Si en lugar de poner tabsetPanel, ponemos naclistPanel, las pestañas saldrán una debajo de la otra.

ui <- fluidPage(
  tabsetPanel(
    tabPanel("tab 1",
             wellPanel(
               sliderInput("num", "Choose a number", value = 25, min = 1, max = 100),
               textInput("title", value = "Histogram", label = "Write a title")
               )
             ),
    tabPanel("tab 2",
             plotOutput("hist")
             )
    )
  )

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)

## Otros ejemplos:

# absolutePanel()
# conditionalPanel()
# fixedPanel()
# headerPanel()
# inputPanel()
# mainPanel()
# navlistPanel()
# sidebarPanel()
# tabPanel()
# tabsetPanel()
# titlePanel()

# Fin layers of panels