#' Interface directly with `vdat.exe`.
#'
#' Low-level interface to `vdat.exe`, wherein arguments are passed directly
#'    to `vdat.exe`. Arguments should be character vectors, each element being
#'    one command.
#'
#' @param what arguments passed to `vdat.exe`. Defaults to `--help`.
#' @param print logical. Defaults to TRUE. Print the output to console?
#' @param pass_error logical. Defaults to FALSE. Capture and pass any error
#'    through to the user?
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
#' vdat_call("--help")
#'
#' # Inspect a file; multiple arguments are passed in a character vector
#' vdat_call(c("inspect", "FILENAME"))
#' }
#'
vdat_call <- function(
  what = "--help",
  print = TRUE,
  pass_error = FALSE,
  ...
) {
  vdat_loc <- vdat_here()

  ## Enter Wine mode if needed
  if (Sys.getenv("RVDAT_WINE_EXE") != "") {
    cli::cli_alert_info("Using Wine mode: EXPERIMENTAL!")

    Sys.setenv(WINEDEBUG = "fixme-all")
    on.exit(Sys.unsetenv("WINEDEBUG"))

    what <- c(path.expand(vdat_loc), what)
    vdat_loc <- Sys.getenv("RVDAT_WINE_EXE")
  }

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = what,
    error = FALSE,
    ...
  )

  if (shell_out$status == 1) {
    if (pass_error == FALSE) {
      error_generic_call(
        paste(what, collapse = " "),
        rawToChar(shell_out$stderr)
      )
    }
  }

  class(shell_out) <- "vdat_resp"

  if (print == TRUE) {
    print(shell_out)
  }

  invisible(shell_out)
}
