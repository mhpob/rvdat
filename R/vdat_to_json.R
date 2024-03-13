#' Convert VDAT file to JSON
#'
#' @param vdata_file path of VDAT file to convert to JSON
#' @param outdir output directory for the created JSON. Defaults to the
#'  current working directory.
#' @inheritParams vdat_to_csv
#'
#' @export
#'
vdat_to_json <- function(vdata_file,
                         outdir = getwd(),
                         time_corrected = FALSE,
                         quiet = FALSE,
                         filter = NULL) {
  vdat_to(
    output_format = "json",
    vdata_file = vdata_file,
    outdir = outdir,
    time_corrected = time_corrected,
    quiet = quiet,
    folder = FALSE,
    filter = filter
  )
}
