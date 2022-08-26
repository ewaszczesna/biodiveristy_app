valuebox_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    valueBoxOutput(ns("value_box"))
  )
}

valuebox_server <- function(id, value, text, icon_glyphicon) {
  moduleServer(id, function(input, output, session) {
    
    NS <- session$ns
    
    output$value_box <- renderValueBox({
      valueBox(
        value = formatC(value, digits = 0, format = "f"),
        subtitle = text,
        icon = icon(icon_glyphicon, lib = "glyphicon"),
        color = "aqua"
      )
    })
  })
}

