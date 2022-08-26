barplot_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    plotlyOutput(ns("my_plot"))
  )
}

barplot_server <- function(id, data, title) {
  moduleServer(id, function(input, output, session) {
    
    data$eventMonth <-  substr(data$eventDate,1,7)
    data <- data[ ,.(observations = .N,  count = sum(individualCount)), by =  eventMonth]
    
    output$my_plot <- renderPlotly({
      
      plot_ly(data, x = ~eventMonth, y = ~observations, type = 'bar', 
              marker = list(color = 'rgb(158,202,225)',
                            line = list(color = 'rgb(8,48,107)',
                                        width = 0.5))) %>% 
        layout(title = title,
               xaxis = list(title = ""),
               yaxis = list(title = "")
               )
      
    })

  })
}