library(readr)

path <- '../occurence.csv'

biodiversity_data_PL <- setDT(readr::read_csv_chunked(path,
                                                      callback = DataFrameCallback$new(function(x, pos)
                                                        subset(x, countryCode == "PL"))))

write_feather(biodiversity_data_PL, "data/occurence_PL.feather")
