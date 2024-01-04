#'

to_csv <- function(file, outdir = getwd()){
  # v2csv('c:/users/darpa2/analysis/chesapeake-backbone/embargo/raw/VR2AR_546323_20231012_1.vrl')

  ## single Fathom CSV file
  #   vdat convert --format=csv.fathom <input_file>
  ## folder of split Fathom CSV files
  # vdat convert --format=csv.fathom.split <input_file>


  vdat_loc <- rvdat:::check_vdat_location()

  shell_out <- sys::exec_internal(
    cmd = vdat_loc,
    args = c(
      'convert',
      '--format=csv.fathom',
      file,
      paste0('--output=', outdir)
    )
  )
}
