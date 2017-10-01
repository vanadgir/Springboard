library(shiny)
library(ggplot2)

quikdata <- read.csv("quikdata.csv")

# Define UI ----
ui <- fluidPage(
  
  # title panel
  titlePanel("Exploring The College Scorecard Data"),
  
  # sidebar panel
  sidebarLayout(
    sidebarPanel(
      # explain buttons
      helpText("Explore the relationships of various data fields from the College Scorecard dataset."),
      # choose X variable
      selectInput("inputX", 
                  label = "Choose X-Axis Data",
                  choices = names(quikdata)),
      # choose Y variable
      selectInput("inputY",
                  label = "Choose Y-Axis Data",
                  choices = names(quikdata),
                  selected = names(quikdata)[[2]]),
      # plot waits for this button
      actionButton("update",
                   label = "Update")
     # ,  
     # selectInput("inputCol",
     #              label = "Choose which variable to colour by (categorical variable preferred)",
     #              choices = names(quikdata),
     #              selected = names(quikdata)[[7]])
      
    ),
    
    
    # main output panel
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Scatterplot", plotOutput("scatter")),
                  tabPanel("Bar", plotOutput("barplot")),
                  tabPanel("Pie Chart", plotOutput("pie")),
                  tabPanel("Summary", verbatimTextOutput("summary"))
                  )
    )
    
  )
)

# Define server logic ----
server <- function(input, output) {
  quikdata <- read.csv("quikdata.csv")
  
  selectedData <- eventReactive(input$update, {
    quikdata[ , c(input$inputX,input$inputY)]
    })
  
  output$scatter <- renderPlot({
    plot(selectedData())
    })
  
  output$barplot <- renderPlot({
  
  })
  
  output$pie <- renderPlot({
    
  })
  
  output$summary <- renderPrint({
    summary(selectedData()) 
    })
}

# Run the app ----
shinyApp(ui = ui, server = server)