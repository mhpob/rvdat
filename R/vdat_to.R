#' Convert VRL file(s) to CSV(s)
#'
#' @param vdata_file path of VRL file to convert to CSV.
#' @param outdir output directory for the created CSV files. Defaults to the
#'  current working directory.
#' @param time_corrected logical. Do you want to apply the default time correction?
#'
#' @export
#'
vdat_to_csv <- function(vdata_file,
                        outdir = getwd(),
                        time_corrected = FALSE) {
  # fls <- list.files('c:/users/darpa2/analysis/chesapeake-backbone/embargo/raw/20230912', pattern = 'VR2AR_\\d.*vrl', full.names = T)
  # to_csv(fls[2:3])
  # list.files('c:/users/darpa2/analysis/chesapeake-backbone/embargo/raw/20230912', pattern = 'VR2AR_\\d.*vrl', full.names = T)

  ## single Fathom CSV file
  #   vdat convert --format=csv.fathom <input_file>
  ## folder of split Fathom CSV files
  # vdat convert --format=csv.fathom.split <input_file>

  # Check that only 1 file has been passed
  if (length(vdata_file) > 1) {
    error_too_many_files()
  }

  # Build arguments
  vdat_args <- c(
    "convert",
    "--format=csv.fathom",
    vdata_file,
    paste0("--output=", outdir)
  )

  if (time_corrected == TRUE) {
    vdat_args <- c(
      vdat_args,
      "--timec=default"
    )
  }

  # Call vdat.exe and capture response
  shell_out <- vdat_call(
    vdat_args
  )


  if (shell_out$status == 1) {
    error_convert(shell_out, vdata_file)
  } else {
    cli::cli_bullets(
      c(
        "v" = "File converted:",
        " " = "{vdata_file}\n",
        "i" = "File saved in:\n",
        " " = "{outdir}"
      )
    )
  }
}


#' Convert a VRL file to a folder of CSVs by data type
#'
#' @param vdata_file path of VRL file to convert to CSV.
#' @param outdir output directory for the created CSV files. Defaults to the
#'    current working directory.
#' @param time_corrected logical. Do you want to apply the default time correction?
#'
#' @export
#' @examplesIf all(skip_on_ci(), skip_on_runiverse())
vdat_to_folder <- function(vdata_file,
                           outdir = getwd(),
                           time_corrected = FALSE) {
  # fls <- list.files('c:/users/darpa2/analysis/chesapeake-backbone/embargo/raw/20230912', pattern = 'VR2AR_\\d.*vrl', full.names = T)

  # Check that only 1 file has been passed
  if (length(vdata_file) > 1) {
    error_too_many_files()
  }


  # Build arguments ----
  ## Mandatory arguments
  vdat_args <- c(
    "convert",
    "--format=csv.fathom.split",
    paste0("--output=", outdir),
    vdata_file
  )


  ## Optional arguments
  ### Time correction
  if (time_corrected == TRUE) {
    vdat_args <- c(
      vdat_args,
      "--timec=default"
    )
  }


  # Execute call to vdat.exe ----
  shell_out <- vdat_call(
    what = vdat_args
  )


  # Update user ----
  if (shell_out$status == 1) {
    error_convert(shell_out, vdata_file)
  } else {
    cli::cli_bullets(
      c(
        "v" = "File converted:",
        " " = "{vdata_file}\n",
        "i" = "Directory saved in:\n",
        " " = "{outdir}"
      )
    )
  }
}
