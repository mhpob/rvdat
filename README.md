
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rvdat

<!-- badges: start -->
<!-- badges: end -->

``` r
library(rvdat)
```

Set system location of vdat.exe:

``` r
vdat_here('inst/vdat.exe')
#> vdat.exe is located at inst/vdat.exe
```

Call VDAT using standard flags:

``` r
call_vdat('--help')
#> [1] 0
```

Currently only prints the “0” in the README, but will print full help
output in the console.
