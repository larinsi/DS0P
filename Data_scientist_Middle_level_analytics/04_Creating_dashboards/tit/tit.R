#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
tit <- read.csv("Titanic.csv")


ui <- fluidPage(

    # Application title
    titlePanel("Titanic Passengers"),

    # Row with 2 selectInputs for choosing params
    fluidRow(column(6,
                    selectInput("strparam",
                                "Barplot:",
                                c(`Survived` = "Survived",
                                  `Class` = "Pclass",
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
             
             ),
    
    fluidRow(splitLayout(cellWidths = c("50%", "50%"),
                         plotOutput("barplot"),
                         plotOutput("histplot")))
)

# Define server logic required to draw a graphics
server <- function(input, output) {
    
    dat <- tit

    output$histplot <- renderPlot({
        x <- dat[, input$numparam]

        hist(x, 
             col = input$color2, 
             border = 'black', 
             xlab = input$numparam,
             main = "")
    })
    
    output$barplot <- renderPlot({
        x <- dat[, input$strparam]
        
        barplot(table(x),
                col = input$color1,
                border = "black",
                xlab = input$strparam)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
