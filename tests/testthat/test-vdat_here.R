test_that("fails with no exe", {
  err <- expect_error(
    vdat_here("abc_123")
  )

  expect_equal(
    err$message, c("x" = "There is no file at this location.")
  )

  expect_type(err, "list")
  expect_s3_class(err, c("rlang_error", "error", "condition"))
})

test_that("succeed with exe", {
  skip_on_cran()

  cat("\n\n", Sys.getenv("VDAT_EXE"), "\n\n")

  if (file.exists("~/.Renviron")) readRenviron("~/.Renviron")

  suppressMessages(
    expect_no_error(
      vdat_here(Sys.getenv("VDAT_EXE"))
    )
  )

  message_out <- expect_message(
    vdat_here(Sys.getenv("VDAT_EXE"))
  )
  expect_true(grepl(Sys.getenv("VDAT_EXE"), message_out$message))
})
