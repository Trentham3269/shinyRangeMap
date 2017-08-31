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

      sidebarPanel(width = 4,
                   
        selectInput(inputId   = "state"
                    , label   = "Filter by State"
                    , choices = c("All", levels(factor(df$State)))),
                   
       p(paste("Data is current as at", format(Sys.Date(), "%d.%m.%Y")))
      
      ),
      
      mainPanel( 
           
      )
      
    ) 
    
  )
  
)