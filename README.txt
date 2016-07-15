Trevor Harris
Coursera
Data Products
Course Project
20160714

Project purpose:
   (1) Demonstrate the use of Shiny and Rstudio Presentation
   (2) Explore shapefiles (read, write, manipulate and plot)
   (3) Explore public data pulled off a local government website

About the data:
   The Parcels dataset was collected and made available by the City and County of 
   Broomfield.  The last edit was 3/25/2016.  Open data from the city's Assessor, 
   from which the Parcels dataset was found, can be found here:
   http://opendata.broomfield.org/datasets/7116fc2360784cd39e7f199222099027_0.
   Details about the Parcels dataset can be found here:
   https://services1.arcgis.com/vXSRPZbyyOmH9pek/arcgis/rest/services/Parcels/FeatureServer/0

Project files of interest:
   ./preprocessing.R - R preprocessing code used to reduce the Parcels.* 
      dataset into something that will load in reasonable time period.  Also tidys the data.
   ./data/Parcels.* - raw data downloaded from broomfield.org.
   ./shiny/ui.R - Shiny R code used to create an input pane and an updatable display pane.
   ./shiny/server.R - Shiny R code used to plot the filtered land parcels, 
      as well as perfom some light calculations based on the filters.