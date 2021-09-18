# Tags

# Al escribir en consola names(tags), nos muestra todos los tags equivalentes
# de HTML en R

library(shiny)

ui <- fluidPage(
  tags$h1("First level"),
  tags$h2("Second level"),
  tags$h3("Third level"),
  tags$h4("Fourth level"),
  tags$h5("Fifth level"),
  tags$h6("Sixth Level"),
  
  tags$p("This is a Shiny app."), #tags$p sirve para que la frase salga en otro párrafo
  
  tags$a(href= "http://www.git.com", "Git"),
  
  tags$em("is a web page."), #tags$em sirve para que el texto aparezca en cursiva
  
  tags$br(), #line break
  
  tags$strong("Texto en negrita."),
  
  tags$hr(), #separa con una línea horizontal
  
  tags$code("This is a Shiny app."), #texto fromateado como código computacional
  
  tags$p(),
  
  tags$img(height = 100,
           width = 290,
           src = "http://www.rstudio.com/images/RStudio.2x.png")
  
  # Si queremos meter una imagen de nuestra carpeta local, debemos incluirla
  # en una carpeta llamada "www", entonces solo habría que poner en src: src = "image.png"
  # y lo demás igual
  
)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)

# Fin tags