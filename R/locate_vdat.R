#' Locate `vdata.exe` on comuputer
#'
#' @param file location of VRL file(s) to convert to CSV.
#' @param outdir output directory for the created CSV files. Defaults to the
#'  current working directory.
#'

#' @export
locate_vdat <- function(sys = NULL, version = NULL) {

  if(is.null(version)) {
    version <- "vdat-7.0.0-20231107"
  }
  if(is.null(sys)) {
    sys <- "Linux-x86_64"
  }
  vdat_name <- "vdat.exe"
  fs::path_abs(path = paste("../vdat-working-group-master/releases", version,
                            sys, vdat_name, sep = "/"))
  # list.files(paste("../vdat-working-group-master/releases", version, sys, sep = "/"),
  #            recursive = TRUE,
  #            full.names = TRUE,
  #            include.dirs = TRUE)

  # Sys.glob("vdat.exe")
}
list.dirs()
fs::path_abs(path = paste("../vdat-working-group-master/releases", version,
                          sys, sep = "/"))
ls()
fs::dir_ls(
  path = c("C:/", "E:/"),
           type = "directory", , recurse = TRUE)


list.dirs(path = "../vdat-working-group-master/releases")
