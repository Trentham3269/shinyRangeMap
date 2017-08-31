shinyUI( 
  
  fluidPage(
    
    # Apply free bootswatch theme
    theme = shinytheme("flatly"),
    
    # # Include Google Analytics
    # tags$head(includeScript("www/google-analytics.js")),
    
    h2(titlePanel("National Rifle Association of Australia")),
    h3(titlePanel("Range Locations")),
    br(),
    
    sidebarLayout(

      sidebarPanel(width = 3,
                   
        selectInput(inputId   = "state"
                    , label   = "Filter by State"
                    , choices = c("ALL", levels(factor(df$State)))),
        
        p(paste("There are currently", nrow(df), "NRAA ranges mapped")),
                   
        p(paste("This application was last updated on", format(Sys.Date(), "%d.%m.%Y")))
      
      ),
      
      mainPanel( 
        
        leafletOutput(outputId = "map")
           
      )
      
    ) 
    
  )
  
)