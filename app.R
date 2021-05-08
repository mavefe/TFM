library(shiny)
ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name, "!")
  })
}
shinyApp(ui, server)#ctrl+shift+enter atajo para abrir
#para cerrar la app pulsar esc

#para que se muestre en el viewer (pero primero, en el shiny-run.R,
#hay que darle a Jobs/Start local job y poner esa URL):
#rstudioapi::viewer("http://127.0.0.1:3582")
#Haciendo esto, cada vez que guarde (con Ctrl+S por ejemplo)
#se actualiza el viewer.