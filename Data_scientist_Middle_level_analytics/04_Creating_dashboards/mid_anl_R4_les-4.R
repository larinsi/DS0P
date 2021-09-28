#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

tit <- read.csv("Titanic.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Titanic Passengers"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("surv",
                       "Survived:",
                       c("All",
                         unique(as.character(tit$Survived))))
    ),
    column(4,
           selectInput("cl",
                       "Class:",
                       c("All",
                         unique(as.character(tit$Pclass))))
    ),
    column(4,
           selectInput("sex",
                       "Sex:",
                       c("All",
                         unique(as.character(tit$Sex))))
    )
  ),
  # Create a new row for the table.
  DT::dataTableOutput("table")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- tit
    if (input$surv != "All") {
      data <- data[data$Survived == input$surv,]
    }
    if (input$cl != "All") {
      data <- data[data$Pclass == input$cl,]
    }
    if (input$sex != "All") {
      data <- data[data$Sex == input$sex,]
    }
    data
  }))
  
}

# Run the application 
shinyApp(ui = ui, server = server)

