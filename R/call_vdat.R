#'
#' @export
call_vdat <- function(what){
  system(
    paste(
    Sys.getenv('VDAT_EXE'),
    what
    )
  )
}
