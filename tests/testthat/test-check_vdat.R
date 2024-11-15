test_that("check_vdat alerts if no vdat.exe", {
  skip_on_cran()

  vdat_here() |>
    suppressMessages()

  expect_vector(check_vdat_location())

  vdat_loc <- Sys.getenv("VDAT_EXE")
  Sys.setenv("VDAT_EXE" = "")

  expect_error(check_vdat_location())

  Sys.setenv("VDAT_EXE" = vdat_loc)
})
