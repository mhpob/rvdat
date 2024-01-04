#'
#' @export
vdat_here <- function(here){
  Sys.setenv(VDAT_EXE = here)

  if(file.exists(Sys.getenv('VDAT_EXE'))){
    cli::cli_alert_info(
      "vdat.exe is located at {Sys.getenv('VDAT_EXE')}"
    )
  } else{
    cli::cli_abort(
      c("x" = 'There is no file at this location.')
    )
  }
}
