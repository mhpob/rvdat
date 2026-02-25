# Write the location of `vdat.exe` to the environmental variables.

Write the location of `vdat.exe` to the environmental variables.

## Usage

``` r
vdat_here(here = Sys.getenv("RVDAT_EXE"), wine = Sys.getenv("RVDAT_WINE_EXE"))
```

## Arguments

- here:

  location of `vdat.exe`, either a full path name or relative to the
  current working directory. Defaults to the value of the "VDAT_EXE"
  environment variable

- wine:

  location of `wine.exe`, either a full path name or relative to the
  current working directory. Defaults to the value of the "VDAT_EXE"
  environment variable. Only used on Linux or Mac operating systems.

## Examples

``` r
if (FALSE) { # all(skip_example_on_ci(), skip_example_on_runiverse())

# Auto-find vdat:
vdat_here()

# Provide an explicit location:
vdat_here("c:/program files/innovasea/fathom connect/vdat.exe")
}
```
