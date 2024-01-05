#' Convert VRL file(s) to CSV(s)
#'
#' @param file location of VRL file(s) to convert to CSV.
#' @param outdir output directory for the created CSV files. Defaults to the current
#'  working directory.
#'
#' @export

to_csv <- function(file, outdir = getwd()) {
  # fls <- list.files('c:/users/darpa2/analysis/chesapeake-backbone/embargo/raw/20230912', pattern = 'VR2AR_\\d.*vrl', full.names = T)
  # to_csv(fls[2:3])
  # list.files('c:/users/darpa2/analysis/chesapeake-backbone/embargo/raw/20230912', pattern = 'VR2AR_\\d.*vrl', full.names = T)

  ## single Fathom CSV file
  #   vdat convert --format=csv.fathom <input_file>
  ## folder of split Fathom CSV files
  # vdat convert --format=csv.fathom.split <input_file>


  vdat_loc <- check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = c(
      "convert",
      "--format=csv.fathom",
      paste0("--output=", outdir),
      file
    ),
    error = FALSE
  )

  if (shell_out$status == 1) {
    cli::cli_abort(
      c(
        "x" = "Call to VDAT failed.",
        "i" = "{?Is/are} the location{?s} of {file} correct?"
      )
    )
  }
}


#' Convert a VRL file to a folder of CSVs by data type
#'
#' @param file location of VRL file(s) to convert to CSV.
#' @param outdir output directory for the created CSV files. Defaults to the current
#'  working directory.
#'
#' @export

to_folder <- function(file, outdir = getwd()) {
  # fls <- list.files('c:/users/darpa2/analysis/chesapeake-backbone/embargo/raw/20230912', pattern = 'VR2AR_\\d.*vrl', full.names = T)

  vdat_loc <- check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = c(
      "convert",
      "--format=csv.fathom.split",
      paste0("--output=", outdir),
      file
    ),
    error = FALSE
  )

  if (shell_out$status == 1) {
    cli::cli_abort(
      c(
        "x" = "Call to VDAT failed.",
        "i" = "{?Is/are} the location{?s} of {file} correct?"
      )
    )
  }
}
