#' Miscellaneous functions for package checking, building, and CI
#'
#' `skip_example_on_ci` and `skip_example_on_runiverse` check the environment for
#'    variables called "CI" and "MY_UNIVERSE", respectively, and return `TRUE`
#'    if it does not exist. Used to run examples if the package is being built
#'    locally and there's a chance that `vdat.exe` exists. If the package is being built on
#'    a continuous integration platform like GitHub Actions, the "CI" variable
#'    will be `TRUE` and `skip_example_on_ci` will return `FALSE`. If it is being
#'    built locally, "CI" will be "" and `skip_example_on_ci` will return
#'    `TRUE`. Similarly, if the package is being built on R-Universe, the
#'    "MY_UNIVERSE" variable will have your universe's name.
#'
#' @name CI_utilities
#' @export

skip_example_on_ci <- function() {
  Sys.getenv("CI") == ""
}

#' @rdname CI_utilities
#' @export

skip_example_on_runiverse <- function() {
  Sys.getenv("MY_UNIVERSE") == ""
}

#' Error functions
#'
#' @param error Character. Error from exec_internal(), passed through `rawToChar`
#'
#' @keywords internal
#' @name error_functions

error_generic_call <- function(what, error) {
  cli::cli_abort(
    c(
      "x" = "Call to VDAT failed with error:",
      " " = "{cli::col_red(error)}",
      "i" = "Is {what} a valid command?"
    )
  )
}

#' @rdname error_functions

error_file_location <- function(vdata_file, error) {
  cli::cli_abort(
    c(
      "x" = "Call to VDAT failed with error:",
      " " = "{cli::col_red(error)}",
      "i" = "Is the location of {vdata_file} correct?"
    )
  )
}

#' @rdname error_functions

error_too_many_files <- function() {
  cli::cli_abort(
    c(
      "x" = "Only one file is allowed at a time.",
      "i" = "Consider using lapply(vdata_files, vdat_to_csv)."
    )
  )
}

#' Methods
#'
#' Methods for VDAT responses
#'
#' @keywords internal

print.vdat_resp <- function(x, ...) {
  rawToChar(x$stdout) |>
    cat()

  invisible(x)
}
