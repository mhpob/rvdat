#' Convert VDAT file to CSV
#'
#' @param vdata_file path of VDAT file to convert to CSV.
#' @param outdir output directory for the created CSV files. Defaults to the
#'  current working directory.
#' @param time_corrected logical. Do you want to apply the default time correction?
#' @param quiet logical, defaults to FALSE. Suppress messages?
#' @param folder logical, defaults to FALSE. Convert VDAT to a folder of CSVs?
#' @param filter character, defaults to NULL and is currently ignored with a
#'  warning. When implemented, filtering via vdat.exe will only be available for
#'  HR3 receivers.
#'
#' @export
#'
vdat_to_csv <- function(vdata_file,
                        outdir = getwd(),
                        time_corrected = FALSE,
                        quiet = FALSE,
                        folder = FALSE,
                        filter = NULL) {
  vdat_to(
    output_format = "csv",
    vdata_file = vdata_file,
    outdir = outdir,
    time_corrected = time_corrected,
    quiet = quiet,
    folder = folder,
    filter = filter
  )
}


#' Convert a VDAT file to a folder of CSVs by data type
#'
#' A wrapper around `vdat_to_csv` that just changes `folder = FALSE` to
#'  `folder = TRUE`.
#'
#' @param ... arguments passed to `vdat_to`.
#'
#' @export
#' @examplesIf all(skip_example_on_ci(), skip_example_on_runiverse())
vdat_to_folder <- function(...) {
  vdat_to(
    output_format = "csv",
    folder = TRUE,
    ...
  )
}
