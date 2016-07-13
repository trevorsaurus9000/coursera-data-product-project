setwd("C:/THARRIS/Coursera/Data Products/course-project")

library(rgdal)

# ingest our data
broomfield.county.map <- readOGR(dsn = ".", layer = "Parcels")

# decide which ward we want to look at, then filter our data
#' broomfield.ward1.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-1"),]
#' broomfield.ward2.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-2"),]
#' broomfield.ward3.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-3"),]
#' broomfield.ward4.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-4"),]
broomfield.ward5.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-5"),]

# drop incomplete records (and any non residential records)
broomfield.ward5.map <- broomfield.ward5.map[!is.na(broomfield.ward5.map@data$BATHS),]
broomfield.ward5.map <- broomfield.ward5.map[!is.na(broomfield.ward5.map@data$BEDROOMS),]
broomfield.ward5.map <- broomfield.ward5.map[!is.na(broomfield.ward5.map@data$ACTUALYEAR),]
broomfield.ward5.map <- broomfield.ward5.map[!is.na(broomfield.ward5.map@data$LIVINGAREA),]

# convert our factors to numeric so that we can filter our results using sliders
broomfield.ward5.map@data$BATHS <- as.numeric(as.character(broomfield.ward5.map@data$BATHS))
broomfield.ward5.map@data$BEDROOMS <- as.numeric(as.character(broomfield.ward5.map@data$BEDROOMS))
broomfield.ward5.map@data$ACTUALYEAR <- as.numeric(as.character(broomfield.ward5.map@data$ACTUALYEAR))
broomfield.ward5.map@data$LIVINGAREA <- as.numeric(as.character(broomfield.ward5.map@data$LIVINGAREA))
broomfield.ward5.map@data$FINALACTUA <- as.numeric(as.character(broomfield.ward5.map@data$FINALACTUA))

broomfield.ward5.map <- broomfield.ward5.map[,c("OBJECTID","BATHS","BEDROOMS","ACTUALYEAR","FINALACTUA","LANDACTUAL","LIVINGAREA","PROPERTYUS","SALEDATE","SALEPRICE")]

writeOGR(broomfield.ward5.map, ".", "broomfield.ward5.map", driver="ESRI Shapefile")