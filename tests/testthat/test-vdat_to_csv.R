# source('tests/testthat/setup-testfiles.R')

# HR vdat
hr <- grep(
  "HR.*\\.vdat$",
  testfiles,
  value = TRUE
)

# VR2AR vrl
vr2ar <- grep(
  "VR2AR.*\\.vrl",
  testfiles,
  value = TRUE
)

# VR2Tx vrl
vr2tx <- grep(
  "VR2Tx.*\\.vrl",
  testfiles,
  value = TRUE
)

# VR2W 69k vrl
vr2w69 <- grep(
  "VR2W_.*\\.vrl",
  testfiles,
  value = TRUE
)

# VR2W 180k vrl
vr2w180 <- grep(
  "VR2W180.*\\.vrl",
  testfiles,
  value = TRUE
)




test_that("creates correct messages", {
  skip_on_ci()

  td <- tempdir()

  # HR vdat
  ## First file's message
  expect_message(
    vdat_to_csv(hr, outdir = td),
    "\\d\\.csv"
  )

  ## Second file's message
  expect_message(
    vdat_to_csv(hr, outdir = td),
    "\\]\\.csv"
  )


  # VR2AR vrl
  ## First
  expect_message(
    vdat_to_csv(vr2ar, outdir = td),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_csv(vr2ar, outdir = td),
    "\\]\\.csv"
  )


  # VR2Tx vrl
  ## First
  expect_message(
    vdat_to_csv(vr2tx, outdir = td),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_csv(vr2tx, outdir = td),
    "\\]\\.csv"
  )


  # VR2W 69k vrl
  ## First
  expect_message(
    vdat_to_csv(vr2w69, outdir = td),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_csv(vr2w69, outdir = td),
    "\\]\\.csv"
  )


  # VR2W 180k vrl
  ## First
  expect_message(
    vdat_to_csv(vr2w180, outdir = td),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_csv(vr2w180, outdir = td),
    "\\]\\.csv"
  )


  # Clean up
  unlink(
    list.files(td, pattern = '\\.csv$', full.names = TRUE)
  )
})




test_that('errors if multiple files are provided', {

  expect_error(
    vdat_to_csv(
      grep(
        "VR2W.*\\.vrl",
        testfiles,
        value = TRUE
      )
    ),
    'Only one file is allowed at a time\\.'
  )

  expect_error(
    vdat_to_csv(
      grep(
        "VR2W.*\\.vrl",
        testfiles,
        value = TRUE
      )
    ),
    'Consider using lapply\\(vdata_files, vdat_to_csv\\)\\.'
  )

})




test_that('warns if filter is provided', {
  skip_on_ci()

  td <- tempdir()

  warn_should_be <-
    "The \"filter\" argument is currently unsupported and has been ignored\\."

  # HR vdat
  expect_warning(
    vdat_to_csv(hr, outdir = td,
                filter = 'abc123'),
    warn_should_be
  )


  # VR2AR vrl
  expect_warning(
    vdat_to_csv(vr2ar, outdir = td,
                filter = 'abc123'),
    warn_should_be
  )


  # VR2Tx vrl
  expect_warning(
    vdat_to_csv(vr2tx, outdir = td,
                filter = 'abc123'),
    warn_should_be
  )


  # VR2W 69k vrl
  expect_warning(
    vdat_to_csv(vr2w69, outdir = td,
                filter = 'abc123'),
    warn_should_be
  )


  # VR2W 180k vrl
  expect_warning(
    vdat_to_csv(vr2w180, outdir = td,
                filter = 'abc123'),
    warn_should_be
  )

  # Clean up
  unlink(
    list.files(td, pattern = '\\.csv$', full.names = TRUE)
  )
})
