server <- function(input, output, session) {
  
  output$apply_button <- renderUI({
    actionButton("apply_button", "Apply", color = "blue")
    
  })
  
  observeEvent(input$kingdom, {
    
    picker_input_Server(id = "scientific_name",
                        label = "Scientific name:",
                        choices = sort(unique(data_PL[kingdom == input$kingdom]$scientificName)),
                        selected = sort(data_PL[kingdom == input$kingdom ,]$scientificName),
                        live_search_text = "write here to search for species")
    
    picker_input_Server(id = "vernacular_name",
                        label = "Vernacular name:",
                        choices = sort(unique(data_PL[kingdom == input$kingdom]$vernacularName)),
                        selected =sort(data_PL[kingdom == input$kingdom,]$vernacularName),
                        live_search_text = "write here to search for species")

  })
  

  observeEvent(input$vernacular_name, {

    updatePickerInput(session = session, inputId = "scientific_name",
                      choices = sort(unique(data_PL[kingdom == input$kingdom]$scientificName)),
                      selected = sort(data_PL[kingdom == input$kingdom &
                                                data_PL$vernacularName %in% input$vernacular_name,]$scientificName)
    )
  }, ignoreNULL = FALSE, ignoreInit = T)
   
  
  observeEvent(input$scientific_name, {
    
    updatePickerInput(session = session, inputId = "vernacular_name",
                      choices = sort(unique(data_PL[kingdom == input$kingdom]$vernacularName)),
                      selected = sort(data_PL[kingdom == input$kingdom &
                                                data_PL$scientificName %in% input$scientific_name,]$vernacularName)
    )
  }, ignoreNULL = FALSE, ignoreInit = T)
  
  
  
  observeEvent(input$apply_button, {
    
    if(is.null(input$scientific_name)){shinyalert('Select at least one species in the panel on the left')}
    
    data_PL_filtered <- filter_species_by_user_selection(data_PL, input$scientific_name)
    mapServer("map1", data_PL_filtered)
    
    valuebox("total_no_obs", nrow(data_PL_filtered), "Observations", "search")
    valuebox("individual_counts", sum(data_PL_filtered$individualCount), "Individuals", "signal")
    valuebox("no_localities", length(unique(data_PL_filtered$locality)), "Regions where species were observed", "globe")
    
    ggplotServer("plot1", data_PL_filtered, "Monthly observations")
    
  }, ignoreNULL = FALSE, ignoreInit = T)

  
}
