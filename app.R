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
    tags$head(tags$style(HTML(".main-sidebar { font-size: 16px; }"))) # Tamaño de la fuente del sidebar
    )
)

server <- function(input, output) {}

shinyApp(server = server, ui = ui)