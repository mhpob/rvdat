#' Interface directly with `vdat.exe`.
#'
#' Low-level interface to `vdat.exe`, wherein arguments are passed directly
#'    to `vdat.exe`. Arguments should be character vectors, each element being
#'    one command.
#'
#' @param what arguments passed to `vdat.exe`. Defaults to `--help`.
#' @param ... arguments passed to [`sys::exec_internal`].
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' # Check the help documentation
#' vdat_call()
#'
#' #
#' vdat_call('--help')
#'
#' # Inspect a file; multiple arguments are passed in a character vector
#' vdat_call(c('inspect', 'FILENAME'))
#'
#' }
#'
vdat_call <- function(what = "--help", ...) {
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
