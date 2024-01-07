#' Return general VDAT file metadata
#'
#' @param file file path of VDAT file to inspect.
#' @param ... arguments passed to [`sys::exec_internal`].
#'
#' @export
vdat_inspect <- function(file, ...) {
  vdat_loc <- check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = c(
      "inspect",
      file
    ),
    error = FALSE,
    ...
  )

  if (shell_out$status == 1) {
    cli::cli_abort(
      c(
        "x" = "Call to VDAT failed.",
        "i" = "{?Is/are} the location{?s} of {file} correct?"
      )
    )
  }

  rawToChar(shell_out$stdout) |>
    cat()
}
