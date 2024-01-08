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
#' @keywords internal
#' @name error_functions

error_generic_call <- function(what) {
  cli::cli_abort(
    c(
      "x" = "Call to VDAT failed.",
      "i" = "Is {what} a valid command?"
    )
  )
}

error_too_many_files <- function() {
  cli::cli_abort(
    c(
      "x" = "Only one file is allowed at a time.",
      "i" = "Consider using lapply(vdata_files, vdat_to_csv)."
    )
  )
}

#' @rdname error_functions

error_convert <- function(shell_out, vdata_file) {
  cli::cli_abort(
    c(
      "x" = "Call to VDAT failed:",
      " " = "{rawToChar(shell_out$stderr)}",
      "i" = "Is the location of {vdata_file} correct?"
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
