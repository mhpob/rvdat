#' Miscellaneous functions for package checking, building, and CI
#'
#' @section Details:
#'
#' `skip_on_ci` and `skip_on_runiverse` check the environment for variables
#'    called "CI" and "MY_UNIVERSE", respectively, and return `TRUE` if it does
#'    not exist. Used to run examples if the package is being built locally and
#'    there's a chance that `vdat.exe` exists. If the package is being built on
#'    a continuous integration platform like GitHub Actions, the "CI" variable
#'    will be `TRUE` and `skip_on_ci` will return `FALSE`. If it is being
#'    built locally, "CI" will be "" and `skip_on_ci` will return
#'    `TRUE`. Similarly, if the package is being built on R-Universe, the
#'    "MY_UNIVERSE" variable will have your universe's name.
#'
#' @name utilities
#' @export

skip_on_ci <- function() {
  Sys.getenv("CI") == ""
}

#' @rdname utilities

skip_on_runiverse <- function() {
  Sys.getenv("MY_UNIVERSE") == ""
}
