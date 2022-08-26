test_that("returns filtered DT on multiple user selections", {
  
  #given
  user_selection <- c("sn1", "sn2")
  data <- data.table(kingdom = c("k1", "k2", "k1"), scientificName = c("sn1", "sn2", "sn3") )
  
  #when
  filtered <- filter_species_by_user_selection(data, user_selection)
  
  #then
  expected_result <- data.table(kingdom = c("k1", "k2"), scientificName = c("sn1", "sn2") )
  expect_true(all_equal(filtered, expected_result))

})

test_that("returns filtered DT on single user selection", {
  
  #given
  user_selection <- c("sn2")
  data <- data.table(kingdom = c("k1", "k2", "k3"), scientificName = c("sn2", "sn1", "sn2") )
  
  #when
  filtered <- filter_species_by_user_selection(data, user_selection)
  
  #then
  expected_result <- data.table(kingdom = c("k1", "k3"), scientificName = c("sn2", "sn2") )
  expect_true(all_equal(filtered, expected_result))
  
})

test_that("returns same DT if all unique values from column are in user selection", {
  
  #given
  user_selection <- c("sn1", "sn2")
  data <- data.table(kingdom = c("k1", "k2", "k1"), scientificName = c("sn1", "sn2", "sn1") )
  
  #when
  filtered <- filter_species_by_user_selection(data, user_selection)
  
  #then
  expected_result <- data.table(kingdom = c("k1", "k2", "k1"), scientificName = c("sn1", "sn2", "sn1") )
  expect_true(all_equal(filtered, expected_result))
  
})

test_that("returns empty DT on empty user selection", {
  
  #given
  user_selection <- NULL
  data <- data.table(kingdom = c("k1", "k2"), scientificName = c("sn1", "sn2") )
  
  #when
  filtered <- filter_species_by_user_selection(data, user_selection)
  
  #then
  expected_result <- data.table(kingdom = character(), scientificName = character())
  expect_true(all_equal(filtered, expected_result))
  
})

test_that("returns empty DT on user selection not found in DT", {
  
  #given
  user_selection <- c("sn4", "sn5")
  data <- data.table(kingdom = c("k1", "k2", "k3"), scientificName = c("sn1", "sn2", "sn3") )
  
  #when
  filtered <- filter_species_by_user_selection(data, user_selection)
  
  #then
  expected_result <- data.table(kingdom = character(), scientificName = character())
  expect_true(all_equal(filtered, expected_result))
  
})

test_that("returns empty DT on empty data", {
  
  #given
  user_selection <- c("sn1", "sn2")
  data <- data.table(kingdom = character(), scientificName = character())
  
  #when
  filtered <- filter_species_by_user_selection(data, user_selection)
  
  #then
  expected_result <- data.table(kingdom = character(), scientificName = character())
  expect_true(all_equal(filtered, expected_result))
  
})