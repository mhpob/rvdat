#' Convert VRL file(s) to CSV(s)
#'
#' @param vdata_file path of VRL file to convert to CSV.
#' @param outdir output directory for the created CSV files. Defaults to the
#'  current working directory.
#' @param time_corrected logical. Do you want to apply the default time correction?
#' @param quiet logical, defaults to FALSE. Suppress messages?
#' @param folder logical, defaults to FALSE. Convert VDAT to a folder of CSVs?
#'
#' @export
#'
vdat_to_csv <- function(vdata_file,
                        outdir = getwd(),
                        time_corrected = FALSE,
                        quiet = FALSE,
                        folder = FALSE) {

  # Check that only 1 file has been passed
  if (length(vdata_file) > 1) {
    error_too_many_files()
  }

  # Build arguments
  format <- ifelse(folder == FALSE,
                   '--format=csv.fathom',
                   '--format=csv.fathom.split')

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

  # Call vdat.exe and capture response
  time_shell_out <- Sys.time()
  shell_out <- vdat_call(
    vdat_args
  )

  if (shell_out$status == 1) {
    error_convert(shell_out, vdata_file)
  }

  if(quiet == FALSE){
    if(folder == TRUE){
      type <- 'Files'
      time_shell_out <- format(Sys.time(),
                               '%Y%m%d-%H-%M-%S')
      time_shell_out <- paste0('[', time_shell_out, '-xxxxxx]')


      out_loc <- file.path(
        outdir,
        paste(
          gsub(
            '\\.vdat|\\.vrl',
            paste0(time_shell_out, '.csv'),
            basename(vdata_file)
          ),
          'fathom-split',
          sep = '-'
        )

      )
    }else{
      type <- 'File'
      out_loc <- file.path(
        outdir,
        gsub('vdat|vrl', 'csv', basename(vdata_file))
      )
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
