library(readr)

biodiversity_data_PL <- setDT(readr::read_csv_chunked('data/occurence.csv',
                                                      callback = DataFrameCallback$new(function(x, pos)
                                                        subset(x, countryCode == "PL"))))

write_feather(biodiversity_data_PL, "data/occurence_PL.feather")
