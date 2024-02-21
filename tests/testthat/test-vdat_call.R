cat("\n\n", Sys.getenv("VDAT_EXE"), "\n\n\n")
test_that("vdat_call gives expected results", {
  skip_on_cran()
  skip_on_os(c("mac", "solaris"))

  expect_output(
    vdat_call_result <- vdat_call(),
    "VDAT File Tool"
  )

  expect_invisible(vdat_call(print = FALSE))

  expect_named(vdat_call_result, c("status", "stdout", "stderr"))
  expect_type(vdat_call_result, "list")
  expect_s3_class(vdat_call_result, "vdat_resp")
  expect_length(vdat_call_result, 3)
})

test_that("Basic commands work", {
  skip_on_cran()
  skip_on_os(c("mac", "solaris"))

  expect_equal(vdat_call(print = FALSE)$status, 0)
})

test_that("Bad commands don't work", {
  skip_on_cran()
  skip_on_os(c("mac", "solaris"))

  expect_error(vdat_call("help"))
  expect_error(vdat_call("--convert"))
})
