#'
#' @export
call_vdat <- function(what = '--help'){

  vdat_loc <- Sys.getenv('VDAT_EXE')

  if(vdat_loc == ''){
    cli::cli_abort(
      c(
        "x" = "No VDAT.exe listed.",
        "i" = "Run `vdat_here()` first."
      )
    )
  }

  shell_out <- sys::exec_internal(
    cmd = Sys.getenv('VDAT_EXE'),
    args = what
  )

  rawToChar(shell_out$stdout) |>
    cat()
}
