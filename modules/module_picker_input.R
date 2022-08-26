picker_input_UI <- function(id) {
  ns <- NS(id)

  tagList(
    uiOutput(ns("my_filter"))
  )
}

picker_input_Server <- function(id, label, choices, selected, live_search_text) {
  moduleServer(id, function(input, output, session) {

    NS <- session$ns

    output$my_filter <- renderUI({
      pickerInput(inputId = id,
                  label = label,
                  choices = choices,
                  selected = selected,
                  multiple = T,
                  options = pickerOptions(size = 10,
                                          actionsBox = TRUE,
                                          liveSearch = T,
                                          liveSearchPlaceholder = live_search_text,
                                          selectedTextFormat = "count")
      )
    })

  })
}
