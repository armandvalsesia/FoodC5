context("Fetchers")
###############################################################################


.read_c50_eng <- function() {
	targ <- read_c50_eng()
  expect_is(targ, 'C5.0')
  expect_equal(targ$dims, c(5896,2))
  
}
test_that('read_c50_eng', .read_c50_eng())

.read_c50_ori <- function() {
	targ <- read_c50_ori()
  expect_is(targ, 'C5.0')
  expect_equal(targ$dims, c(5896,2))
  
}
test_that('.read_c50_ori', .read_c50_ori())

