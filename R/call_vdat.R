#' Interface directly with \code{vdat.exe}.
#'
#' Low-level interface to \code{vdat.exe}, wherein arguments are passed directly
#'    to \code{vdat.exe}.
#'
#' @param what arguments passed to \code{vdat.exe}. Defaults to \code{--help}.
#' @param ... arguments passed to \code{sys::\link[sys]{exec_internal}}.
#'
#' @export
call_vdat <- function(what = "--help", ...) {
  vdat_loc <- check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = what,
    error = FALSE,
    ...
  )

  if (shell_out$status == 1) {
    cli::cli_abort(
      c(
        "x" = "Call to VDAT failed.",
        "i" = "Is {what} a valid command?"
      )
    )
  }

  rawToChar(shell_out$stdout) |>
    cat()
}
