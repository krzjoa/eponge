#' @name erase
#' @title Remove (all) objects from environment
#' @param pattern regex pattern to select a set of functions; default: NULL
#' @param envir environment; default: global environment
#' @param verbose print removed objects' names
#' @examples
#' create_data <- function() data.frame(a = 1:10, b = 11:20)
#' x <- cars
#' y <- 1:20
#' z <- function(x) x +2
#' erase()
#' ls()
#' @export
erase <- function(pattern = NULL, envir = globalenv(), verbose = FALSE){
  .abstract_erase_by_type(filtering.function = NULL, list.function = ls,
                          envir = envir, verbose = verbose)
}


#' @name erase_if
#' @title Remove objects, which fulfill determined conditions
#' @inheritParams erase
#' @examples
#' create_data <- function() data.frame(a = 1:10, b = 11:20)
#' x <- cars
#' y <- 1:20
#' z <- function(x) x +2
#' l <- list(1,2,3,4)
#' erase_if(is.list)
#' ls()
#' @export
erase_if <- function(condition, pattern = NULL, envir = globalenv(), verbose = FALSE){

  filtering_function <- function(x){
    condition(get(x, envir = envir))
  }

  .abstract_erase_by_type(filtering.function = filtering_function,
                          list.function = ls, envir = envir, verbose = verbose)
}
