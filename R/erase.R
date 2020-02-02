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

  if (is.null(pattern))
    objects <- ls(envir = envir)
  else
    objects <- ls(envir = envir, pattern= pattern)

  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ",")))

  rm(list = objects, envir = envir)
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

  if (is.null(pattern))
    objects <- ls(envir = envir)
  else
    objects <- ls(envir = envir, pattern = pattern)

  objects <- Filter(function(x) condition(get(x, envir = envir)),
                    objects)
  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ",")))

  rm(list = objects, envir = envir)
}

