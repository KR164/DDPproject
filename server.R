library(shiny)
library(leaflet)
library(RColorBrewer)
library(tidyverse)
library(shinyhelper)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

        observe_helpers()
        
        output$mymap <- renderLeaflet({
                data <- reactive(quakes)
                names(quakes) <- c("lat", "lng","depth","mag","stations")
                pal <- colorNumeric(palette = "YlOrRd",
                        domain = quakes[[input$id1]])

                quakes <- quakes %>% filter(mag > input$id2)
                quakes <- quakes %>% filter(depth > input$id3)
                
                x <- quakes[[input$id1]]
                
                leaflet(quakes) %>%
                addTiles() %>% 
                addCircles(color = ~pal(x), weight = 1,
                           #To make sure the size of the circles are not too big or small, 
                           #I added a CALCULATION to the variable radius:
                          radius = 50000*sqrt(x/mean(x)))%>%
                addLegend("bottomleft", pal = pal, values = x, title = input$id1)
   
  })
  
})
