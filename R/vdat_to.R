#' Internal `vdat convert` caller
#'
#' @inheritParams vdat_to_csv
#' @param output_format What is the desired output format? One of "csv" or "json".
#'    Default is "csv".
vdat_to <- function(output_format = c("csv", "json"),
                    vdata_file,
                    outdir = getwd(),
                    time_corrected = FALSE,
                    quiet = FALSE,
                    folder = FALSE,
                    filter = NULL) {
  # Check output format
  output_format <- match.arg(output_format)

  # Check that only 1 file has been passed
  if (length(vdata_file) > 1) {
    error_too_many_files(output_format)
  }

  # Warn that we're not currently filtering
  if (!is.null(filter)) {
    warning(
      'The "filter" argument is currently unsupported and has been ignored.'
    )
  }

  # Build arguments
  ## Output format
  if (output_format == "csv") {
    format <- ifelse(
      folder == FALSE,
      "--format=csv.fathom",
      "--format=csv.fathom.split"
    )
  }
  if (output_format == "json") {
    format <- "--format=json.rxlog"
  }

  ## Convert function arguments
  vdat_args <- c(
    "convert",
    format,
    vdata_file,
    paste0("--output=", outdir)
  )

  ## Time correction
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
      output_format,
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

        gsub("\\.(csv|json)", paste0(time_shell_out, ".", output_format), file)
      }

      time_shell_out <- Sys.time()
    }

    shell_out <- vdat_call(
      vdat_args,
      pass_error = TRUE
    )
  } else {
    shell_out <- vdat_call(
      vdat_args,
      pass_error = TRUE,
      print = FALSE
    )
  }


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
