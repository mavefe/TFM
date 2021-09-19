library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  skin = "black", # Color del tema
  dashboardHeader(
    title = tags$strong( # Título en negrita
      tags$img(src='svg/virus.svg', height='35', width='35'), # Icono del virus en el encabezado
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
                     menuItem("Información y Contacto",
                              tabName = "contacto",
                              icon = icon("address-card", lib = "font-awesome")
                              )
                     )
                   ),
  dashboardBody(
    tags$head(tags$style(HTML(".main-sidebar { font-size: 16px; }")), # Tamaño de la fuente del sidebar
              tags$link(rel = "stylesheet",         # Usa el archivo centurygothic.css,
                        type = "text/css",          # donde se define el tipo de fuente
                        href = "centurygothic.css") # Century Gothic
              ),
    tabItems(
      tabItem("contacto", # En la opción de menú "Contacto" aparecerán el siguiente texto y las siguientes cajas de información:
              div("Mi nombre es María Vela Felardo y soy de Sevilla.",
                  br(),
                  "Soy graduada en matemáticas por la universidad de esta preciosa ciudad.",
                  p(),
                  "Aunque estudié para dedicarme a la docencia, la vida me llevó por otro camino,",
                  br(),
                  "y ahora trabajo en el desarrollo y el mantenimiento",
                  br(),
                  "del Sistema Integrado de Servicios Sociales de la Junta de Andalucía",
                  br(),
                  "(concretamente en la Renta Mínima de Inserción Social de Andalucía)",
                  br(),
                  "como analista funcional y programadora.",
                  p(),
                  "Actualmente estoy cursando el Máster Universitario en Gestión y Análisis",
                  br(),
                  "de Grandes Volúmenes de Datos (Big Data), impartido por la Universidad Europea",
                  br(),
                  "Miguel de Cervantes y por la Escuela de Negocios y Dirección.",
                  p(),
                  "Elegí realizar mi Trabajo Final de Máster sobre aplicaciones Shiny porque",
                  br(),
                  "en mi trabajo actual también realizo informes interactivos, paneles y cuadros de mando,",
                  br(),
                  "y me llamaba mucho la atención la idea de realizarlo con esta herramienta",
                  br(),
                  "y utilizando lenguaje R.",
                  p(),
                  "Para cualquier pregunta o sugerencia podéis contactar conmigo por LinkedIn",
                  br(),
                  "o por correo electrónico:",
                  p(),
                  style="text-align: center; font-size: 16px;"), # Texto centrado y con tamaño 16
              fluidRow(
                infoBox("LinkedIn", "María Vela Felardo",            # Caja de Linkedin
                        icon = icon("linkedin", lib = "font-awesome"), 
                        fill = TRUE),
                infoBox("Gmail", "dc1996mariavelafelardo@gmail.com", # Caja de Gmail
                        icon = icon("google", lib = "font-awesome"), 
                        fill = TRUE, color = "red"),
                infoBox("E-mail UEMC", "mvela23668@alumnos.uemc.es", # Caja de email UEMC
                        icon = icon("envelope", lib = "font-awesome"), 
                        fill = TRUE, color = "green")
              ),
              div(
                  p(),
                  "Os animo a que veáis el",
                  a("código de mi aplicación en GitHub", href="https://github.com/mavefe/TFM"),
                  tags$img(src='svg/github.svg', height='20', width='20'),
                  br(),
                  "y probéis a modificarla vosotros mismos.",
                  style="text-align: center; font-size: 16px;"
                  )
      ),
      tabItem("fuentes"), # En la opción de menú "Fuentes" y
      tabItem("graficos") # "Gráficos" de momento no debe aparecer nada
      )
    )
)

server <- function(input, output) {}

shinyApp(server = server, ui = ui)