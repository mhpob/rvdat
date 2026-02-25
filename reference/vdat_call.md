# Interface directly with `vdat.exe`.

Low-level interface to `vdat.exe`, wherein arguments are passed directly
to `vdat.exe`. Arguments should be character vectors, each element being
one command.

## Usage

``` r
vdat_call(what = "--help", print = TRUE, pass_error = FALSE, ...)
```

## Arguments

- what:

  arguments passed to `vdat.exe`. Defaults to `--help`.

- print:

  logical. Defaults to TRUE. Print the output to console?

- pass_error:

  logical. Defaults to FALSE. Capture and pass any error through to the
  user?

- ...:

  arguments passed to
  [`sys::exec_internal`](https://jeroen.r-universe.dev/sys/reference/exec.html).

## Examples

``` r
if (FALSE) { # \dontrun{

# Check the help documentation
vdat_call()

#
vdat_call("--help")

# Inspect a file; multiple arguments are passed in a character vector
vdat_call(c("inspect", "FILENAME"))
} # }
```
