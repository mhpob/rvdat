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
    pass_error = TRUE,
    ...
  )

  if (shell_out$status == 1) {
    error_file_location(vdata_file, rawToChar(shell_out$stderr))
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




  ## Parse the metadata
  ### Drop section headers by selecting rows that have a ":" or start with
  ###   11 spaces then a character
  metadata_1 <- metadata[grepl(":|^\\s{11}[[:alnum:]]", metadata)]

  ### section headers need the parsed metadata
  ### Repeat those indices however many times to match the number of rows
  ### in the section
  ### when reading in a vrl file the length of the section
  ### headers becomes an issue so we have moved the location of this to happen
  ### after the metadata has been parsed then
  ### Because metadata_1 has the headers removed it will get the
  ### spacing correct to sequience along as we do not
  ### remove the  the headers, themselves which was in the orginal
  ### You will also notice that we are first subseting metadata as it has
  ### the section names in their index location which is first grabbed then
  ### sequencing along at the length of metadata_1
  section_headers <- metadata[
    section_headers[
      # Repeat the headers however many times
      findInterval(seq_along(metadata_1), vec = section_headers)
    ]
  ] |>
    # Remove the spaces
    gsub("\\s", "", x = _)
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
  ###   Function adapted (trimmed down) from:
  ###   https://stackoverflow.com/questions/10554741/fill-in-data-frame-with-values-from-rows-above

  locf <- function(x) {
    isnotblank <- x != ""
    x[which(isnotblank)][cumsum(isnotblank)]
  }

  metadata$X1 <- locf(metadata$X1)

  ### Add back section headers
  metadata$section <- section_headers

  ### Remove redundant variables
  metadata <- metadata[metadata$X1 != metadata$X2, ]

  ### Rename
  names(metadata) <- c("variable", "value", "section")


  invisible(metadata)
}
