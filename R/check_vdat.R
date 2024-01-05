#' Check that \code{vdat.exe} exists.
#'
#' Used as a helper function within functions that call \code{vdat.exe}, this
#'    function checks that the \code{VDAT_EXE} environmental variable returns
#'    a value. If not, it prompts you to run \code{\link{vdat_here}} first.
#'
#' @keywords internal

check_vdat_location <- function() {
  vdat_loc <- Sys.getenv("VDAT_EXE")

  if (vdat_loc == "") {
    cli::cli_abort(
      c(
        "x" = "No VDAT.exe listed.",
        "i" = "Run `vdat_here()` first."
      )
    )
  }

  vdat_loc
}
