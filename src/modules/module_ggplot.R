ggplotUI <- function(id) {
  ns <- NS(id)
  
  tagList(
    plotOutput(ns("my_plot"))
  )
}

ggplotServer <- function(id, data, title) {
  moduleServer(id, function(input, output, session) {
    
    data$eventMonth <-  substr(data$eventDate,1,7)
    data <- data[ ,.(observations = .N,  count = sum(individualCount)), by =  eventMonth]
    
    output$my_plot <- renderPlot({
      data %>%
        ggplot( aes(x = eventMonth, y = observations)) +
        geom_point(shape = 21, color = "black", fill = "#00c0ef", size = 4) + 
        theme_ipsum() +
        ggtitle(title) + 
        theme(axis.text.x = element_text(size = 10, angle = -90))
    })

  })
}
