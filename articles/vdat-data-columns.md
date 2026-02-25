# Data within VDAT files

This vignette is a working draft. There will be lots of changes as
`rvdat` gets fleshed out, so please check back often!

The most recent changes were made on 2024-11-15.

``` r
library(rvdat)
```

## Data columns

The table below shows each receiver/VDAT type along with, in
alphabetical order, each logged data type (attitude, battery, etc.) and
their respective column names/data fields in bullets.

    #>   receiver file_type n_data_types
    #> 1  HR2-180      VDAT           25
    #> 2    VR2AR       VRL           24
    #> 3    VR2TX       VRL           24
    #> 4     VR2W       VRL           26
    #> 5  VR2W180       VRL           26

### HR2-180 VDAT, n = 25

#### ATTITUDE, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Tilt (deg)

#### BATTERY, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Battery Position
- Battery Type
- Battery Serial Number
- Battery Voltage (V)
- Battery Remaining (%)

#### CFG_CHANNEL, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Channel
- Detection Type
- Frequency (kHz)
- Blanking (ms)
- Map ID
- Coding ID

#### CFG_STATION, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Station Name
- Latitude (deg)
- Longitude (deg)

#### CFG_STUDY, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Description

#### CFG_TRANSMITTER, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Transmission Type
- Full ID
- ID
- Power Level
- Min Delay (s)
- Max Delay (s)

#### CLOCK_REF, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- External Time (UTC)
- External Difference (s)
- Source

#### CLOCK_SET, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- Prior Difference (s)
- Source

#### DATA_ERROR, n = 5

- Type
- Error
- Page

- Offset
- Description

#### DATA_SOURCE_FILE, n = 5

- File Name
- UUID
- Type

- Size
- State

#### DEPTH, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Depth (m)

#### DEPTH_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Depth Min (m)
- Depth Max (m)
- Depth Mean (m)
- Sample Count
- Accumulation Period (s)

#### DET, n = 20

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID

- Raw Data
- Transmitter Serial
- Signal Strength (dB)
- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP

#### DET_FILTER, n = 3

- Filter Name
- Details

- Rejected Detections

#### DET_SENS, n = 25

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID
- Raw Data
- Transmitter Serial
- Signal Strength (dB)

- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP
- Transmitter Type
- Sensor Function
- Sensor Value
- Sensor Unit
- Sensor Precision

#### DIAG, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Temperature (deg C)
- Noise Mean (mV)
- Tilt (deg)
- Depth (m)
- PPM Pings
- PPM Detections

#### DIAG_FAST, n = 10

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Ambient Temperature (deg C)
- Noise (mV)
- Tilt (deg)
- Depth (m)

#### DIAG_HR2, n = 15

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Tilt (deg)
- HR Noise (dB)

- HR Accepted Detections
- HR Rejected Detections
- PPM Pings (D1)
- PPM Detections (D1)
- PPM Pings (D2)
- PPM Detections (D2)
- PPM Noise (dB)

#### EVENT, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Type

- Subtype
- Description
- Values
- Latitude
- Longitude
- GPS HDOP

#### EVENT_FAULT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Fault Importance
- Fault Code
- Fault Description

#### EVENT_INIT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- External Time Zone
- Firmware Version

#### EVENT_OFFLOAD, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- External Time (UTC)

- External Time Zone
- HR Total Accepted Detections
- PPM Total Accepted Detections
- Memory Remaining (%)
- Battery Remaining (%)
- Original File

#### HEALTH_HR2, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Line Voltage (V)
- Memory Remaining (%)
- RTC Time

#### TEMP, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Ambient (deg C)
- Internal (deg C)

#### TEMP_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Min (deg C)
- Ambient Max (deg C)
- Ambient Mean (deg C)
- Sample Count
- Accumulation Period (s)

### VR2AR VRL, n = 24

#### ATTITUDE, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Tilt (deg)

#### BATTERY, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Battery Position
- Battery Type
- Battery Serial Number
- Battery Voltage (V)
- Battery Remaining (%)

#### CFG_CHANNEL, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Channel
- Detection Type
- Frequency (kHz)
- Blanking (ms)
- Map ID
- Coding ID

#### CFG_STATION, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Station Name
- Latitude (deg)
- Longitude (deg)

#### CFG_STUDY, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Description

#### CFG_TRANSMITTER, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Transmission Type
- Full ID
- ID
- Power Level
- Min Delay (s)
- Max Delay (s)

#### CLOCK_REF, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- External Time (UTC)
- External Difference (s)
- Source

#### CLOCK_SET, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- Prior Difference (s)
- Source

#### DATA_ERROR, n = 5

- Type
- Error
- Page

- Offset
- Description

#### DATA_SOURCE_FILE, n = 5

- File Name
- UUID
- Type

- Size
- State

#### DEPTH, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Depth (m)

#### DEPTH_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Depth Min (m)
- Depth Max (m)
- Depth Mean (m)
- Sample Count
- Accumulation Period (s)

#### DET, n = 20

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID

- Raw Data
- Transmitter Serial
- Signal Strength (dB)
- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP

#### DET_FILTER, n = 3

- Filter Name
- Details

- Rejected Detections

#### DET_SENS, n = 25

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID
- Raw Data
- Transmitter Serial
- Signal Strength (dB)

- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP
- Transmitter Type
- Sensor Function
- Sensor Value
- Sensor Unit
- Sensor Precision

#### DIAG, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Temperature (deg C)
- Noise Mean (mV)
- Tilt (deg)
- Depth (m)
- PPM Pings
- PPM Detections

#### DIAG_FAST, n = 10

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Ambient Temperature (deg C)
- Noise (mV)
- Tilt (deg)
- Depth (m)

#### EVENT, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Type

- Subtype
- Description
- Values
- Latitude
- Longitude
- GPS HDOP

#### EVENT_FAULT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Fault Importance
- Fault Code
- Fault Description

#### EVENT_INIT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- External Time Zone
- Firmware Version

#### EVENT_OFFLOAD, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- External Time (UTC)

- External Time Zone
- HR Total Accepted Detections
- PPM Total Accepted Detections
- Memory Remaining (%)
- Battery Remaining (%)
- Original File

#### HEALTH_VR2AR, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Memory Remaining (%)
- RTC Time

#### TEMP, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Ambient (deg C)
- Internal (deg C)

#### TEMP_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Min (deg C)
- Ambient Max (deg C)
- Ambient Mean (deg C)
- Sample Count
- Accumulation Period (s)

### VR2TX VRL, n = 24

#### ATTITUDE, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Tilt (deg)

#### BATTERY, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Battery Position
- Battery Type
- Battery Serial Number
- Battery Voltage (V)
- Battery Remaining (%)

#### CFG_CHANNEL, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Channel
- Detection Type
- Frequency (kHz)
- Blanking (ms)
- Map ID
- Coding ID

#### CFG_STATION, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Station Name
- Latitude (deg)
- Longitude (deg)

#### CFG_STUDY, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Description

#### CFG_TRANSMITTER, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Transmission Type
- Full ID
- ID
- Power Level
- Min Delay (s)
- Max Delay (s)

#### CLOCK_REF, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- External Time (UTC)
- External Difference (s)
- Source

#### CLOCK_SET, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- Prior Difference (s)
- Source

#### DATA_ERROR, n = 5

- Type
- Error
- Page

- Offset
- Description

#### DATA_SOURCE_FILE, n = 5

- File Name
- UUID
- Type

- Size
- State

#### DEPTH, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Depth (m)

#### DEPTH_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Depth Min (m)
- Depth Max (m)
- Depth Mean (m)
- Sample Count
- Accumulation Period (s)

#### DET, n = 20

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID

- Raw Data
- Transmitter Serial
- Signal Strength (dB)
- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP

#### DET_FILTER, n = 3

- Filter Name
- Details

- Rejected Detections

#### DET_SENS, n = 25

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID
- Raw Data
- Transmitter Serial
- Signal Strength (dB)

- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP
- Transmitter Type
- Sensor Function
- Sensor Value
- Sensor Unit
- Sensor Precision

#### DIAG, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Temperature (deg C)
- Noise Mean (mV)
- Tilt (deg)
- Depth (m)
- PPM Pings
- PPM Detections

#### DIAG_FAST, n = 10

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Ambient Temperature (deg C)
- Noise (mV)
- Tilt (deg)
- Depth (m)

#### EVENT, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Type

- Subtype
- Description
- Values
- Latitude
- Longitude
- GPS HDOP

#### EVENT_FAULT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Fault Importance
- Fault Code
- Fault Description

#### EVENT_INIT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- External Time Zone
- Firmware Version

#### EVENT_OFFLOAD, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- External Time (UTC)

- External Time Zone
- HR Total Accepted Detections
- PPM Total Accepted Detections
- Memory Remaining (%)
- Battery Remaining (%)
- Original File

#### HEALTH_VR2TX, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Memory Remaining (%)
- RTC Time

#### TEMP, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Ambient (deg C)
- Internal (deg C)

#### TEMP_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Min (deg C)
- Ambient Max (deg C)
- Ambient Mean (deg C)
- Sample Count
- Accumulation Period (s)

### VR2W VRL, n = 26

#### ATTITUDE, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Tilt (deg)

#### BATTERY, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Battery Position
- Battery Type
- Battery Serial Number
- Battery Voltage (V)
- Battery Remaining (%)

#### CFG_CHANNEL, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Channel
- Detection Type
- Frequency (kHz)
- Blanking (ms)
- Map ID
- Coding ID

#### CFG_STATION, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Station Name
- Latitude (deg)
- Longitude (deg)

#### CFG_STUDY, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Description

#### CFG_TRANSMITTER, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Transmission Type
- Full ID
- ID
- Power Level
- Min Delay (s)
- Max Delay (s)

#### CLOCK_REF, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- External Time (UTC)
- External Difference (s)
- Source

#### CLOCK_SET, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- Prior Difference (s)
- Source

#### DATA_ERROR, n = 5

- Type
- Error
- Page

- Offset
- Description

#### DATA_SOURCE_FILE, n = 5

- File Name
- UUID
- Type

- Size
- State

#### DEPTH, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Depth (m)

#### DEPTH_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Depth Min (m)
- Depth Max (m)
- Depth Mean (m)
- Sample Count
- Accumulation Period (s)

#### DET, n = 20

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID

- Raw Data
- Transmitter Serial
- Signal Strength (dB)
- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP

#### DET_FILTER, n = 3

- Filter Name
- Details

- Rejected Detections

#### DET_SENS, n = 25

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID
- Raw Data
- Transmitter Serial
- Signal Strength (dB)

- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP
- Transmitter Type
- Sensor Function
- Sensor Value
- Sensor Unit
- Sensor Precision

#### DIAG, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Temperature (deg C)
- Noise Mean (mV)
- Tilt (deg)
- Depth (m)
- PPM Pings
- PPM Detections

#### DIAG_FAST, n = 10

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Ambient Temperature (deg C)
- Noise (mV)
- Tilt (deg)
- Depth (m)

#### DIAG_VR2W, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Pings
- Detections

#### DIAG_VR2W_INTERIM, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Pings
- Detections

#### EVENT, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Type

- Subtype
- Description
- Values
- Latitude
- Longitude
- GPS HDOP

#### EVENT_FAULT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Fault Importance
- Fault Code
- Fault Description

#### EVENT_INIT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- External Time Zone
- Firmware Version

#### EVENT_OFFLOAD, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- External Time (UTC)

- External Time Zone
- HR Total Accepted Detections
- PPM Total Accepted Detections
- Memory Remaining (%)
- Battery Remaining (%)
- Original File

#### HEALTH_VR2W, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Memory Remaining (%)
- RTC Time

#### TEMP, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Ambient (deg C)
- Internal (deg C)

#### TEMP_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Min (deg C)
- Ambient Max (deg C)
- Ambient Mean (deg C)
- Sample Count
- Accumulation Period (s)

### VR2W180 VRL, n = 26

#### ATTITUDE, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Tilt (deg)

#### BATTERY, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Battery Position
- Battery Type
- Battery Serial Number
- Battery Voltage (V)
- Battery Remaining (%)

#### CFG_CHANNEL, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Channel
- Detection Type
- Frequency (kHz)
- Blanking (ms)
- Map ID
- Coding ID

#### CFG_STATION, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Station Name
- Latitude (deg)
- Longitude (deg)

#### CFG_STUDY, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Description

#### CFG_TRANSMITTER, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Transmission Type
- Full ID
- ID
- Power Level
- Min Delay (s)
- Max Delay (s)

#### CLOCK_REF, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- External Time (UTC)
- External Difference (s)
- Source

#### CLOCK_SET, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- Prior Difference (s)
- Source

#### DATA_ERROR, n = 5

- Type
- Error
- Page

- Offset
- Description

#### DATA_SOURCE_FILE, n = 5

- File Name
- UUID
- Type

- Size
- State

#### DEPTH, n = 7

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Depth (m)

#### DEPTH_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Depth Min (m)
- Depth Max (m)
- Depth Mean (m)
- Sample Count
- Accumulation Period (s)

#### DET, n = 20

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID

- Raw Data
- Transmitter Serial
- Signal Strength (dB)
- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP

#### DET_FILTER, n = 3

- Filter Name
- Details

- Rejected Detections

#### DET_SENS, n = 25

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Channel
- Detection Type
- Full ID
- ID
- Raw Data
- Transmitter Serial
- Signal Strength (dB)

- Noise (dB)
- Gain (dB)
- Quality Score
- Station Name
- Latitude
- Longitude
- GPS HDOP
- Transmitter Type
- Sensor Function
- Sensor Value
- Sensor Unit
- Sensor Precision

#### DIAG, n = 12

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Temperature (deg C)
- Noise Mean (mV)
- Tilt (deg)
- Depth (m)
- PPM Pings
- PPM Detections

#### DIAG_FAST, n = 10

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Ambient Temperature (deg C)
- Noise (mV)
- Tilt (deg)
- Depth (m)

#### DIAG_VR2W, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Pings
- Detections

#### DIAG_VR2W_INTERIM, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Pings
- Detections

#### EVENT, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- Type

- Subtype
- Description
- Values
- Latitude
- Longitude
- GPS HDOP

#### EVENT_FAULT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Fault Importance
- Fault Code
- Fault Description

#### EVENT_INIT, n = 9

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model

- Serial Number
- Prior Device Time (UTC)
- External Time Zone
- Firmware Version

#### EVENT_OFFLOAD, n = 13

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number
- External Time (UTC)

- External Time Zone
- HR Total Accepted Detections
- PPM Total Accepted Detections
- Memory Remaining (%)
- Battery Remaining (%)
- Original File

#### HEALTH_VR2W, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Memory Remaining (%)
- RTC Time

#### TEMP, n = 8

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)

- Model
- Serial Number
- Ambient (deg C)
- Internal (deg C)

#### TEMP_STATS, n = 11

- Device Time (UTC)
- Time
- Time Offset (h)
- Time Correction (s)
- Model
- Serial Number

- Ambient Min (deg C)
- Ambient Max (deg C)
- Ambient Mean (deg C)
- Sample Count
- Accumulation Period (s)
