
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("IS IT SAFE TO BOAT?"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("Precip",
                  "Inches of rain in the last 48 hours:",
                  step = .01,
                  min = 0.00,
                  max = 3.00,
                  value = 0.00)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Expected Water Saftey"),
      h4("Based on predicted E. coli Bacteria Levels (per 100 mL)*"),
      h5("Precipitation has been shown to raise bacteria levels in the Mystic river.  This App will
         help boaters determine the saftey of the water before they go boating."),
      
      br(),
    
      h3("Blessing of the Bay:"),
      p(uiOutput("BOBHtml1")),
      div("Predicted Bacteria level:", 
      textOutput("BOBHtml2"), style = "border:solid"), 
      
      h3("Lower Mystic River:"),
      p(uiOutput("MYR0435Html1")),
      div("Predicted Bacteria level:", 
           textOutput("MYR0435Html2"), style = "border:solid"),
      
      br(),
      h3("Malden River:"),
      p(uiOutput("MAR0065Html1")),
      div("Predicted Bacteria level:",
      textOutput("MAR0065Html2"), style = "border: solid"),
         
      br(),
      h5("For more information on this project go to:"),
      a("http://rpubs.com/arcticgrayling/222528",href="http://rpubs.com/arcticgrayling/222528"),
      br(),
      h5("* Notice: This site uses preliminary data and prediction models, 
            it is for educational and demonstration purposes only.  
            For more information about the Mystic River and water quality, 
            go to:"),
      a("http://mysticriver.org/",     href="http://mysticriver.org/"),
      br(),
      br()
      
    )
  )
))



