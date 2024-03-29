% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vdat_call.R
\name{vdat_call}
\alias{vdat_call}
\title{Interface directly with \code{vdat.exe}.}
\usage{
vdat_call(what = "--help", print = TRUE, pass_error = FALSE, ...)
}
\arguments{
\item{what}{arguments passed to \code{vdat.exe}. Defaults to \code{--help}.}

\item{print}{logical. Defaults to TRUE. Print the output to console?}

\item{pass_error}{logical. Defaults to FALSE. Capture and pass any error
through to the user?}

\item{...}{arguments passed to \code{\link[sys:exec]{sys::exec_internal}}.}
}
\description{
Low-level interface to \code{vdat.exe}, wherein arguments are passed directly
to \code{vdat.exe}. Arguments should be character vectors, each element being
one command.
}
\examples{
\dontrun{

# Check the help documentation
vdat_call()

#
vdat_call("--help")

# Inspect a file; multiple arguments are passed in a character vector
vdat_call(c("inspect", "FILENAME"))
}

}
