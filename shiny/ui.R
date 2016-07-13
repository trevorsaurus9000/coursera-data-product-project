shinyUI(pageWithSidebar(  
     headerPanel("Broomfield County, CO, Ward 5 Home Property Values"),  
     sidebarPanel(    
          sliderInput("FINALACTUA_INPUT", "Assessed Property Value (USD):", min = 100000, max = 2500000, value = c(350000,500000)),
          sliderInput('ACTUALYEAR_INPUT', 'Minimum Year Built',value = 1995, min = 1900, max = 2016, step = 5),
          sliderInput('LIVINGAREA_INPUT', 'Minimum Livable Square Footage',value = 1000, min = 500, max = 5000, step = 500),
          sliderInput('BATHS_INPUT', 'Minimum Bathrooms',value = 2, min = 1, max = 8, step = 1), 
          sliderInput('BEDROOMS_INPUT', 'Minimum Bedrooms',value = 2, min = 1, max = 7, step = 1),
          submitButton("Submit")), 
     mainPanel(    
          h3("As Assessed By The City"),
          plotOutput('newPlot')
     )
))