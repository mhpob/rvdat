# How to use \`rvdat\`

This vignette is a working draft. There will be lots of changes as
`rvdat` gets fleshed out, so please check back often!

The most recent changes were made on 2025-07-24.

## Getting started

``` r
library(rvdat)
```

First, as we should always do when beginning a `rvdat` workflow, we tell
R where our `vdat.exe` is located. Mine is within an installed version
of [Fathom
Connect](https://support.fishtracking.innovasea.com/s/downloads).

``` r
vdat_here("c:/program files/innovasea/fathom connect/vdat.exe")
#> ℹ VDAT detected in Wine installation.
#> Warning: vdat.exe not found at c:/program
#> files/innovasea/fathom connect/vdat.exe,
#> but at ~/.wine/drive_c/Program
#> Files/Innovasea/Fathom Connect/vdat.exe.
#> [1] "~/.wine/drive_c/Program Files/Innovasea/Fathom Connect/vdat.exe"
```

If you don’t want to do this every time you re-open R, you can add
`RVDAT_EXE="PATH_TO_VDAT.EXE"` to your `.Renviron` file. If you’re on
Linux or MacOS, you can also add the location of your Wine installation
as `RVDAT_WINE_EXE="/path/to/Wine"`. `rvdat` will automatically look for
these in your `.Renviron` when you restart R. You can do this manually,
but I find that the easiest way to edit `.Renviron` is using
[`usethis::edit_r_environ()`](https://usethis.r-lib.org/reference/edit.html).

Next, let’s download a sample VRL file from the `glatos` package using
[`utils::download.file`](https://rdrr.io/r/utils/download.file.html).
I’ll be keeping everything in a temporary directory just to keep tidy.

``` r
td <- file.path(
  tempdir(),
  "vignette"
)

dir.create(
  td
)

download.file(
  url = file.path(
    "https://github.com/ocean-tracking-network/glatos/raw/dev/inst/extdata",
    "detection_files_raw/VR2AR_546310_20190613_1.vrl"
  ),
  destfile = file.path(
    td,
    "VR2AR_546310_20190613_1.vrl"
  ),
  mode = "wb",
  quiet = TRUE
)
```

## Check the file’s metadata

To take a quick glimpse of the VDAT file’s metadata, we can use
`vdat_inspect`. Note that this only works for VDAT files (`.vrl` and
`.vdat`), not any exported CSVs. `vdat_insepct` converts this
information to a data.frame if you’d like to keep it around.

``` r
inspect_df <- vdat_inspect(
  file.path(td, "VR2AR_546310_20190613_1.vrl")
)
#> ℹ Using Wine mode: EXPERIMENTAL!
#> Error in `error_file_location()` at rvdat/R/vdat_inspect.R:18:5:
#> ✖ Call to VDAT failed with error:
#>   00b8:err:environ:init_peb starting
#>   L"C:\\windows\\Microsoft.NET\\Framework\\v4.0.30319\\mscorsvw.exe"
#>   in experimental wow64 mode !! ERROR:
#>   Invalid Argument: file is required
#> ℹ Is the location of
#>   /tmp/RtmpZfiiUk/vignette/VR2AR_546310_20190613_1.vrl
#>   correct?

head(inspect_df)
#> Error: object 'inspect_df' not found
```

## Converting VDAT file to a CSV

Now that we have a VRL to play with and know something about it, let’s
convert it to a csv. It’s pretty quick with `vdat_to_csv`.

``` r
vdat_to_csv(
  file.path(td, "VR2AR_546310_20190613_1.vrl"),
  outdir = td
)
#> ℹ Using Wine mode: EXPERIMENTAL!
#> Error in `error_file_location()` at rvdat/R/vdat_to.R:105:5:
#> ✖ Call to VDAT failed with error:
#>   !! ERROR: Invalid Argument: file is
#>   required
#> ℹ Is the location of
#>   /tmp/RtmpZfiiUk/vignette/VR2AR_546310_20190613_1.vrl
#>   correct?

list.files(td, pattern = "VR2AR")
#> [1] "VR2AR_546310_20190613_1.vrl"
```

`vdat` is very respectful of your data in that it never overwrites files
that exist in the same directory. It’ll just tack on a time stamp to the
name of the newly-exported file.

``` r
vdat_to_csv(
  file.path(td, "VR2AR_546310_20190613_1.vrl"),
  outdir = td
)
#> ℹ Using Wine mode: EXPERIMENTAL!
#> Error in `error_file_location()` at rvdat/R/vdat_to.R:105:5:
#> ✖ Call to VDAT failed with error:
#>   !! ERROR: Invalid Argument: file is
#>   required
#> ℹ Is the location of
#>   /tmp/RtmpZfiiUk/vignette/VR2AR_546310_20190613_1.vrl
#>   correct?

list.files(td, pattern = "VR2AR")
#> [1] "VR2AR_546310_20190613_1.vrl"
```

## Converting a VDAT file to a CSV with time correction

Adding the `time_corrected = TRUE` argument to `vdat_to_csv` corrects
for clock drift using `vdat`’s internal algorithm:

``` r
vdat_to_csv(
  file.path(td, "VR2AR_546310_20190613_1.vrl"),
  outdir = td,
  time_corrected = TRUE
)
#> ℹ Using Wine mode: EXPERIMENTAL!
#> Error in `error_file_location()` at rvdat/R/vdat_to.R:105:5:
#> ✖ Call to VDAT failed with error:
#>   !! ERROR: Invalid Argument: file is
#>   required
#> ℹ Is the location of
#>   /tmp/RtmpZfiiUk/vignette/VR2AR_546310_20190613_1.vrl
#>   correct?
```

A new column is added with time corrected down to the microsecond.

``` r
corrected <- read.csv(
  list.files(td, pattern = "VR2AR.*\\]\\.csv$", full.names = TRUE)[2],
  header = FALSE
)
#> Error in file(file, "rt"): invalid 'description' argument

corrected[46, c(2:3)]
#> Error: object 'corrected' not found
```

## Splitting a VDAT file into a folder of CSVs

As outlined in
[`vignette('vdat-data-structure')`](https://mhpob.github.io/rvdat/articles/vdat-data-structure.md),
the flat CSV exported via `vdat_to_csv` is a mush-together of all
available data types in the VDAT file. `vdat.exe` can split these into a
folder of files according to data type for you, accessible via `rvdat`
in a few ways:

- `vdat_to_folder("PATH_TO_FILE")`, which is a convenience wrapper
  around…
- `vdat_to_csv("PATH_TO_FILE", folder = TRUE)`, which is a convenience
  wrapper around…
- `vdat_call(c('convert', '--format=csv.fathom.split', 'PATH_TO_FILE'))`.

``` r
vdat_to_folder(
  file.path(td, "VR2AR_546310_20190613_1.vrl"),
  outdir = td
)
#> ℹ Using Wine mode: EXPERIMENTAL!
#> Error in `error_file_location()` at rvdat/R/vdat_to.R:105:5:
#> ✖ Call to VDAT failed with error:
#>   !! ERROR: Invalid Argument: file is
#>   required
#> ℹ Is the location of
#>   /tmp/RtmpZfiiUk/vignette/VR2AR_546310_20190613_1.vrl
#>   correct?

list.dirs(td, full.names = F, recursive = F)
#> character(0)

list.files(
  list.dirs(td, full.names = T, recursive = F)
)
#> character(0)
```

## Other file types

Though we just used a VR2AR’s `VRL` file here, this works for multiple
different receiver styles and file types. For example, a HR-180 `VDAT`
file:

``` r
download.file(
  url = file.path(
    "https://github.com/ocean-tracking-network/glatos/raw/dev/inst/extdata",
    "detection_files_raw/HR2-180_461396_2021-04-20_173145.vdat"
  ),
  destfile = file.path(
    td,
    "HR2-180_461396_2021-04-20_173145.vdat"
  ),
  mode = "wb",
  quiet = TRUE
)

hr_output <- vdat_inspect(
  file.path(td, "HR2-180_461396_2021-04-20_173145.vdat")
)
#> ℹ Using Wine mode: EXPERIMENTAL!
#> Error in `error_file_location()` at rvdat/R/vdat_inspect.R:18:5:
#> ✖ Call to VDAT failed with error:
#>   !! ERROR: Invalid Argument: file is
#>   required
#> ℹ Is the location of
#>   /tmp/RtmpZfiiUk/vignette/HR2-180_461396_2021-04-20_173145.vdat
#>   correct?
head(hr_output)
#> Error: object 'hr_output' not found
```
