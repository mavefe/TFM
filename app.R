library(shiny)

options(shiny.reactlog = TRUE)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textOutput("panel")
    ),
    mainPanel(
      tabsetPanel(
        id = "tabset",
        tabPanel("panel 1", "one"),
        tabPanel("panel 2", "two"),
        tabPanel("panel 3", "three")
      )
    )
  )
)
server <- function(input, output, session) {
  output$panel <- renderText({
    paste("Current panel: ", input$tabset)
  })
}
shinyApp(ui, server) # ctrl+shift+enter atajo para abrir
# para cerrar la app pulsar esc

# para que se muestre en el viewer (pero primero, en el shiny-run.R,
# hay que darle a Jobs/Start local job y poner esa URL):
# rstudioapi::viewer("http://127.0.0.1:3582")
# Haciendo esto, cada vez que guarde (con Ctrl+S por ejemplo)
# se actualiza el viewer.
