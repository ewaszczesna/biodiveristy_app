library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shiny.info)
library(shinyalert)
library(shinycssloaders)

library(feather)
library(data.table)
library(dplyr)
 
library(leaflet)
library(plotly)
library(hrbrthemes)


modules <- dir("modules", full.names = TRUE, recursive = TRUE)
lapply(modules, source)

source("utils/utils.R")


data_PL <- setDT(read_feather("data/occurence_PL.feather"))

### find columns with NA vaues
#names(which(colSums(is.na(data_PL))>0))

data_PL <- replace_empty_values_with_text("data_PL", "kingdom", "Unknown")
data_PL <- replace_empty_values_with_text_and_value_add_text_from_colname("data_PL", "vernacularName",
                                                                          "Unknown", "scientificName")
