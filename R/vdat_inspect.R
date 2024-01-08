#' Return general VDAT file metadata
#'
#' @param vdata_file file path of VDAT file to inspect.
#' @param ... arguments passed to [`vdat_call`].
#'
#' @export
vdat_inspect <- function(vdata_file, ...) {
  shell_out <- vdat_call(
    what = c(
      "inspect",
      vdata_file
    ),
    ...
  )

  if (shell_out$status == 1) {
    error_convert(shell_out, vdata_file)
  }

  # Coerce to data frame
  out <- shell_out$stdout |>
    rawToChar() |>
    strsplit("\\\r\\\n") |>
    _[[1]]

  out <- out[sapply(out, function(.) grepl(":", .))] |>
    strsplit(":\\s+") |>
    do.call(rbind, args = _) |>
    data.frame()

  names(out) <- c("variable", "value")


  invisible(out)
}
