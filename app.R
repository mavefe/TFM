#---- 1. LIBRERIAS ----

library(shiny)
library(shinydashboard)
library(dplyr)
library(quantmod)
library(highcharter)


#---- 2. CSV DE DATOS ----

vacunas     <- read.csv("data/country_vaccinations.csv")
fabricantes <- read.csv("data/country_vaccinations_by_manufacturer.csv")

# Renombramos las columnas que nos interesan:
colnames(vacunas)[4] <- "Total de vacunas realizadas"
colnames(vacunas)[5] <- "Personas con al menos una dosis"
colnames(vacunas)[6] <- "Personas con la pauta completa"
colnames(vacunas)[8] <- "Vacunas diarias"

#---- 3. INTERFAZ DE USUARIO ----
ui <- dashboardPage(
  skin = "black",                                             # Color del tema
  dashboardHeader(
    title = tags$strong(                                      # Título en negrita
      tags$img(src='svg/virus.svg', height='35', width='35'), # Icono del virus en el encabezado
      "Vacunación COVID-19"                                   # Título
    ),
    titleWidth = 300                                          # Ancho del encabezado
  ),
  dashboardSidebar(width = 300, # Ancho del sidebar
                   sidebarMenu(
                     menuItem("Gráficos de la evolución",                      # Nombre que aparece en la opción de menú
                              tabName = "graficos",                            # Nombre interno de la opción de menú
                              icon = icon("chart-line", lib = "font-awesome")  # Icono de la opción de menú
                     ),
                     selectInput(               # Selección del país para la gráfica
                       "pais",
                       "País",
                       unique(vacunas$country), # Toma los valores distintos de la columna "country"
                       selected = "Spain"       # Valor inicial
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
              tags$link(rel = "stylesheet",         # Usa el archivo centurygothic.css para el encabezado,
                        type = "text/css",          # donde se define el tipo de fuente
                        href = "centurygothic.css") # Century Gothic
    ),
    
    
    tabItems(
      tabItem(
        tabName = "graficos",
        fluidRow(box(highchartOutput("hc1")), box(highchartOutput("hc2")))
        
        
      ),
      
      tabItem("contacto",                    # En la opción de menú "Información y Contacto"
              fluidRow(textOutput("result"), # aparecerán el siguiente texto y las siguientes cajas de información:
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
                           style="text-align: center; font-size: 16px;")), # Texto centrado y con tamaño 16
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
                a("código de mi aplicación en GitHub", 
                  href="https://github.com/mavefe/TFM"),                 # Enlace a mi GitHub
                tags$img(src='svg/github.svg', height='20', width='20'), # Icono de GitHub
                br(),
                "y probéis a modificarla vosotros mismos.",
                style="text-align: center; font-size: 16px;"
              )
      ),
      tabItem("fuentes", # Opción de menú "Fuentes"
              fluidRow(
                column(12,style='height:250px'),
                column(12,
                       div("Los datos utilizados en esta aplicación",
                           br(),
                           "pertenecen al dataset",
                           a("COVID-19 World Vaccination Progress", 
                             href="https://www.kaggle.com/gpreda/covid-world-vaccination-progress"),
                           br(),
                           "realizado por Gabriel Preda y actualizado diariamente en Kaggle.",
                           style="text-align: center; font-size: 16px;",
                           p(),
                           tags$img(src='svg/kaggle.svg', height='200', width='200'),
                       )
                )
              )
              
      )
    )
  )
)


#---- 4. SERVIDOR ----

server = function(input, output) {
  
  vacunas_pais <- reactive({               # Primero filtramos el dataset
    filter(vacunas, country == input$pais) # por el país elegido
  })
  
  vacunas_pais_1 <- reactive({                                # Después filtramos una vez para cada variable,
    filter(vacunas_pais(), is.na(vacunas_pais()[4]) == FALSE) # de forma que los registros asociados a cada variable no estén vacíos
  })
  
  vacunas_pais_2 <- reactive({
    filter(vacunas_pais(), is.na(vacunas_pais()[5]) == FALSE)
  })
  
  vacunas_pais_3 <- reactive({
    filter(vacunas_pais(), is.na(vacunas_pais()[6]) == FALSE)
  })
  
  vacunas_pais_4 <- reactive({
    filter(vacunas_pais(), is.na(vacunas_pais()[8]) == FALSE)
  })
  
  output$hc1 <- renderHighchart({
    highchart()
      hc_xAxis(categories = vacunas_pais()$date, # El eje X debe ser la columna de fechas
               visible = FALSE) %>%              # pero lo ponemos oculto para que quede más estético
      
      hc_add_series(data = vacunas_pais()$"Total de vacunas realizadas",  # Variable que se muestra en la gráfica
                    name = "Total de vacunas realizadas") %>%
      hc_add_series(data = vacunas_pais()$"Personas con al menos una dosis", 
                    name = "Personas con al menos una dosis") %>%
      hc_add_series(data = vacunas_pais()$"Personas con la pauta completa", 
                    name = "Personas con la pauta completa") %>%
      
      hc_colors(c("orange", "lightgreen", "blue")) # Colores de las gráficas
  })
  
  output$hc2 <- renderHighchart({
    highchart() %>%
      hc_xAxis(categories = vacunas_pais()$date,
               visible = FALSE) %>%
      
      hc_add_series(data = vacunas_pais()$"Vacunas diarias",
                    name = "Vacunas diarias") %>%
      
      hc_colors("violet")
  })
}


#---- 5. LLAMADA AL SERVIDOR Y A LA INTERFAZ DE USUARIO ----

shinyApp(server = server, ui = ui)