#' Miscellaneous functions for package checking, building, and CI
#'
#' \code{not_building_on_ci} checks the environment for a variable called "CI"
#'    and returns \code{TRUE} if it does not exist. Used to run examples if the
#'    package is being built locally and there's a chance that \code{vdat.exe}
#'    exists. If the package is being built on a continuous integration
#'    platform like GitHub Actions, the "CI" variable will be \code{TRUE}
#'    and \code{not_building_on_ci} will return \code{FALSE}. If it is being
#'    built locally, "CI" will be "" and \code{not_building_on_ci} will return
#'    \code{TRUE}.
#'
#' @keywords internal

not_building_on_ci <- function(){
  Sys.getenv('CI') == ''
}
