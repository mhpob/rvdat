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

  # Convert output into data frame
  ## Parse the output
  metadata <- shell_out$stdout |>
    sys::as_text()

  ## Remove section dividers
  metadata <- metadata[sapply(metadata, function(.) !grepl("=|^$", .))]

  ## Parse section headers
  ### Find section header indices (rows with >= 12 spaces)
  section_headers <- metadata |>
    grepl("\\s{12,}", x = _) |>
    which()

  ### Repeat those indices however many times to match the number of rows
  ###   in the section
  section_headers <- metadata[
    section_headers[
      # Repeat the headers however many times
      findInterval(seq_along(metadata), vec = section_headers)[
        # But not the headers, themselves
        -section_headers
      ]
    ]
  ] |>
    # Remove the spaces
    gsub("\\s", "", x = _)

  ## Parse the metadata
  ### Drop section headers by selecting rows that have a ":" or start with
  ###   11 spaces then a character
  metadata <- metadata[grepl(":|^\\s{11}[[:alnum:]]", metadata)]

  ### Split according to colons followed by multiple spaces.
  metadata <- metadata |>
    strsplit(":\\s+") |>
    ### Variables with multiple entries have those entries indented and split
    ###   into different lines. Split these into two columns according to a
    ###   space that precedes an alphanumeric character
    lapply(function(.) {
      unlist(
        strsplit(., "\\s{2,}(?=[[:alpha:]])", perl = T)
      )
    }) |>
    ### Now that every section has two entries, bind them together
    do.call(rbind, args = _) |>
    data.frame()

  ### Fill in blanks using last observation carried forward
  ###   Function taken from:
  ###   https://stackoverflow.com/questions/10554741/fill-in-data-frame-with-values-from-rows-above

  locf <- function(x, blank = is.na) {
    # Find the values
    if (is.function(blank)) {
      isnotblank <- !blank(x)
    } else {
      isnotblank <- x != blank
    }
    # Fill down
    x[which(isnotblank)][cumsum(isnotblank)]
  }

  metadata$X1 <- locf(metadata$X1, blank = "")

  ### Add back section headers
  metadata$section <- section_headers

  ### Remove redundant variables
  metadata <- metadata[metadata$X1 != metadata$X2, ]

  ### Rename
  names(metadata) <- c("variable", "value", "section")


  invisible(metadata)
}
