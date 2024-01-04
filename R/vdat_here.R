#'
#' @export
vdat_here <- function(here){
  Sys.setenv(VDAT_EXE = here)

  if(file.exists(Sys.getenv('VDAT_EXE'))){
    cat(
      'vdat.exe is located at',
      Sys.getenv('VDAT_EXE')
    )
  } else{
    stop('There is no file at this location.')
  }


}
