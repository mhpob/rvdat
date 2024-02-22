test_that("vdat_to_folder creates correct messages", {
  skip_on_cran()

  # HR vdat
  hr <- grep(
    "HR.*\\.vdat$",
    testfiles,
    value = TRUE
  )

  ## First file's message
  expect_message(
    vdat_to_folder(hr),
    "\\d\\.csv"
  )

  ## Second file's message
  expect_message(
    vdat_to_folder(hr),
    "\\]\\.csv"
  )

  # VR2AR vrl
  vr2ar <- grep(
    "VR2AR.*\\.vrl",
    testfiles,
    value = TRUE
  )

  ## First
  expect_message(
    vdat_to_folder(vr2ar),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_folder(vr2ar),
    "\\]\\.csv"
  )

  # VR2Tx vrl
  vr2tx <- grep(
    "VR2Tx.*\\.vrl",
    testfiles,
    value = TRUE
  )

  ## First
  expect_message(
    vdat_to_folder(vr2tx),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_folder(vr2tx),
    "\\]\\.csv"
  )


  # VR2W 69k vrl
  vr2w69 <- grep(
    "VR2W_.*\\.vrl",
    testfiles,
    value = TRUE
  )

  ## First
  expect_message(
    vdat_to_folder(vr2w69),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_folder(vr2w69),
    "\\]\\.csv"
  )


  # VR2W 180k vrl
  vr2w180 <- grep(
    "VR2W180.*\\.vrl",
    testfiles,
    value = TRUE
  )

  ## First
  expect_message(
    vdat_to_folder(vr2w180),
    "\\d\\.csv"
  )
  ## Second
  expect_message(
    vdat_to_folder(vr2w180),
    "\\]\\.csv"
  )
})
