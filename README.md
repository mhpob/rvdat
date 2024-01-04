
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rvdat

<!-- badges: start -->
<!-- badges: end -->

``` r
library(rvdat)
```

Download [current version of VDAT
executable](https://gitlab.oceantrack.org/otndc/vdat-working-group) and
point `vdat_here` to its location.

Set system location of vdat.exe:

``` r
vdat_here('inst/vdat.exe')
#> ℹ vdat.exe is located at inst/vdat.exe
```

Call VDAT using standard flags:

``` r
call_vdat('--help')
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
