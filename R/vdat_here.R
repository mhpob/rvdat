#' User-supplied location of vdat.exe
#'
#' @param here location of vdata.exe, either a full path name or relative to the
#'    current working directory
#'
#' @export
#' @examplesIf Sys.getenv('CI') == ''
#'
#' vdat_here("vdat.exe")
#'

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
