#' Check that `vdat.exe` exists.
#'
#' Used as a helper function within functions that call `vdat.exe`, this
#'    function checks that the `VDAT_EXE` environmental variable returns
#'    a value. If not, it prompts you to run [`vdat_here`] first.
#'
#' @keywords internal

check_vdat_location <- function() {
  vdat_loc <- Sys.getenv("VDAT_EXE")

  vdat_loc <- Sys.which(vdat_loc)

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
