Trevor Harris
Coursera
Data Products
Course Project
20160715

Project purpose and motivation:
   (1) Demonstrate the use of Shiny and Rstudio Presentation (REQUIRED)
   (2) Explore shapefiles (read, write, manipulate and plot) (OPTIONAL)
   (3) Explore public data pulled off a local government website (OPTIONAL)

About the data:
   The Parcels dataset was collected and made available by the City and County of 
   Broomfield.  The last edit was 3/25/2016.  Open data from the city's Assessor, 
   from which the Parcels dataset was provided, can be found here:
   http://opendata.broomfield.org/datasets/7116fc2360784cd39e7f199222099027_0.
   Details about the Parcels dataset can be found here:
   https://services1.arcgis.com/vXSRPZbyyOmH9pek/arcgis/rest/services/Parcels/FeatureServer/0

Project files of interest:
   ./data/Parcels.* - raw data downloaded from broomfield.org.  Covers Broomfield County.
   ./preprocessing.R - R preprocessing code used to reduce the Parcels.* 
      dataset into something that will load in Shiny within reasonable time period.  The 
      code tidys the data, then writes a subset of it to disk.
   ./shiny/broomfield.ward.map.* - processed data, consumable (in a timely manner) by Shiny app.
      Covers Broomfield County, Ward 1.
   ./shiny/ui.R - Shiny R code used to create an input pane and an updatable display pane.
   ./shiny/server.R - Shiny R code used to plot the filtered land parcels, 
      as well as perfom some light calculations based on the filters.