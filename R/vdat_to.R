#' Convert VRL file(s) to CSV(s)
#'
#' @param vdata_file path of VRL file to convert to CSV.
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
  # Check that only 1 file has been passed
  if (length(vdata_file) > 1) {
    error_too_many_files()
  }

  if (!is.null(filter)) {
    warning(
      'The "filter" argument is currently unsupported and has been ignored.'
    )
  }

  # Build arguments
  format <- ifelse(folder == FALSE,
    "--format=csv.fathom",
    "--format=csv.fathom.split"
  )

  vdat_args <- c(
    "convert",
    format,
    vdata_file,
    paste0("--output=", outdir)
  )

  if (time_corrected == TRUE) {
    vdat_args <- c(
      vdat_args,
      "--timec=default"
    )
  }

  # Log items to build output, if desired
  if (quiet == FALSE) {
    type <- ifelse(folder, "Files", "File")

    filename <- gsub(
      "vdat|vrl",
      "csv",
      basename(vdata_file)
    )

    out_loc <- file.path(
      outdir,
      paste0(
        filename,
        ifelse(folder, "-fathom-split", "")
      )
    )

    converted_file_exists <- any(grepl(basename(out_loc), list.files(outdir)))
    if (converted_file_exists) {
      concat_time <- function(time, file) {
        time_shell_out <- format(
          time,
          "%Y%m%d-%H-%M-%S"
        )
        time_shell_out <- paste0("[", time_shell_out, "-xxxxxx]")

        gsub("\\.csv", paste0(time_shell_out, ".csv"), file)
      }

      time_shell_out <- Sys.time()
    }
  }


  # Call vdat.exe and capture response
  shell_out <- vdat_call(
    vdat_args,
    pass_error = TRUE
  )


  # Handle error
  if (shell_out$status == 1) {
    error_file_location(vdata_file, rawToChar(shell_out$stderr))
  }


  # Print to console
  if (quiet == FALSE) {
    if (converted_file_exists) {
      # This is down here to keep the Sys.time call as close as possible to the
      #   shell exec
      out_loc <- concat_time(time_shell_out, out_loc)
    }

    cli::cli_bullets(
      c(
        "v" = "File converted:",
        " " = "{vdata_file}\n",
        "i" = "{type} saved in:\n",
        " " = "{out_loc}"
      )
    )
  }
}


#' Convert a VRL file to a folder of CSVs by data type
#'
#' A wrapper around `vdat_to_csv` that just changes `folder = FALSE` to
#'  `folder = TRUE`.
#'
#' @param ... arguments passed to `vdat_to_csv`.
#'
#' @export
#' @examplesIf all(skip_example_on_ci(), skip_example_on_runiverse())
vdat_to_folder <- function(...) {
  vdat_to_csv(..., folder = TRUE)
}
