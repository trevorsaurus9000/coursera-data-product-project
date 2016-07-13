library(UsingR)
library(rgdal)

setwd("C:/THARRIS/Coursera/Data Products/course-project")

# ingest our data
broomfield.ward5.map <- readOGR(dsn = ".", layer = "broomfield.ward5.map")

shinyServer(  
     function(input, output) {    
          output$newPlot <- renderPlot({
               
               # filter our data set so that we only show what the user is interested in
               filterBATHS <- broomfield.ward5.map[which(broomfield.ward5.map@data$BATHS >= input$BATHS_INPUT),]
               filterBEDROOMS <- filterBATHS[which(filterBATHS@data$BEDROOMS >= input$BEDROOMS_INPUT),]
               filterACTUALYEAR <- filterBEDROOMS[which(filterBEDROOMS@data$ACTUALYEAR >= input$ACTUALYEAR_INPUT),]
               filterLIVINGAREA <- filterACTUALYEAR[which(filterACTUALYEAR@data$LIVINGAREA >= input$LIVINGAREA_INPUT),]
               filterLOWPRICE <- filterLIVINGAREA[which(filterLIVINGAREA@data$FINALACTUA >= input$FINALACTUA_INPUT[1]),]
               filterHIGHPRICE <- filterLOWPRICE[which(filterLOWPRICE@data$FINALACTUA <= input$FINALACTUA_INPUT[2]),]
               
               plotSubSet <- filterHIGHPRICE
               plot(plotSubSet)
               text(50,50, paste("Properties Found: ", nrow(plotSubSet@data)))

          })      }
)