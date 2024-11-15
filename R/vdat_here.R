#' Write the location of `vdat.exe` to the environmental variables.
#'
#' @param here location of `vdat.exe`, either a full path name or relative
#'    to the current working directory.
#'
#' @export
#' @examplesIf all(skip_example_on_ci(), skip_example_on_runiverse())
#'
#' # Auto-find vdat:
#' vdat_here()
#'
#' # Provide an explicit location:
#' vdat_here("c:/program files/innovasea/fathom connect/vdat.exe")
vdat_here <- function(here = NULL) {
  if (!is.null(here)) {
    Sys.setenv(VDAT_EXE = here)

    if (file.exists(Sys.getenv("VDAT_EXE"))) {
      cli::cli_alert_info(
        "vdat is located at {Sys.getenv('VDAT_EXE')}"
      )
    } else {
      cli::cli_abort(
        c("x" = "There is no file at this location.")
      )
    }

  } else {
    cli::cli_alert_info(
      "Looking for vdat in the typical locations."
    )
    current_os <- Sys.info()["sysname"]

    if (current_os == "Windows") {
      standard_location <- "C:/Program Files/Innovasea/Fathom Connect/vdat.exe"
    } else if (current_os == "Linux") {
      standard_location <- "/usr/local/Innovasea/Fathom Connect/vdat"
    } else if (current_os == "Darwin") {
      standard_location <- "~/Applications/Innovasea/Fathom Connect/vdat"
    } else {
      cli::cli_abort(
        c("x" = "Unable to identify operating system.")
      )
    }

    Sys.setenv(VDAT_EXE = standard_location)

    if (file.exists(Sys.getenv("VDAT_EXE"))) {
      cli::cli_alert_info(
        "vdat is located at {Sys.getenv('VDAT_EXE')}"
      )
    } else {
      cli::cli_abort(
        c("x" = "Unable to find vdat, please provide an explicit location.")
      )
    }
  }
}
