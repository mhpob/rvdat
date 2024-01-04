#'
#' @export
call_vdat <- function(what = '--help'){

  vdat_loc <- check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = what
  )

  rawToChar(shell_out$stdout) |>
    cat()
}
