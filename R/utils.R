#' Miscellaneous functions for package checking, building, and CI
#'
#' `not_building_on_ci` checks the environment for a variable called "CI"
#'    and returns `TRUE` if it does not exist. Used to run examples if the
#'    package is being built locally and there's a chance that `vdat.exe`
#'    exists. If the package is being built on a continuous integration
#'    platform like GitHub Actions, the "CI" variable will be `TRUE`
#'    and `not_building_on_ci` will return `FALSE`. If it is being
#'    built locally, "CI" will be "" and `not_building_on_ci` will return
#'    `TRUE`.
#'
#' @export

not_building_on_ci <- function() {
  Sys.getenv("CI") == ""
}
