test_that("fails if directory is provided", {
  err <- expect_error(
    vdat_here("/")
  )

  expect_equal(
    err$message, c("x" = "Please include the file name in the path.")
  )

  expect_type(err, "list")
  expect_s3_class(err, c("rlang_error", "error", "condition"))
})


test_that("Find vdat in the default Windows location", {
  skip_on_os(c("mac", "linux", "solaris"))
  skip_on_cran()

  here <- vdat_here()

  expect_type(here, "character")

  expect_match(here, "C:/Program Files/Innovasea/Fathom Connect/vdat.exe")
})


test_that("custom location works", {
  skip_on_cran()

  file.copy(Sys.getenv("VDAT_EXE"), tempdir())

  expect_equal(
    vdat_here(normalizePath(file.path(tempdir(), "vdat.exe"))),
    normalizePath(file.path(tempdir(), "vdat.exe"))
  )
})




# test_that("fails with no exe", {
#   # Log initial env. var.
#   vdat_env <- Sys.getenv("VDAT_EXE")
#
#   err <- expect_error(
#     vdat_here("abc_123")
#   )
#
#   expect_equal(
#     err$message, c("x" = "There is no file at this location.")
#   )
#
#   expect_type(err, "list")
#   expect_s3_class(err, c("rlang_error", "error", "condition"))
#
#   # Restore env. var.
#   Sys.setenv(VDAT_EXE = vdat_env)
# })
