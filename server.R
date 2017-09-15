shinyServer(function(input, output) {
  
  # DATA -------------------------------------------------------------------------------------------
  
  # Subset dataframe
  df.sbst <- reactive({
    
    switch(input$filter
           , "All Ranges"         = df
           , "State"              = df %>% filter(State        == input$state)
           , "Imperial/Metric"    = df %>% filter(Type         == input$type)
           , "Maximum Distance"   = df %>% filter(Max_Distance == input$distance)
           , "Electronic Targets" = df %>% filter(ET_System    == input$etargets))
      
  })
  
  # MAP -------------------------------------------------------------------------------------------

  # Define marker type
  clstr <- reactive({
    
    switch(input$marker
           , "Clusters" = markerClusterOptions()
           , "Individual" = NULL)
    
  })
  
  # Output leaflet map
  output$map <- renderLeaflet({
    
    leaflet() %>% 
      addTiles() %>% 
      addMarkers(lng = df.sbst()$Long, lat = df.sbst()$Lat, clusterOptions = clstr(),
                 popup = paste("Range:"              , df.sbst()$Range        , "<br>",
                               "Imperial/Metric:"    , df.sbst()$Type         , "<br>",
                               "Maximum Distance:"   , df.sbst()$Max_Distance , "<br>",
                               "No. of Targets:"     , df.sbst()$Num_Targets  , "<br>",
                               "Electronic Targets:" , df.sbst()$ET_System    , "<br>",
                               "Clubs:"              , df.sbst()$Clubs))
    
  })
  
}) 