test_that("fails with no exe", {
  # Log initial env. var.
  vdat_env <- Sys.getenv("VDAT_EXE")

  err <- expect_error(
    vdat_here("abc_123")
  )

  expect_equal(
    err$message, c("x" = "There is no file at this location.")
  )

  expect_type(err, "list")
  expect_s3_class(err, c("rlang_error", "error", "condition"))

  # Restore env. var.
  Sys.setenv(VDAT_EXE = vdat_env)
})


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

test_that("succeed with exe", {
  skip_on_cran()

  # if (file.exists("~/.Renviron")) readRenviron("~/.Renviron")

  suppressMessages(
    expect_no_error(
      vdat_here(Sys.getenv("VDAT_EXE"))
    )
  )

  message_out <- expect_message(
    vdat_here(
      normalizePath(Sys.getenv("VDAT_EXE"), winslash = "/")
    )
  )

  expect_true(
    grepl(
      normalizePath(Sys.getenv("VDAT_EXE"), winslash = "/"),
      message_out$message
    )
  )
})

test_that("Find vdat in the default Windows location", {
  skip_on_os(c("mac", "linux", "solaris"))
  skip_on_cran()

  vdat_here() |>
    expect_message("Looking for vdat in the typical locations.") |>
    expect_message("vdat is located at")
})
