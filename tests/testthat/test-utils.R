context('utils')
###############################################################################


.get_extdata_dir <- function() {
  dir <- get_extdata_dir('FoodC5')
  expect_true(nzchar(dir) && file.exists(dir))
  
  old_dir <- setwd(dir)
  on.exit(setwd(old_dir), add = TRUE)
  
  dir2 <- get_extdata_dir('FoodC5')
  expect_equal(dir2, dir)
}
test_that('get_extdata_dir', .get_extdata_dir())

