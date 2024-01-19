#' Format object returned by `vdat_to_csv`
#'
#' @param data dataframe object to be formatted
#' @param event_type name of the event type in the detection log to be used in filtering.
#' Names can be the following `"DET"`, `"DIAG"`, `"HEALTH_VR2W" `, `"BATTERY" `,
#' `"CLOCK_REF"`, and/or `"EVENT_OFFLOAD"`, with the default set to `"DET"`.
#' @param event_field name of event fields to be assigned as column names.
#' Default is `"DIAG_DESC"`
#' @param event_desc if `TRUE`, event description dataframe is returned providing
#' the name of the `event_field` corresponding columns associated with that particular
#' event. Default is `FALSE`.
#'
#' @export
#' @examplesIf all(skip_example_on_ci(), skip_example_on_runiverse())
#'
#' dat <- read.csv("YOUR_FILE.csv", header = FALSE)
#' dat <- vdat_csv_format(dat)
vdat_csv_format <- function(data,
                            event_type = NULL,
                            event_field = NULL,
                            event_desc = FALSE) {
  if(is.null(event_type)) {
    event_type <- "DET"
  }
  if(is.null(event_field)) {
    event_field <- "DET_DESC"
  }

  event_description <- data[1:32, ]
  det_log <- data[33:nrow(data), ]

  det <- det_log[det_log$V1 %in% event_type, ]

  col_names <- event_description[event_description$V1 %in% event_field, ] |>
    as.matrix() |>
    as.vector()


  colnames(det) <- col_names

  if(event_desc == FALSE) {
  return(det)
  }

  if(event_desc == TRUE) {
    return(event_description)
  }

}


