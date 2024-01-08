#' Report the version of VDAT identified in [`vdat_here`].
#'
#' @export
#' @examplesIf all(skip_on_ci(), skip_on_runiverse())
#'
#' vdat_version()
vdat_version <- function() {

  shell_out <- vdat_call(
    what = '--version'
  )

  if (shell_out$status == 1) {
    cli::cli_abort(
      c(
        "x" = "Call to VDAT failed.",
        "i" = "Is VDAT where you think it is?"
      )
    )
  }

  invisible(shell_out)
}
