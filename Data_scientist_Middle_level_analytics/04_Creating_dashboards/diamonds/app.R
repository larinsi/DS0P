#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Diamonds"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("ucolor", "Fill color:",
                        choices = c("Red" = "red", "Blue" = "blue", "Yellow" = "yellow", "Orange" = "orange"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("barPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$barPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- table(diamonds$cut)

        # draw the histogram with the specified number of bins
        barplot(x, names.arg = names(x), col = input$ucolor, border = 'black')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
