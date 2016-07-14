library(UsingR)
library(rgdal)

setwd("C:/THARRIS/Coursera/Data Products/course-project")

# ingest our data
broomfield.ward.map <- readOGR(dsn = "./data", layer = "broomfield.ward.map")

shinyServer(  
     function(input, output) 
     {    
          
          # filter our data set so that we only show what the user is interested in
          filteredProperties <- reactive({
               filterBATHS <- broomfield.ward.map[which(broomfield.ward.map@data$BATHS >= input$BATHS_INPUT),]
               filterBEDROOMS <- filterBATHS[which(filterBATHS@data$BEDROOMS >= input$BEDROOMS_INPUT),]
               filterACTUALYEAR <- filterBEDROOMS[which(filterBEDROOMS@data$ACTUALYEAR >= input$ACTUALYEAR_INPUT),]
               filterLIVINGAREA <- filterACTUALYEAR[which(filterACTUALYEAR@data$LIVINGAREA >= input$LIVINGAREA_INPUT),]
               filterLOWPRICE <- filterLIVINGAREA[which(filterLIVINGAREA@data$FINALACTUA >= input$FINALACTUA_INPUT[1]),]
               filterHIGHPRICE <- filterLOWPRICE[which(filterLOWPRICE@data$FINALACTUA <= input$FINALACTUA_INPUT[2]),]
               filteredProperties <- filterHIGHPRICE
          })
          
          # plot the filtered homes
          output$newPlot <- renderPlot({plot(filteredProperties())})
          
          # based on our filters, how many homes are we looking at?
          output$homesFound <- renderText({
               filteredHomes <- filteredProperties()@data
               homes <- nrow(filteredHomes)
               paste("Homes found: ", homes)
          })
          
          # based on our filters, whats the average property value, as assessed by the city?
          output$avgPropertyValue <- renderText({
               filteredHomes <- filteredProperties()@data
               avgPropertyValue <- round(mean(filteredHomes$FINALACTUA),0)
               paste("Average assessed property value in 2015: $", avgPropertyValue)
          })
          
          # based on our filters, whats the average property value, as assessed by the city?
          output$avg2015SellingPrice <- renderText({
               filteredHomes <- filteredProperties()@data
               soldHomes <- filteredHomes[!is.na(filteredHomes$SALEDATE),]
               recentlySoldHomes <- soldHomes[soldHomes$SALEDATE == 2015,]
               avg2015SellingPrice <- round(mean(recentlySoldHomes$FINALACTUA),0)
               paste("Average selling price for homes sold in 2015: $", avg2015SellingPrice)
          })
          
     }
)