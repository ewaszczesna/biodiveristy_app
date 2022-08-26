filter_species_by_user_selection <- function(data, user_selection) {
  data[data$scientificName %in% user_selection, ]
}


replace_empty_values_with_text <- function(dataname, colname, text){
  
  eval(parse(text = paste0(dataname, "$",colname,"[is.na(", dataname, "$", colname, ")] <-'", text, "'")))
  new_data <- eval(parse(text = dataname))
  new_data
  
}

replace_empty_values_with_text_and_value_add_text_from_colname <- function(dataname, colname, text, colname_for_add_text){
  
  to_be_replaced <- paste0(dataname, "$",colname,"[is.na(", dataname, "$", colname, ")] <-")
  replacement <- paste0("paste0('", text, " (',", dataname, "$", colname_for_add_text, "[is.na(", dataname, "$", colname,  ")],')')")
  
  string_to_eval <- paste(to_be_replaced, replacement)
  eval(parse(text = string_to_eval))
  
  new_data <- eval(parse(text = dataname))
  new_data
  
}
