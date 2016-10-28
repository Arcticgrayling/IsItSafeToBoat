
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

#setwd("~/Documents/datasciencecoursera/DataProducts/IsTheWaterSafe/")
BOB_data <- read.table("BOB_data.Rda")
MYR0435_data <- read.table("MYR0435_data.Rda")
MAR0065_data <- read.table("MAR0065_data.Rda")
server <- shinyServer(function(input, output) {
  
  #Generate models
  BOB_Fit <- lm(ECOLI ~ Precip.48, data= BOB_data)
  predBacBOB <- reactive({
    preciP <- input$Precip
    predict(BOB_Fit, newdata = data.frame(Precip.48 = preciP))
  })
  
  MYR0435_Fit <- lm(ECOLI ~ Precip.48, data= MYR0435_data)
  predBacMYR0435 <- reactive({
    preciP <- input$Precip
    predict(MYR0435_Fit, newdata = data.frame(Precip.48 = preciP))
  })
  
  MAR0065_Fit <- lm(ECOLI ~ Precip.48, data= MAR0065_data)
  predBacMAR0065 <- reactive({
    preciP <- input$Precip
    predict(MAR0065_Fit, newdata = data.frame(Precip.48 = preciP))
  })
  
  output$BOBHtml1 <- renderUI({
    if (predBacBOB() < 235 ){
      p("OK :  Bactiria Levels are predicted to be normal,
        safe for boating and swimming", style = "font-size: 1.3em; color:white; background:blue")
     # p(" predicted level is: ",predBacBOB(), style = "color:white; background:blue")
    }
    else if ((predBacBOB() >=235) & (predBacBOB() < 1260)){
      p("Caution: Bactiria Levels are elevated, Ok for boating but not swimming"
        , style = "font-size: 1.3em; color:Black; background:Yellow")
    }# end else if
    else if ((predBacBOB() >=1260)){
      p("NOTICE: Bacteria Leves are high, NO BOATING OR SWIMMING", 
        style ="font-size: 1.3em; color:black; background:red")
      
    }
  })#renderUI
    
    output$BOBHtml2 <- renderText({
         predBacBOB()
    })
    
    #MYSTIC RIVER
    output$MYR0435Html1 <- renderUI({
      if (predBacMYR0435() < 235 ){
        p("OK: Bactiria Levels are predicted to be normal,
          safe for boating and swimming", style = "font-size: 1.3em; color:white; background:blue")
      }
      else if ((predBacMYR0435() >=235) & (predBacMYR0435() < 1260)){
        p("Caution: Bactiria Levels are elevated, Ok for boating but not swimming"
          , style = "font-size: 1.3em; color:Black; background:Yellow")
      }# end else if
      else if ((predBacMYR0435() >=1260)){
        p("NOTICE: Bacteria Leves are high, NO BOATING OR SWIMMING", 
          style ="font-size: 1.3em; color:black; background:red")
       }
    })#renderUI
    
    output$MYR0435Html2 <- renderText({
     predBacMYR0435() 
    })
    
    #Malden RIVER
    output$MAR0065Html1 <- renderUI({
      if (predBacMAR0065() < 235 ){
        p("OK :  Bactiria Levels are predicted to be normal,
          safe for boating and swimming", style = "font-size: 1.3em; color:white; background:blue")
        # p(" predicted level is: ",predBacBOB(), style = "color:white; background:blue")
      }
      else if ((predBacMAR0065() >=235) & (predBacMAR0065() < 1260)){
        p("Caution: Bactiria Levels are elevated, Ok for boating but not swimming"
          , style = "font-size: 1.3em; color:Black; background:Yellow")
      }# end else if
      else if ((predBacMAR0065() >=1260)){
        p("NOTICE: Bacteria Leves are high, NO BOATING OR SWIMMING", 
          style ="font-size: 1.3em; color:black; background:red")
      }
    })#renderUI
    
    output$MAR0065Html2 <- renderText({
      predBacMAR0065() 
    })
    
    
    
})# END SHiny server