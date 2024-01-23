
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rvdat

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/mhpob/rvdat/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mhpob/rvdat/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/mhpob/rvdat/branch/main/graph/badge.svg)](https://app.codecov.io/gh/mhpob/rvdat?branch=main)
<!-- badges: end -->

The intent of this package is to provide lightweight R wrapper functions
around Innovasea’s VDAT File Tool for those who are intimidated by the
shell (me) or just want to keep everything in one language (R, also me).

`rvdat` is intended to play nicely with the
[`matos`](https://matos.obrien.page) and
[`otndo`](https://otndo.obrien.page) packages, though full connectivity
and documentation on how to do so is a work in progress. Please reach
out to me at <mike@obrien.page> or open an issue on GitHub if you need
any help.

For similar implementation that has a few more bells and whistles, check
out
[`glatos::vdat_convert`](https://github.com/ocean-tracking-network/glatos/blob/dev/R/util-vdat.r)
in version \>= 0.8.0 of the [glatos
package](https://github.com/ocean-tracking-network/glatos).

## Installation

### Download `vdat.exe`

`rvdat` requires a VDAT executable (`vdat.exe`) in order to work, which
comes packaged in Innovasea’s Fathom Connect software. You can [download
the software
here](https://support.fishtracking.innovasea.com/s/downloads) after
providing your contact details and agreeing to their End User License
Agreement.

![](man/figures/README-fathom_connect_download.png)

Extract and run the installer, paying attention into which directory the
program is installed. On my (Windows) machine, it installs itself into
`C:\Program Files\Innovasea\Fathom`.

``` r
path_to_vdat <- list.files(
  path = "C:/Program Files/Innovasea/Fathom",
  pattern = "^vdat\\.exe$",
  full.names = TRUE
)

path_to_vdat
#> [1] "C:/Program Files/Innovasea/Fathom/vdat.exe"
```

### Install `rvdat`

You can install the most-up-to-date version of this package from
[R-universe](https://mhpob.r-universe.dev/rvdat) or
[GitHub](https://github.com/mhpob/rvdat).

R-universe:

``` r
install.packages(
  "rvdat",
  repos = c(
    "https://mhpob.r-universe.dev",
    "https://cloud.r-project.org"
  )
)
```

GitHub:

``` r
# install.packages("remotes")
remotes::install_github("mhpob/rvdat")
```

## Progress

- [ ] Look for `vdat.exe`
- [x] Check VDAT is where you say it is
- Convert VRL to
- [x] CSV
- [x] folder of CSVs by factor
- [ ] JSON
- [ ] Convert multiple VRLs
- [x] Output location
- [x] Time correction
- [ ] Time offset
- [ ] Detection filter (only implemented for HR3)
- [ ] Sensor values
- [ ] Logging
- [x] Inspect content of file
- [ ] Create template for
- [ ] CSV
- [ ] JSON

## Using the package

Load the package:

``` r
library(rvdat)
```

Set system location of vdat.exe:

``` r
vdat_here(path_to_vdat)
#> ℹ vdat.exe is located at C:/Program Files/Innovasea/Fathom/vdat.exe
```

What version?

``` r
vdat_version()
#> vdat-7.0.0-20231107-14c992-release
```

Convert a VRL to CSV:

``` r
## vdat_to_csv("SOME-VDAT-FILE")
#> ✔ File converted:
#>   C:\Users\darpa2\AppData\Local\Temp\Rtmp46huTZ/readme_files/HR2-180 461396
#>   2021-04-20 173145.vdat
#> ℹ File saved in:
#>   C:\Users\darpa2\AppData\Local\Temp\Rtmp46huTZ/readme_files/HR2-180 461396
#>   2021-04-20 173145.csv
```

Convert a VRL to a folder of CSVs split by data type:

``` r
## vdat_to_folder("SOME-VDAT-FILE")
#> ✔ File converted:
#>   C:\Users\darpa2\AppData\Local\Temp\Rtmp46huTZ/readme_files/HR2-180 461396
#>   2021-04-20 173145.vdat
#> ℹ Files saved in:
#>   C:\Users\darpa2\AppData\Local\Temp\Rtmp46huTZ/readme_files/HR2-180 461396
#>   2021-04-20 173145.csv-fathom-split
## list.files("SOME-VDAT-FILE.csv-fathom-split")
#>  [1] "ATTITUDE.csv"         "BATTERY.csv"          "CFG_CHANNEL.csv"     
#>  [4] "CFG_TRANSMITTER.csv"  "CLOCK_SET.csv"        "DATA_SOURCE_FILE.csv"
#>  [7] "DET.csv"              "DET_FILTER.csv"       "DIAG_HR2.csv"        
#> [10] "EVENT.csv"            "EVENT_INIT.csv"       "EVENT_OFFLOAD.csv"   
#> [13] "TEMP.csv"
```

Check out the file metadata:

``` r
## vdat_inspect("SOME-VDAT-FILE")
#> ==============================================================================
#>                                      VDAT                                     
#> ==============================================================================
#> File:      HR2-180 461396 2021-04-20 173145.vdat
#> Original:  HR2-180 461396 2021-04-20 173145.vdat
#> Container: Vemco Data File (com.vemco.file.vdat/1.0.0)
#> Content:   HR2 Receiver Data Pack (com.vemco.file.vrdp.vrhr2/1.0.0)
#> Created:   2021-04-20T17:31:45
#> File UUID: f1a18604-46ea-4985-b57c-24809d37ad46
#> Data UUID: 1a595886-99ea-4ee9-a996-2e4d92dc01c3
#> Size:      39370
#> Blocks:    17
#> Block Types: 
#>            VRDP Header (com.vemco.file.vrdp.header/1.1.0)
#>            RxLog General Summary (com.vemco.protobuf.rxlog.summary.general/1.0.0)
#>            HR2 Offload Header (com.vemco.device.vrhr2.offload.header/1.0.0)
#>            HR2 Offload Footer (com.vemco.device.vrhr2.offload.footer/1.0.0)
#>            HR2 Detection Log Block (com.vemco.device.vrhr2.log.detect/1.0.0)
#>            HR2 Ping Log Block (com.vemco.device.vrhr2.log.ping/1.0.0)
#> Codecs: 
#>            zlib compression (com.vemco.file.vdat.codec.zlib/1.2.11)
#> 
#> ==============================================================================
#>                                      VRDP                                     
#> ==============================================================================
#> Creator:   fathom-2.5.0-19700101--release
#> Source:    HR2-180 (0814)
#> 
#> ==============================================================================
#>                                    Offload                                    
#> ==============================================================================
#> Firmware Version: 2.0.1
#> Receiver Time @ Init: 2021-04-20T17:20:05Z
#> Client Time @ Init: 2021-04-20T17:20:06Z
#> Client Time Zone @ Init: -04:00
#> Receiver Time @ Offload: 2021-04-20T21:31:45Z
#> Client Time @ Offload: 2021-04-20T21:31:45Z
#> Client Time Zone @ Offload: -04:00
#> 
#> 
```

Call VDAT using standard flags:

``` r
vdat_call("--help")
#> VDAT File Tool
#> Usage:
#>   vdat [OPTION...] [COMMAND [ARG]...]...
#> 
#>  Common options:
#>       --format FORMAT  Output file format (e.g. csv.fathom, csv.fathom.split,
#>                        json.rxlog)
#>       --output PATH    Output file or directory path
#> 
#>  Conversion Options options:
#>       --timec OPTION            Enable time correction (e.g. --timec=default)
#>       --detection-filter FILTER
#>                                 Detection filtering algorithm ???
#>       --tagdb FILEPATH          Path of local tag database to be used for
#>                                 sensor value conversion.
#>       --offset-hours HOURS      Offset times by a number of hours. Typically
#>                                 used to change time zone.
#>       --segment-hours HOURS     Maximum data timespan (in hours) to include
#>                                 in each output file
#> 
#>  General options:
#>   -h, --help      Print application help (and exit)
#>   -v, --version   Print application version (and exit)
#>       --app-id    Print application identity (and exit)
#>       --debug     Enable debug mode
#>   -p, --progress  Output realtime progress to the console
#> 
#>  Logging options:
#>       --log [=PATH(=C:\Users\darpa2\AppData\Local\Innovasea\VRPC\vdat)]
#>                                 Enable file logging. Explicit path is
#>                                 optional.
#>       --log-level LEVEL         Set filter threshold for file logging [0
#>                                 (most verbose), 1000 (least verbose)]
#>       --trace                   Send all logging to console (no filtering)
#>       --trace-debug             Send logging to console with debug-level
#>                                 filtering (200)
#>       --trace-info              Send logging to console with info-level
#>                                 filtering (300)
#> 
#>  Commands:
#>   convert   Convert file to the given file format
#>             .  Usage:    vdat convert --format=<FORMAT> <INPUT_FILEPATH>
#>             .
#>             .  Optional: --output=<FILE_OR_DIRECTORY_PATH>
#>             .            --timec=default
#>             .            --detection-filter=<FILTER>
#>             .            --tagdb=<FILEPATH>
#>             .            --offset-hours=<HOURS>
#>             .            --segment-hours=<HOURS>
#>             .
#>             .  Example:  vdat convert --format=csv.fathom <INPUT_FILEPATH>
#>             .            vdat convert --format=json.rxlog <INPUT_FILEPATH>
#>             
#>   inspect   Describe the content of an existing file
#>             .  Usage:    vdat inspect <INPUT_FILEPATH>
#>             
#>   template  Generate template for a given file format
#>             .  Usage:    vdat template --format=<FORMAT>
#>             .
#>             .  Optional: --output=<OUTPUT_FILEPATH>
#>             .
#>             .  Example:  vdat template --format=vfwp
#>             
#> 
```

## Development notes

If contributing, please use the following general style:

- Begin any function that will call `vdat.exe` with the
  `vdat_loc <- check_vdat_location()` helper function.
- Use the [`sys` package](https://jeroen.r-universe.dev/sys) to send
  commands to `vdat.exe`, usually via `sys::exec_internal`. The “cmd”
  argument can then be `vdat_loc`.
- Create informative messages, warnings, and errors using the [`cli`
  package](https://cli.r-lib.org/).
- In summary:

``` r
a_new_wrapper <- function(some_command) {
  vdat_loc <- check_vdat_location()

  sys::exec_internal(
    vdat_loc,
    args = some_command
  )

  cli::cli_alert_success("Woohoo!!")
}
```
