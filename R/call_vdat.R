#'
#' @export
call_vdat <- function(what = '--help'){

  check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = Sys.getenv('VDAT_EXE'),
    args = what
  )

  rawToChar(shell_out$stdout) |>
    cat()
}
