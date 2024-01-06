#' Report the version of VDAT identified in [`vdat_here`].
#'
#' @export
#' @examplesIf any(skip_on_ci(), skip_on_runiverse())
#'
#' vdat_version()
vdat_version <- function() {
  vdat_loc <- check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = "--version",
    error = FALSE
  )

  if (shell_out$status == 1) {
    cli::cli_abort(
      c(
        "x" = "Call to VDAT failed.",
        "i" = "Is VDAT where you think it is?"
      )
    )
  }

  rawToChar(shell_out$stdout) |>
    cat()
}
