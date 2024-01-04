
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
#> vdat.exe is located at inst/vdat.exe
```

Call VDAT using standard flags:

``` r
call_vdat('--help')
#>  [1] "VDAT File Tool"                                                                
#>  [2] "Usage:"                                                                        
#>  [3] "  vdat [OPTION...] [COMMAND [ARG]...]..."                                      
#>  [4] ""                                                                              
#>  [5] " Common options:"                                                              
#>  [6] "      --format FORMAT  Output file format (e.g. csv.fathom, csv.fathom.split," 
#>  [7] "                       json.rxlog)"                                            
#>  [8] "      --output PATH    Output file or directory path"                          
#>  [9] ""                                                                              
#> [10] " Conversion Options options:"                                                  
#> [11] "      --timec OPTION            Enable time correction (e.g. --timec=default)" 
#> [12] "      --detection-filter FILTER"                                               
#> [13] "                                Detection filtering algorithm ???"             
#> [14] "      --tagdb FILEPATH          Path of local tag database to be used for"     
#> [15] "                                sensor value conversion."                      
#> [16] "      --offset-hours HOURS      Offset times by a number of hours. Typically"  
#> [17] "                                used to change time zone."                     
#> [18] "      --segment-hours HOURS     Maximum data timespan (in hours) to include"   
#> [19] "                                in each output file"                           
#> [20] ""                                                                              
#> [21] " General options:"                                                             
#> [22] "  -h, --help      Print application help (and exit)"                           
#> [23] "  -v, --version   Print application version (and exit)"                        
#> [24] "      --app-id    Print application identity (and exit)"                       
#> [25] "      --debug     Enable debug mode"                                           
#> [26] "  -p, --progress  Output realtime progress to the console"                     
#> [27] ""                                                                              
#> [28] " Logging options:"                                                             
#> [29] "      --log [=PATH(=C:\\Users\\darpa2\\AppData\\Local\\Innovasea\\VRPC\\vdat)]"
#> [30] "                                Enable file logging. Explicit path is"         
#> [31] "                                optional."                                     
#> [32] "      --log-level LEVEL         Set filter threshold for file logging [0"      
#> [33] "                                (most verbose), 1000 (least verbose)]"         
#> [34] "      --trace                   Send all logging to console (no filtering)"    
#> [35] "      --trace-debug             Send logging to console with debug-level"      
#> [36] "                                filtering (200)"                               
#> [37] "      --trace-info              Send logging to console with info-level"       
#> [38] "                                filtering (300)"                               
#> [39] ""                                                                              
#> [40] " Commands:"                                                                    
#> [41] "  convert   Convert file to the given file format"                             
#> [42] "            .  Usage:    vdat convert --format=<FORMAT> <INPUT_FILEPATH>"      
#> [43] "            ."                                                                 
#> [44] "            .  Optional: --output=<FILE_OR_DIRECTORY_PATH>"                    
#> [45] "            .            --timec=default"                                      
#> [46] "            .            --detection-filter=<FILTER>"                          
#> [47] "            .            --tagdb=<FILEPATH>"                                   
#> [48] "            .            --offset-hours=<HOURS>"                               
#> [49] "            .            --segment-hours=<HOURS>"                              
#> [50] "            ."                                                                 
#> [51] "            .  Example:  vdat convert --format=csv.fathom <INPUT_FILEPATH>"    
#> [52] "            .            vdat convert --format=json.rxlog <INPUT_FILEPATH>"    
#> [53] "            "                                                                  
#> [54] "  inspect   Describe the content of an existing file"                          
#> [55] "            .  Usage:    vdat inspect <INPUT_FILEPATH>"                        
#> [56] "            "                                                                  
#> [57] "  template  Generate template for a given file format"                         
#> [58] "            .  Usage:    vdat template --format=<FORMAT>"                      
#> [59] "            ."                                                                 
#> [60] "            .  Optional: --output=<OUTPUT_FILEPATH>"                           
#> [61] "            ."                                                                 
#> [62] "            .  Example:  vdat template --format=vfwp"                          
#> [63] "            "                                                                  
#> [64] ""
```
