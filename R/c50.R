# Author: docker
###############################################################################

#' Predict the mapping plausability with 0 or 1 using a C5.0 classification tree
#' 
#' @param df data.frame
#' @param fuzzy_score_col column with the string distance score 
#' @param energy_diff_col column with the percentage of energy difference
#' @param c5_object C5.0 tree classifier
#' @param type  type of prediction output
#'
#' @author  Marc Lamarine
#' @return a vector
#' @keywords internal

c5_predict <- function(df, fuzzy_score_col, energy_diff_col, c5_object = read_c50_eng(), type = 'prob') {
  # this is a pure hack, instead of formatting the dataframe
  # I reset the predictors within the tree object
  #require('C50', quietly = TRUE)
  c5_object$predictors <- c(fuzzy_score_col, energy_diff_col)
  pre <- C50::predict.C5.0(c5_object, df[, c(fuzzy_score_col, energy_diff_col)], type = type)
  
  if(is.null(dim(pre))) { 
    p <- pre } else {
    p <- pre[,2]
  }
  p
}




#' Compute C5.0 Probabilities 
#' 
#' Compute C5.0 probabilities using the C5.O tree from food score and energy differences
#' 
#' @param df a data.frame 
#' @param score column with fuzzy score between two food items
#' @param ediff column with relative percentage of absolute energy_difference
#' @param c5_object (default is the English Eurofir mapping classifier
#'
#' @author Marc Lamarine
#' @return data.frame
#' @export
c5_one_language <- function(df, score, ediff,  c5_object = read_c50_eng() ) {
  p   <- c5_predict(df, score, ediff, c5_object)
  p_c <- c5_predict(df, score, ediff, c5_object, type = 'class')
  out <- cbind(df, MAPPING = p_c, MAPPING_PROB = p)
  out 
}



