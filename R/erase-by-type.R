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

  if (is.null(pattern))
    objects <- lsf.str(envir = envir)
  else
    objects <- lsf.str(envir = envir, pattern= pattern)

  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ",")))

  rm(list = objects, envir = envir)
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
erase_data <- function(pattern = NULL, envir = globalenv(), verbose = TRUE){

  if (is.null(pattern))
    objects <- ls(envir = envir)
  else
    objects <- ls(envir = envir, pattern = pattern)

  filtering_function <- function(x){
    object <- get(x, envir = envir)
    (is.list(object) | is.environment(object)) & (!is.function(object))
  }

  objects <- Filter(filtering_function, objects)

  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ", ")))

  rm(list = objects, envir = envir)
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
erase_values <- function(pattern = NULL, envir = globalenv(), verbose = TRUE){

  if (is.null(pattern))
    objects <- ls(envir = envir)
  else
    objects <- ls(envir = envir, pattern = pattern)

  filtering_function <- function(x){
    object <- get(x, envir = envir)
    (is.list(object) | is.environment(object)) & (!is.function(object))
  }

  objects <- Filter(filtering_function, objects)

  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ", ")))

  rm(list = objects, envir = envir)
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
erase_non_functions <- function(pattern = NULL, envir = globalenv(), verbose = TRUE){

  if (is.null(pattern))
    objects <- ls(envir = envir)
  else
    objects <- ls(envir = envir, pattern = pattern)

  objects <- setdiff(objects, lsf.str(envir = envir))

  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ", ")))

  rm(list = objects, envir = envir)
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
erase_df <- function(pattern = NULL, envir = globalenv(), verbose = TRUE){

  if (is.null(pattern))
    objects <- ls(envir = envir)
  else
    objects <- ls(envir = envir, pattern = pattern)

  objects <- Filter(function(x) is.data.frame(get(x, envir = envir)),
                    objects)

  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ", ")))

  rm(list = objects, envir = envir)
}
