#' @name erase_functions
#' @title Remove (all) functions from environment
#' @param pattern regex pattern to select a set of functions; default: NULL
#' @param envir environment; default: global environment
#' @param verbose print removed objects' names
#' @examples
#' create_data <- function() data.frame(a = 1:10, b = 11:20)
#' x <- cars
#' y <- 1:20
#' z <- function(x) x +2
#' erase_functions()
#' ls()
#' @export
erase_functions <- function(pattern = NULL, envir = globalenv(), verbose = FALSE){
   .abstract_erase_by_type(list.function = lsf.str, envir = envir, verbose = verbose)
}

#' @name erase_data
#' @title Remove all objects, which are listed in `Data` section in RStudio
#' @inheritParams erase_functions
#' @examples
#' cars.2 <- cars
#' test_fun <- function(x) x + 2
#' value <- 7
#' erase_non_functions(verbose = TRUE)
#' @export
erase_data <- function(pattern = NULL, envir = globalenv(), verbose = FALSE){

  filtering_function <- function(x){
    object <- get(x, envir = envir)
    (is.list(object) | is.environment(object)) & (!is.function(object))
  }

  .abstract_erase_by_type(filtering.function = filtering_function,
                          list.function = ls, envir = envir, verbose = verbose)
}

#' @name erase_values
#' @title Remove all objects, which are listed in `Values` section in RStudio
#' @inheritParams erase_functions
#' @examples
#' cars.2 <- cars
#' test_fun <- function(x) x + 2
#' value <- 7
#' erase_non_functions(verbose = TRUE)
#' @export
erase_values <- function(pattern = NULL, envir = globalenv(), verbose = FALSE){

  # TODO: handle S4 class constructor removal is.function(!)
  filtering_function <- function(x){
    object <- get(x, envir = envir)
    !is.list(object) & !is.environment(object) & (!is.function(object))
  }

  .abstract_erase_by_type(filtering.function = filtering_function,
                          list.function = ls, envir = envir, verbose = verbose)
}

#' @name erase_non_functions
#' @title Remove all the objects, that are not functions
#' @inheritParams erase_functions
#' @examples
#' cars.2 <- cars
#' test_fun <- function(x) x + 2
#' value <- 7
#' erase_non_functions(verbose = TRUE)
#' @export
erase_non_functions <- function(pattern = NULL, envir = globalenv(), verbose = FALSE){

  filtering_function <- function(x){
    object <- get(x, envir = envir)
    !is.function(object)
  }

  .abstract_erase_by_type(filtering.function = filtering_function,
                          list.function = ls, envir = envir, verbose = verbose)
}

#' @name erase_df
#' @title Remove all the `data.frame` objects
#' @inheritParams erase_functions
#' @examples
#' cars.2 <- cars
#' test_fun <- function(x) x + 2
#' value <- 7
#' erase_non_functions(verbose = TRUE)
#' @export
erase_df <- function(pattern = NULL, envir = globalenv(), verbose = FALSE){

  filtering_function <- function(x){
    is.data.frame(get(x, envir = envir))
  }

  .abstract_erase_by_type(filtering.function = filtering_function,
                          list.function = ls, envir = envir, verbose = verbose)
}
