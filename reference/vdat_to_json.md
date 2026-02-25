# Convert VDAT file to JSON

Convert VDAT file to JSON

## Usage

``` r
vdat_to_json(
  vdata_file,
  outdir = getwd(),
  time_corrected = FALSE,
  quiet = FALSE,
  filter = NULL
)
```

## Arguments

- vdata_file:

  path of VDAT file to convert to JSON

- outdir:

  output directory for the created JSON. Defaults to the current working
  directory.

- time_corrected:

  logical. Do you want to apply the default time correction?

- quiet:

  logical, defaults to FALSE. Suppress messages?

- filter:

  character, defaults to NULL and is currently ignored with a warning.
  When implemented, filtering via vdat.exe will only be available for
  HR3 receivers.
