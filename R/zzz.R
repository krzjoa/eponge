.onLoad <- function(libname, pkgname) {
  # Active binding?
  options()
  op.dplyr <- list(
    dplyr.show_progress = TRUE
  )
  #toset <- !(names(op.dplyr) %in% names(op))
  #if (any(toset)) options(op.dplyr[toset])

  # ns <- ns_env("dplyr")
  # .Call(dplyr_init_library, ns_env())
  invisible()
}
