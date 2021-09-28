#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(

    # Application title
    titlePanel("Titanic Passengers"),

    # Row with 2 selectInputs 
    fluidRow(column(6,
                    selectInput("strparam",
                                "Barplot",
                                c(`Survived` = "Survived",
                                  `Class` = "PClass",
                                  `Sex` = "Sex"))),
             column(6,
                    selectInput("numparam",
                                "Histplot",
                                c("Age",
                                  "Fare")))
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
