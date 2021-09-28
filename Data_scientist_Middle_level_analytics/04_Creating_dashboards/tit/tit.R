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

    # Row with 2 selectInputs for choosing params
    fluidRow(column(6,
                    selectInput("strparam",
                                "Barplot:",
                                c(`Survived` = "Survived",
                                  `Class` = "PClass",
                                  `Sex` = "Sex"))),
             column(6,
                    selectInput("numparam",
                                "Histplot:",
                                c("Age",
                                  "Fare")))
    ),
    
    # Row with 2 selectInputs for choosing colors
    fluidRow(column(6,
                    selectInput("color1",
                                "Color 1:",
                                c(`Violet` = "violet",
                                  `Dark orchid` = "darkorchid",
                                  `Green yellow` = "greenyellow",
                                  `Light pink` = "lightpink"))),
             column(6,
                    selectInput("color2",
                                "Color 2:",
                                c(`Fire brick` = "firebrick2",
                                  `Khaki` = "khaki1",
                                  `Magenta` = "magenta",
                                  `Purple` = "purple2"))),
             
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
