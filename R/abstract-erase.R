.abstract_erase_by_type <- function(filtering.function = NULL, list.function = ls, pattern = NULL,
                                    envir = globalenv(), verbose = FALSE){

  if (is.null(pattern))
    objects <- list.function(envir = envir)
  else
    objects <- list.function(envir = envir, pattern = pattern)

  if (!is.null(filtering.function))
    objects <- Filter(filtering.function, objects)

  if (verbose)
    print(sprintf("Removed objects: %s", paste(objects, collapse = ", ")))

  rm(list = objects, envir = envir)
}
