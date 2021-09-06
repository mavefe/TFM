# Tags 2

library(shiny)

# En lugar de tags$h1, tags$p, tags$a, ... se puede utilizar directamente el nombre

ui <- fluidPage(
  h1("My Shiny App"),
  p(style = "font-family:Impact",
    "See other apps in the",
    a("Shiny Showcase",
      href = "http://www.rstudio.com/products/shiny/shiny-user-showcase/")
  )
)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)

# Fin tags 2