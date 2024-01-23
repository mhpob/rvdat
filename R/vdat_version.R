#' Report the version of VDAT identified in [`vdat_here`].
#'
#' @param ... arguments passed to `vdat_call`.
#'
#' @export
#' @examplesIf all(skip_example_on_ci(), skip_example_on_runiverse())
#'
#' vdat_version()
vdat_version <- function(...) {
  shell_out <- vdat_call(
    what = "--version",
    ...
  )

  # Old check below. As things rung through vdat_call, most issues are caught
  #   before reaching this stage. Saving just in case.
  #
  # if (shell_out$status == 1) {
  #   cli::cli_abort(
  #     c(
  #       "x" = "Call to VDAT failed.",
  #       "i" = "Is VDAT where you think it is?"
  #     )
  #   )
  # }

  invisible(shell_out)
}
