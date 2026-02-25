# Internal `vdat convert` caller

Internal `vdat convert` caller

## Usage

``` r
vdat_to(
  output_format = c("csv", "json"),
  vdata_file,
  outdir = getwd(),
  time_corrected = FALSE,
  quiet = FALSE,
  folder = FALSE,
  filter = NULL
)
```

## Arguments

- output_format:

  What is the desired output format? One of "csv" or "json". Default is
  "csv".

- vdata_file:

  path of VDAT file to convert to CSV.

- outdir:

  output directory for the created CSV files. Defaults to the current
  working directory.

- time_corrected:

  logical. Do you want to apply the default time correction?

- quiet:

  logical, defaults to FALSE. Suppress messages?

- folder:

  logical, defaults to FALSE. Convert VDAT to a folder of CSVs?

- filter:

  character, defaults to NULL and is currently ignored with a warning.
  When implemented, filtering via vdat.exe will only be available for
  HR3 receivers.
