#' User-supplied location of `vdat.exe`.
#'
#' @param here location of `vdat.exe`, either a full path name or relative
#'    to the current working directory.
#'
#' @export
#' @examplesIf all(skip_on_ci(), skip_on_runiverse())
#'
#' vdat_here("c:/program files/innovasea/fathom/vdat.exe")
vdat_here <- function(here) {
  Sys.setenv(VDAT_EXE = here)

  if (file.exists(Sys.getenv("VDAT_EXE"))) {
    cli::cli_alert_info(
      "vdat.exe is located at {Sys.getenv('VDAT_EXE')}"
    )
  } else {
    cli::cli_abort(
      c("x" = "There is no file at this location.")
    )
  }
}
