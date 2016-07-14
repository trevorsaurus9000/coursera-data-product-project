shinyUI(pageWithSidebar(  
     headerPanel("ZillowLite Shiny App"),  
     sidebarPanel(    
          sliderInput("FINALACTUA_INPUT", "Assessed Property Value (USD):", min = 100000, max = 510000, value = c(250000,400000)),
          sliderInput('ACTUALYEAR_INPUT', 'Minimum Year Built',value = 1995, min = 1900, max = 2015, step = 5),
          sliderInput('LIVINGAREA_INPUT', 'Minimum Livable Square Footage',value = 1000, min = 500, max = 4000, step = 500),
          sliderInput('BATHS_INPUT', 'Minimum Bathrooms',value = 2, min = 1, max = 5, step = 1), 
          sliderInput('BEDROOMS_INPUT', 'Minimum Bedrooms',value = 2, min = 1, max = 6, step = 1),
          submitButton("Submit")), 
     mainPanel(    
          #h3(renderText(homesFound)),
          h3("Colorado >> Broomfield County >> Ward 1"),
          h4("Property Lines"),
          plotOutput('newPlot'),
          h4(textOutput("homesFound")),
          h4(textOutput("avgPropertyValue")),
          h4(textOutput("avg2015SellingPrice"))
     )
))