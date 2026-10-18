# App Shiny del dashboard ENEM. Se exporta a estático con:
#   shinylive::export("explorar/app-src", "explorar/app")
# Solo usa paquetes disponibles en webR (shiny, ggplot2, dplyr).
library(shiny)
library(ggplot2)
library(dplyr)

datos <- read.csv("agregados.csv")   # columnas esperadas: anio, variable, grupo, nivel, estimacion, li, ls

ui <- fluidPage(
  titlePanel(NULL),
  sidebarLayout(
    sidebarPanel(width = 3,
      selectInput("var", "Variable", choices = unique(datos$variable)),
      selectInput("grupo", "Desagregar por", choices = unique(datos$grupo))
    ),
    mainPanel(width = 9,
      plotOutput("tendencia", height = 380),
      tableOutput("tabla")
    )
  )
)

server <- function(input, output, session) {
  sel <- reactive(filter(datos, variable == input$var, grupo == input$grupo))
  output$tendencia <- renderPlot({
    ggplot(sel(), aes(anio, estimacion, colour = nivel)) +
      geom_ribbon(aes(ymin = li, ymax = ls, fill = nivel), alpha = .15, colour = NA) +
      geom_line(linewidth = 1) + geom_point(size = 2) +
      scale_x_continuous(breaks = seq(1997, 2024, 3)) +
      labs(x = NULL, y = NULL, colour = NULL, fill = NULL) +
      theme_minimal(base_size = 14) + theme(legend.position = "top")
  })
  output$tabla <- renderTable(sel() |> select(anio, nivel, estimacion), digits = 2)
}

shinyApp(ui, server)
