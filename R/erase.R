#' @name erase
#' @title Remove (all) objects from environment
#' @param pattern regex pattern to select a set of objects; default: NULL
#' @param envir environment; default: caller environment
#' @param verbose print removed objects' names
#' @details  Function can be used with envir = globalenv() argument.
#' @return NULL (function returns nothing)
#' @examples
#' create_data <- function() data.frame(a = 1:10, b = 11:20)
#' x <- cars
#' y <- 1:20
#' z <- function(x) x +2
#' # Typically, we don't have to specify enironment
#' erase()
#' ls()
#' @export
erase <- function(pattern = NULL, envir = parent.frame(), verbose = FALSE){
  .abstract_erase(pattern = pattern, filtering.function = NULL, list.function = ls,
                  envir = envir, verbose = verbose)
}

#' @name erase_if
#' @title Remove objects, which fulfill determined conditions
#' @param condition function or lambda expression (one side formula)
#' @inheritParams erase
#' @details  Function can be used with envir = globalenv() argument.
#' @return NULL (function returns nothing)
#' @examples
#' create_data <- function() data.frame(a = 1:10, b = 11:20)
#' x <- cars
#' y <- 1:20
#' z <- function(x) x +2
#' l <- list(1,2,3,4)
#' erase_if(is.list)
#' ls()
#' # You may use lambda expression
#' create_data <- function() data.frame(a = 1:10, b = 11:20)
#' x <- cars
#' y <- 1:20
#' z <- function(x) x +2
#' l <- list(1,2,3,4)
#' erase_if(~ is.function(.x) | is.data.frame(.x))
#' ls()
#' @importFrom rlang as_function
#' @export
erase_if <- function(condition, pattern = NULL, envir = parent.frame(), verbose = FALSE){

  condition <- as_function(condition)

  filtering_function <- function(x){
    condition(get(x, envir = envir))
  }

  .abstract_erase(filtering.function = filtering_function,
                  list.function = ls, envir = envir, verbose = verbose)
}
