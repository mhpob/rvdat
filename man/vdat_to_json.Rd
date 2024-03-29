% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vdat_to_json.R
\name{vdat_to_json}
\alias{vdat_to_json}
\title{Convert VDAT file to JSON}
\usage{
vdat_to_json(
  vdata_file,
  outdir = getwd(),
  time_corrected = FALSE,
  quiet = FALSE,
  filter = NULL
)
}
\arguments{
\item{vdata_file}{path of VDAT file to convert to JSON}

\item{outdir}{output directory for the created JSON. Defaults to the
current working directory.}

\item{time_corrected}{logical. Do you want to apply the default time correction?}

\item{quiet}{logical, defaults to FALSE. Suppress messages?}

\item{filter}{character, defaults to NULL and is currently ignored with a
warning. When implemented, filtering via vdat.exe will only be available for
HR3 receivers.}
}
\description{
Convert VDAT file to JSON
}
