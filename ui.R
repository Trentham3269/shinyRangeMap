shinyUI( 
  
  fluidPage(
    
    # Apply free bootswatch theme
    theme = shinytheme("flatly"),
    
    # Include Google Analytics
    tags$head(includeScript("www/google-analytics.js")),
    
    h2(titlePanel("National Rifle Association of Australia")),
    h3(titlePanel("Range Locations")),
    br(),
    
    sidebarLayout(

      sidebarPanel(width = 3,
                   
        radioButtons(inputId   = "filter"
                     , label   = "View ranges by:"
                     , choices = c("All Ranges"
                                   , "State"
                                   , "Imperial/Metric"
                                   , "Maximum Distance"
                                   , "Electronic Targets")),
                     
        conditionalPanel(condition = "input.filter == 'State'",
          selectInput(inputId   = "state"
                      , label   = "Choose state:"
                      , choices = levels(factor(df$State)))),
        
        conditionalPanel(condition = "input.filter == 'Imperial/Metric'",
          selectInput(inputId   = "type"
                      , label   = "Choose imperial, metric or both:"
                      , choices = levels(factor(df$Type)))),
        
        conditionalPanel(condition = "input.filter == 'Maximum Distance'",
          selectInput(inputId   = "distance" 
                      , label   = "Choose maximum distance:"
                      , choices = c("600y", "600m", "700y", "800y", "800m", "900y", "900m", "1000y"
                                    , "1000m", "1100m", "1200y", "1500y"))),
              
        conditionalPanel(condition = "input.filter == 'Electronic Targets'",
          selectInput(inputId   = "etargets" 
                      , label   = "Choose electronic targets:"
                      , choices = levels(factor(df$ET_System)))),
        
        radioButtons(inputId   = "marker"
                     , label   = "Choose marker type:"
                     , choices = c("Clusters", "Individual")
                     , inline  = TRUE),
        
        p(paste("There are currently", nrow(df), "NRAA ranges mapped")),
                   
        p("Range data last updated on 02.07.2018"),
        
        a(href="https://trentham3269.shinyapps.io/shinyhonourboard/", "NRAA Honour Board")
      
      ),
      
      mainPanel( 
        
        leafletOutput(outputId = "map"
                      , width  = "100%"
                      , height = 500)
           
      )
      
    ) 
    
  )
  
)
