library(shiny)
library(leaflet)
library(shinyhelper)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
  # Application title
  titlePanel("Locations of Earthquakes off Fiji"),
  
  # Sidebar with a slider input for magnitude
  sidebarLayout(
        sidebarPanel(
                p('Locations of 1000 seismic events near Fiji since 1964.'),
        radioButtons("id1", "Choose", c("Magnitude" = "mag", 
                                        "Depth (km)" = "depth", 
                                        "Number of stations reporting" = "stations")) %>%
        helper(type = "inline",
                       title = "Help",
                       content = c("You can choose to show either the magnitude 
                                        or depth of the quakes, 
                                        or the number of stations that reported the quake.",
                                   "The size and colour of the circles indicate 
                                   the value of the variable."),
                       size = "s"),
        
        sliderInput('id2', 'Filter magnitude range', 
                    value = c(4,6.5), min = 4, max = 6, step = 0.25) %>%
        
        helper(type = "inline",
               title = "Help",
               content = c("Move te slider to filter the magnitudes you want to see on the map"),
               size = "s"),
        
        sliderInput('id3', 'Filter depth range', 
                    value = c(40,680), min = 40, max = 680, step = 10) %>%
        
        helper(type = "inline",
               title = "Help",
               content = c("Move te slider to filter the depths you want to see on the map"),
               size = "s"),
        
        helpText("Note: for help (documentation) click on question marks.")
        
    ),
    
    # Show the map with earthquakes
    mainPanel(
            leafletOutput("mymap")
    )
  )
))
