#'
#' @export
call_vdat <- function(what = '--help'){
  system2(
    command = Sys.getenv('VDAT_EXE'),
    args = what,
    stdout = TRUE, stderr = TRUE
    )

}
