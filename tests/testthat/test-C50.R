context("C50")


###############################################################################


.c5_predict <- function() {
  ar_c5 <- FoodC5:::read_c50_eng()
  data(food_score)

  p <- c5_predict(food_score, 'ENG_SCORE', 'EDIFF', ar_c5)
  p_c <- c5_predict(food_score, 'ENG_SCORE', 'EDIFF', type = 'class')
  expect_false(any(p[p_c == 'Bad'] >= 0.5)) # no bad has a prob over 0.5 (they would be Good)

  fs2 <- dplyr::rename(food_score, sc = ENG_SCORE, ed = EDIFF)
  p2 <- c5_predict(fs2, 'sc', 'ed', ar_c5)
  expect_identical(p, p2)

  p3 <- c5_predict(food_score, 'ENG_SCORE', 'EDIFF')
  expect_identical(p, p3)

}
test_that('c5_predict', .c5_predict())


.c5_one_language <- function() {
  data(food_score)
	targ <- c5_one_language(food_score,  'ENG_SCORE', 'EDIFF')
  expect_equal(nrow(targ), 200)
  i <- which(targ$MAPPING == 'Bad')
  expect_equal(length(i), 80)
  expect_false(any(targ$MAPPING_PROB[i] >= 0.5))

}
test_that('c5_one_language', .c5_one_language())

