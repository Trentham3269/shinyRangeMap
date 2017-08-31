shinyServer(function(input, output) {
  
  # DATA -------------------------------------------------------------------------------------------
  
  df.sbst <- reactive({
    
    if (input$state == "ALL"){
      df
    } else {
      df %>% filter(State == input$state)
    }
    
  })
  
  # MAP -------------------------------------------------------------------------------------------

  output$map <- renderLeaflet({
    
    leaflet() %>% 
    addTiles() %>% 
    addMarkers(lng = df.sbst()$Long, lat = df.sbst()$Lat, popup = df.sbst()$Range)
    
  })
  
}) 