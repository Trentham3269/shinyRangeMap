suppressPackageStartupMessages({
  library(shiny)        # web framework
  library(shinythemes)  # free bootstrap themes from bootswatch.com
  library(readr)        # fast I/O
  library(dplyr)        # data wrangling
  library(leaflet)      # leaflet js for R
})

# Read data 
df <- read_csv("data/df.csv")