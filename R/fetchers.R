# Author: docker
###############################################################################


#' Fetch the English Food Name Classifier
#'
#' @author  Marc Lamarine
#' @return  a C5.0 object
#' @export

read_c50_eng <- function() {
  dir <- get_extdata_dir("FoodC5")
  readRDS(file.path(dir, 'c50_eng.rds'))
}

#' Fetch the Original Food Name Classifier
#'
#' @author  Marc Lamarine
#' @return  a C5.0 object
#' @export

read_c50_ori <- function() {
  dir <- get_extdata_dir('FoodC5')
  readRDS(file.path(dir, 'c50_ori.rds'))
}

