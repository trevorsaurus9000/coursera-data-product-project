library(rgdal)

# ingest our data
broomfield.county.map <- readOGR(dsn = "./data", layer = "Parcels")

# decide which county ward we want to look at, then filter our data
broomfield.ward.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-1"),]
#' broomfield.ward.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-2"),]
#' broomfield.ward.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-3"),]
#' broomfield.ward.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-4"),]
#' broomfield.ward.map <- broomfield.county.map[which(broomfield.county.map$WARD == "WARD-5"),]

# drop incomplete records (and any non residential records)
broomfield.ward.map <- broomfield.ward.map[!is.na(broomfield.ward.map@data$BATHS),]
broomfield.ward.map <- broomfield.ward.map[!is.na(broomfield.ward.map@data$BEDROOMS),]
broomfield.ward.map <- broomfield.ward.map[!is.na(broomfield.ward.map@data$ACTUALYEAR),]
broomfield.ward.map <- broomfield.ward.map[!is.na(broomfield.ward.map@data$LIVINGAREA),]

# convert our datetimes to years
broomfield.ward.map@data$SALEDATE <- substr(broomfield.ward.map@data$SALEDATE, 1, 4)

# convert our factors to numeric so that we can filter our results using sliders
broomfield.ward.map@data$BATHS <- as.numeric(as.character(broomfield.ward.map@data$BATHS))
broomfield.ward.map@data$BEDROOMS <- as.numeric(as.character(broomfield.ward.map@data$BEDROOMS))
broomfield.ward.map@data$ACTUALYEAR <- as.numeric(as.character(broomfield.ward.map@data$ACTUALYEAR))
broomfield.ward.map@data$LIVINGAREA <- as.numeric(as.character(broomfield.ward.map@data$LIVINGAREA))
broomfield.ward.map@data$FINALACTUA <- as.numeric(as.character(broomfield.ward.map@data$FINALACTUA))
broomfield.ward.map@data$SALEDATE <- as.numeric(broomfield.ward.map@data$SALEDATE)

# only select the variables that are useful to the app
broomfield.ward.map <- broomfield.ward.map[,c("OBJECTID","BATHS","BEDROOMS","ACTUALYEAR","FINALACTUA","LIVINGAREA","PROPERTYUS","SALEDATE","SALEPRICE")]

# store our filtered data for later use in the app (because the complete data set takes minutes to load!)
writeOGR(broomfield.ward.map, "./shiny", "broomfield.ward.map", driver="ESRI Shapefile")