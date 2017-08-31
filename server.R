shinyServer(function(input, output) {
  
  # DATA -------------------------------------------------------------------------------------------
  
  df.sbst <- reactive({
    
    switch(input$filter
           , "All Ranges"         = df
           , "State"              = df %>% filter(State        == input$state)
           , "Imperial/Metric"    = df %>% filter(Type         == input$type)
           , "Maximum Distance"   = df %>% filter(Max_Distance == input$distance)
           , "Electronic Targets" = df %>% filter(ET_System    == input$etargets))
      
  })
  
  # MAP -------------------------------------------------------------------------------------------

  output$map <- renderLeaflet({
    
    leaflet() %>% 
      addTiles() %>% 
      addMarkers(lng = df.sbst()$Long, lat = df.sbst()$Lat, popup = df.sbst()$Range)
    
    # TODO:popup array & formatting
    
  })
  
  # TODO:renderTable?
  
}) 