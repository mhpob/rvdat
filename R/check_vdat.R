#' Check that the vdat.exe exists
#'
#' @keywords internal

check_vdat_location <- function(){
  vdat_loc <- Sys.getenv('VDAT_EXE')

  if(vdat_loc == ''){
    cli::cli_abort(
      c(
        "x" = "No VDAT.exe listed.",
        "i" = "Run `vdat_here()` first."
      )
    )
  }

  vdat_loc
}
