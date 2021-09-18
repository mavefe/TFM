library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  skin = "black", # Color del tema
  dashboardHeader(
    title = tags$strong( # Título en negrita
      tags$img(src="virus.jpg", height = 40, weight = 40), # Imagen del virus en el encabezado
      "Vacunación COVID-19" # Título
      ),
    titleWidth = 300 # Ancho del encabezado
    ),
  dashboardSidebar(width = 300, # Ancho del sidebar
                   sidebarMenu(
                     menuItem("Gráficos de la evolución", # Nombre que aparece en la opción de menú
                              tabName = "graficos", # Nombre interno de la opción de menú
                              icon = icon("chart-line", lib = "font-awesome") # Icono de la opción de menú
                              ),
                     menuItem("Fuentes",
                              tabName = "fuentes",
                              icon = icon("book", lib = "font-awesome")
                              ),
                     menuItem("Contacto",
                              tabName = "contacto",
                              icon = icon("address-card", lib = "font-awesome")
                              )
                     )
                   ),
  dashboardBody(
    tags$head(tags$style(HTML(".main-sidebar { font-size: 16px; }")), # Tamaño de la fuente del sidebar
              tags$link(rel = "stylesheet",  # Usa el archivo custom.css,
                        type = "text/css",   # donde se define el tipo de fuente
                        href = "custom.css") # Tahoma
              ),
    tabItems(
      tabItem("contacto", # En la opción de menú "Contacto" aparecerán las siguientes cajas de información:
              infoBox("Linkedin", "María Vela Felardo",            # Caja de Linkedin
                      icon = icon("linkedin", lib = "font-awesome"), 
                      fill = TRUE),
              infoBox("Gmail", "dc1996mariavelafelardo@gmail.com", # Caja de Gmail
                      icon = icon("google", lib = "font-awesome"), 
                      fill = TRUE, color = "red"),
              infoBox("E-mail UEMC", "mvela23668@alumnos.uemc.es", # Caja de email UEMC
                      icon = icon("envelope", lib = "font-awesome"), 
                      fill = TRUE, color = "green"),
              "PROBANDO"
      ),
      tabItem("fuentes"), # En la opción de menú "Fuentes" y
      tabItem("graficos") # "Gráficos" de momento no debe aparecer nada
      )
    )
)

server <- function(input, output) {}

shinyApp(server = server, ui = ui)