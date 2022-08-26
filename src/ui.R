ui <- dashboardPage(
  dashboardHeader(title = "Biodiveristy App"),
  
  dashboardSidebar(
    collapsed = FALSE,
    
    pickerInput(
      inputId = "kingdom",
      label = "Kingdom:",
      choices = sort(unique(data_PL$kingdom)),
      selected = sort(unique(data_PL$kingdom))[1]
    ),
    picker_input_UI("scientific_name"),
    picker_input_UI("vernacular_name"),
    uiOutput("apply_button")
  ),
  
  dashboardBody(
    fluidRow(
      valuebox_UI("total_no_obs"),
      valuebox_UI("individual_counts"),
      valuebox_UI("no_localities")
    ),
    
    fluidRow(
      box(
        status = "info",
        solidHeader = TRUE,
        title = "",
        mapUI("map1") %>% withSpinner(color = "#0dc5c1")
      ),
      
      box(
        status = "info",
        solidHeader = TRUE,
        title = "",
        barplot_UI("plot") %>% withSpinner(color = "#0dc5c1")
      )
    ),
    
    shiny.info::display(
      shiny::span(
        "Created by Ewa Szczesna",
        tags$a(href = "https://www.linkedin.com/in/ewaszczesna/", icon("linkedin")),
        tags$a(href = "https://github.com/ewaszczesna", icon("github"))
      ),
      position = "bottom right"
    )
    
    
  )
)