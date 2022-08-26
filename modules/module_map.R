mapUI <- function(id) {
  ns <- NS(id)
  
  tagList(
    leafletOutput(ns("mymap"))
  )
}

mapServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    
    output$mymap <- renderLeaflet({
    leaflet(data) %>%
      addTiles() %>%
        addCircleMarkers(lng = ~data$longitudeDecimal,
                 lat = ~data$latitudeDecimal,
                 popup = paste0("<b>Species: </b>", data$vernacularName, " / ", data$scientificName,
                                "<br>",
                                "<b>Observed on: </b>", data$eventDate,
                                "<br>",
                                "<b>Individuals: </b>", data$individualCount
                                ),
                 clusterOptions = markerClusterOptions())
    })
  })
}
