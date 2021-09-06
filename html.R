# HTML

library(shiny)

# También se puede escribir en HTML. Se ponen comillas simples porque dentro del
# código se usan comillas dobles. Si no se usaran, se podrían poner fuera comillas dobles.

ui <- fluidPage(
  HTML(
    '<div class="container-fluid">
    <h1>My Shiny App</h1>
    <p style="font-family:Impact">
    See other apps in the
    <a href="http://www.rstudio.com/products/shiny/shiny-user-showcase/">
    Shiny Showcase</a>
    </p>
    </div>'
  )
)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)

# Fin HTML