#' @name erase_masking
#' @title Erase objects from GlobalEnv, which are masking objects from attached packages
#' @param pattern a regex pattern
#' @param verbose print removed objects' names
#' @details We have to highglight, that for now it only allows us to remove objects from
#' the Global Environment. Be careful: uncontrolled use may cause undesired side effects.
#' @return NULL (function returns nothing)
#' @examples
#' # It works only if objects are assigned in the global environment
#' matrix <- matrix(0, 3, 3)
#' gamma <- 0.9
#' erase_masking()
#' @export
erase_masking <- function(pattern = NULL, verbose = FALSE){
  conflict.objects <- conflicts(detail = TRUE)
  global.ev.conflicts <- conflict.objects$.GlobalEnv

  if (!is.null(pattern))
    global.ev.conflicts <- global.ev.conflicts[grepl(pattern = pattern,
                                                     global.ev.conflicts)]

  if (verbose)
    print(global.ev.conflicts)

  if (!is.null(global.ev.conflicts))
    rm(list = global.ev.conflicts, envir = globalenv())

}

#' @rdname erase_masking
#' @export
erase_masking_functions <- function(pattern = NULL, verbose = FALSE){
  conflict.objects <- conflicts(detail = TRUE)
  global.ev.conflicts <- conflict.objects$.GlobalEnv

  if (!is.null(pattern))
    global.ev.conflicts <- global.ev.conflicts[grepl(pattern = pattern,
                                                     global.ev.conflicts)]

  global.ev.conflicts <- Filter(function(x) !is.vector(get(x, envir = globalenv())),
                                global.ev.conflicts)
  if (verbose)
    print(global.ev.conflicts)

  if (!is.null(global.ev.conflicts))
    rm(list = global.ev.conflicts, envir = globalenv())
}

