# VDAT data structure

``` r
library(rvdat)
```

## Row-by-row data description

I’ll start off the same way as in
[`vignette('how-to-use-rvdat')`](https://mhpob.github.io/rvdat/articles/how-to-use-rvdat.md):

1.  Locating `vdat.exe` with `vdat_here`
2.  Downloading the example VRL file from the `glatos` package
3.  Converting the VRL to a CSV using `vdat_to_csv`

``` r
library(rvdat)

td <- file.path(
  tempdir(),
  "vignette"
)

dir.create(
  td
)

vdat_here()
#> i Looking for vdat in the typical locations.
#> i vdat is located at C:/Program Files/Innovasea/Fathom Connect/vdat.exe

download.file(
  url = file.path(
    "https://github.com/ocean-tracking-network/glatos/raw/dev/inst/extdata",
    "detection_files_raw/VR2AR_546310_20190613_1.vrl"
  ),
  destfile = file.path(td, "VR2AR_546310_20190613_1.vrl"),
  mode = "wb",
  quiet = TRUE
)

vdat_to_csv(file.path(td, "VR2AR_546310_20190613_1.vrl"),
  outdir = td
)
#> 0.0% - Converting File
7.6% - Converting File
9.2% - Converting File
10.7% - Converting File
12.2% - Converting File
13.7% - Converting File
15.3% - Converting File
16.8% - Converting File
18.3% - Converting File
19.8% - Converting File
21.4% - Converting File
22.9% - Converting File
24.4% - Converting File
26.0% - Converting File
27.5% - Converting File
29.0% - Converting File
30.5% - Converting File
32.1% - Converting File
33.6% - Converting File
35.1% - Converting File
36.6% - Converting File
38.2% - Converting File
39.7% - Converting File
41.2% - Converting File
42.7% - Converting File
44.3% - Converting File
45.8% - Converting File
47.3% - Converting File
48.9% - Converting File
50.4% - Converting File
51.9% - Converting File
53.4% - Converting File
55.0% - Converting File
56.5% - Converting File
58.0% - Converting File
59.5% - Converting File
61.1% - Converting File
62.6% - Converting File
64.1% - Converting File
65.6% - Converting File
67.2% - Converting File
68.7% - Converting File
70.2% - Converting File
71.8% - Converting File
73.3% - Converting File
74.8% - Converting File
76.3% - Converting File
77.9% - Converting File
79.4% - Converting File
80.9% - Converting File
82.4% - Converting File
84.0% - Converting File
85.5% - Converting File
87.0% - Converting File
88.5% - Converting File
90.1% - Converting File
91.6% - Converting File
93.1% - Converting File
94.7% - Converting File
96.2% - Converting File
97.7% - Converting File
100.0% - Converting File
                        


#> v File converted:
#>   C:\Users\darpa2\AppData\Local\Temp\RtmpusjJ5z/vignette/VR2AR_546310_20190613_1.vrl
#> i File saved in:
#>   C:\Users\darpa2\AppData\Local\Temp\RtmpusjJ5z/vignette/VR2AR_546310_20190613_1.csv
```

``` r
list.files(td, pattern = "VR2AR")
#> [1] "VR2AR_546310_20190613_1.csv" "VR2AR_546310_20190613_1.vrl"
```

## Exploring the VDAT CSV’s data structure

Now for the fun part: what does the csv look like?

``` r
exported_csv <- read.csv(
  file.path(td, "VR2AR_546310_20190613_1.csv")
)
#> Error in read.table(file = file, header = header, sep = sep, quote = quote, : more columns than column names
```

Uh oh! Something weird!
[`utils::read.csv`](https://rdrr.io/r/utils/read.table.html) guesses how
many columns there should be by looking at the first five lines of the
data. Here, it took a guess and more columns showed up later. Let’s skip
that process by telling it that the first row does not contain column
names by using `header = FALSE`.

``` r
exported_csv <- read.csv(
  file.path(td, "VR2AR_546310_20190613_1.csv"),
  header = FALSE
)

head(exported_csv)
#>                  V1                V2
#> 1 \357\273\277VEMCO DATA LOG             2.0.0
#> 2       RECORD TYPE             FIELD
#> 3     ATTITUDE_DESC Device Time (UTC)
#> 4      BATTERY_DESC Device Time (UTC)
#> 5  CFG_CHANNEL_DESC Device Time (UTC)
#> 6  CFG_STATION_DESC Device Time (UTC)
#>                                    V3              V4
#> 1 vdat-11.0.1-20240830-d01c0d-release                
#> 2                               FIELD           FIELD
#> 3                                Time Time Offset (h)
#> 4                                Time Time Offset (h)
#> 5                                Time Time Offset (h)
#> 6                                Time Time Offset (h)
#>                    V5    V6            V7               V8
#> 1                                                         
#> 2               FIELD FIELD         FIELD            FIELD
#> 3 Time Correction (s) Model Serial Number       Tilt (deg)
#> 4 Time Correction (s) Model Serial Number Battery Position
#> 5 Time Correction (s) Model Serial Number          Channel
#> 6 Time Correction (s) Model Serial Number     Station Name
#>               V9                   V10                 V11
#> 1                                                         
#> 2          FIELD                 FIELD               FIELD
#> 3                                                         
#> 4   Battery Type Battery Serial Number Battery Voltage (V)
#> 5 Detection Type       Frequency (kHz)       Blanking (ms)
#> 6 Latitude (deg)       Longitude (deg)                    
#>                     V12       V13   V14   V15   V16   V17   V18   V19
#> 1                                                                    
#> 2                 FIELD     FIELD FIELD FIELD FIELD FIELD FIELD FIELD
#> 3                                                                    
#> 4 Battery Remaining (%)                                              
#> 5                Map ID Coding ID                                    
#> 6                                                                    
#>     V20   V21   V22   V23   V24   V25   V26
#> 1                                          
#> 2 FIELD FIELD FIELD FIELD FIELD FIELD FIELD
#> 3                                          
#> 4                                          
#> 5                                          
#> 6
```

I suggest that you skim through the data frame with the `View` function.
You’ll find that it has a few properties:

#### The first row contains metadata about `vdat.exe`, itself.

``` r
exported_csv[1, ]
#>                  V1    V2                                  V3 V4 V5 V6
#> 1 \357\273\277VEMCO DATA LOG 2.0.0 vdat-11.0.1-20240830-d01c0d-release         
#>   V7 V8 V9 V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 V23 V24
#> 1                                                                     
#>   V25 V26
#> 1
```

While there are 26 columns as a separate row takes that many fields to
describe its data structure (see the next section), only the first three
are pertinent.

1.  This is a VEMCO data log;
2.  It is using version 2.0.0 of the schema;
3.  It was created with some specific vdat version.

&nbsp;

1.  Note that this does, in fact, match the version of `vdat` we are
    using. This can be found using
    [`rvdat::vdat_version`](https://mhpob.github.io/rvdat/reference/vdat_version.md).

``` r
vdat_version()
#> vdat-11.0.1-20240830-d01c0d-release
```

#### The next 20+ lines contain the column names of different subsets of the data.

These subsets are by variable, such as tilt angle, temperature, and the
like. They are designated as *descriptions* by appending `_DESC` to the
variable name in the form `<variable>_DESC` (Description – DESC. Get
it?). This is the reason we couldn’t import the CSV the first time –
there are a different number of columns for each variable, and thus the
data was more jagged than `read.csv` expected.

``` r
exported_csv[2:5, ]
#>                 V1                V2    V3              V4
#> 2      RECORD TYPE             FIELD FIELD           FIELD
#> 3    ATTITUDE_DESC Device Time (UTC)  Time Time Offset (h)
#> 4     BATTERY_DESC Device Time (UTC)  Time Time Offset (h)
#> 5 CFG_CHANNEL_DESC Device Time (UTC)  Time Time Offset (h)
#>                    V5    V6            V7               V8
#> 2               FIELD FIELD         FIELD            FIELD
#> 3 Time Correction (s) Model Serial Number       Tilt (deg)
#> 4 Time Correction (s) Model Serial Number Battery Position
#> 5 Time Correction (s) Model Serial Number          Channel
#>               V9                   V10                 V11
#> 2          FIELD                 FIELD               FIELD
#> 3                                                         
#> 4   Battery Type Battery Serial Number Battery Voltage (V)
#> 5 Detection Type       Frequency (kHz)       Blanking (ms)
#>                     V12       V13   V14   V15   V16   V17   V18   V19
#> 2                 FIELD     FIELD FIELD FIELD FIELD FIELD FIELD FIELD
#> 3                                                                    
#> 4 Battery Remaining (%)                                              
#> 5                Map ID Coding ID                                    
#>     V20   V21   V22   V23   V24   V25   V26
#> 2 FIELD FIELD FIELD FIELD FIELD FIELD FIELD
#> 3                                          
#> 4                                          
#> 5
```

#### The next ~7 rows contain receiver configuration

After a row designated as `DATA_SOURCE_FILE`, there are a few rows which
outline the receiver’s configuration; this file has 6 total. These are
things like the initialization time, Map ID, whether an internal
transmitter is turned on (and its delay), etc..

``` r
first_data_row <- which(exported_csv$V1 == "DATA_SOURCE_FILE")
exported_csv[first_data_row:(first_data_row + 6), ]
#>                  V1                          V2
#> 28 DATA_SOURCE_FILE VR2AR_546310_20190613_1.vrl
#> 29       EVENT_INIT         2019-06-11 02:44:16
#> 30        CLOCK_REF         2019-06-11 02:44:16
#> 31      CFG_CHANNEL         2019-06-11 02:44:16
#> 32  CFG_TRANSMITTER         2019-06-11 02:44:16
#> 33  CFG_TRANSMITTER         2019-06-11 02:44:27
#> 34  CFG_TRANSMITTER         2019-06-11 02:44:34
#>                                      V3
#> 28 ffee6ee7-450a-db42-b54c-334b672fddf5
#> 29                                     
#> 30                                     
#> 31                                     
#> 32                                     
#> 33                                     
#> 34                                     
#>                                         V4     V5       V6     V7
#> 28 com.vemco.file.vrl.0207.ff02.ff02/5.0.1 110026 ORIGINAL       
#> 29                                                VR2AR-69 546310
#> 30                                                VR2AR-69 546310
#> 31                                                VR2AR-69 546310
#> 32                                                VR2AR-69 546310
#> 33                                                VR2AR-69 546310
#> 34                                                VR2AR-69 546310
#>                     V8             V9            V10      V11     V12
#> 28                                                                   
#> 29 2019-06-11 02:44:11      UTC-04:00          5.0.1                 
#> 30 2019-06-11 02:44:16              0 INITIALIZATION                 
#> 31                   1            PPM             69      260 MAP-113
#> 32                 PPM A69-1601-60774          60774 DISABLED     540
#> 33                 PPM A69-1601-60774          60774 DISABLED     540
#> 34                 PPM A69-1601-60774          60774 DISABLED     540
#>    V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 V23 V24 V25 V26
#> 28                                                        
#> 29                                                        
#> 30                                                        
#> 31                                                        
#> 32 660                                                    
#> 33 660                                                    
#> 34 660
```

#### Logged data!

*“‘And now,’ cried Max, ‘let the wild rumpus start!’”*

Depending on how long you’ve had your receiver deployed, you could have
many thousands of rows after this. If you’re logging environmental data
you’ll have on the order of four rows per minute deployed (temperature,
depth, tilt, and general diagnostics), as well as one for every logged
detection.

``` r
exported_csv[(first_data_row + 7):(first_data_row + 7 + 7), ]
#>           V1                  V2 V3 V4 V5       V6     V7     V8  V9
#> 35 DIAG_FAST 2019-06-11 02:45:00          VR2AR-69 546310 17.064 150
#> 36      TEMP 2019-06-11 02:45:00          VR2AR-69 546310 17.064    
#> 37     DEPTH 2019-06-11 02:45:00          VR2AR-69 546310      0    
#> 38  ATTITUDE 2019-06-11 02:45:00          VR2AR-69 546310      2    
#> 39 DIAG_FAST 2019-06-11 02:46:00          VR2AR-69 546310 17.129 161
#> 40      TEMP 2019-06-11 02:46:00          VR2AR-69 546310 17.129    
#> 41     DEPTH 2019-06-11 02:46:00          VR2AR-69 546310      0    
#> 42  ATTITUDE 2019-06-11 02:46:00          VR2AR-69 546310      3    
#>    V10 V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 V23 V24 V25 V26
#> 35   2   0                                                            
#> 36                                                                    
#> 37                                                                    
#> 38                                                                    
#> 39   3   0                                                            
#> 40                                                                    
#> 41                                                                    
#> 42
```

Diagnostic rows (`DIAG`) will have the hourly mean of `TEMP`, `DEPTH`,
and `ATTITUDE` rows, as well as detections/pings. If you have fast
diagnostics on, rows labeled with `DIAG_FAST` will contain the same
per-minute data as `TEMP`/`DEPTH`/`ATTITUDE`.

``` r
exported_csv[(exported_csv$V1 == "DIAG"), ][1, ]
#>      V1                  V2 V3 V4 V5       V6     V7     V8  V9 V10 V11
#> 95 DIAG 2019-06-11 03:00:00          VR2AR-69 546310 17.744 150  87   0
#>    V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22 V23 V24 V25 V26
#> 95   0   0
```

#### Detections are logged to the tenth of a millisecond

That’s $1\text{e-}4$ seconds. Whether that’s accurate or just
over-precise… I don’t know.

Detections are indicated by a row labeled with `DET`, followed by the
raw logged time, time-corrected time if applicable, and information
about the transmitter.

``` r
exported_csv[(exported_csv$V1 == "DET"), ][1, ]
#>       V1                       V2 V3 V4 V5       V6     V7 V8  V9
#> 2566 DET 2019-06-11 13:03:32.0837          VR2AR-69 546310  1 PPM
#>                 V10   V11 V12 V13 V14 V15 V16 V17 V18 V19 V20 V21 V22
#> 2566 A69-1601-57060 57060                                            
#>      V23 V24 V25 V26
#> 2566
```

#### The last three rows are data associated with the download

The internal transmitter configuration, time associated with the
internal and downloading-computer clocks, and the download, itself, are
all reported.

``` r
tail(exported_csv)
#>                    V1                  V2 V3 V4 V5       V6     V7
#> 16748            TEMP 2019-06-13 17:30:00          VR2AR-69 546310
#> 16749           DEPTH 2019-06-13 17:30:00          VR2AR-69 546310
#> 16750        ATTITUDE 2019-06-13 17:30:00          VR2AR-69 546310
#> 16751 CFG_TRANSMITTER 2019-06-13 17:30:34          VR2AR-69 546310
#> 16752       CLOCK_REF 2019-06-13 17:30:53          VR2AR-69 546310
#> 16753   EVENT_OFFLOAD 2019-06-13 17:30:53          VR2AR-69 546310
#>                        V8             V9     V10      V11     V12 V13
#> 16748               21.21                                            
#> 16749                   0                                            
#> 16750                   2                                            
#> 16751                 PPM A69-1601-60774   60774 DISABLED     540 660
#> 16752 2019-06-13 17:30:54              1 OFFLOAD                     
#> 16753 2019-06-13 17:30:54      UTC-04:00             1328 99.6235  51
#>                               V14 V15 V16 V17 V18 V19 V20 V21 V22 V23
#> 16748                                                                
#> 16749                                                                
#> 16750                                                                
#> 16751                                                                
#> 16752                                                                
#> 16753 VR2AR_546310_20190613_1.vrl                                    
#>       V24 V25 V26
#> 16748            
#> 16749            
#> 16750            
#> 16751            
#> 16752            
#> 16753
```
