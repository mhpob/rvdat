test_that("vdat_call gives expected results", {
  skip_on_cran()

  expect_output(
    vdat_call_result <- vdat_call(),
    "Usage.*Options.*Subcommands"
  )

  expect_invisible(vdat_call(print = FALSE))

  expect_named(vdat_call_result, c("status", "stdout", "stderr"))
  expect_type(vdat_call_result, "list")
  expect_s3_class(vdat_call_result, "vdat_resp")
  expect_length(vdat_call_result, 3)
})

test_that("Basic commands work", {
  skip_on_cran()

  expect_equal(vdat_call(print = FALSE)$status, 0)
})

test_that("Bad commands don't work", {
  skip_on_cran()

  expect_error(vdat_call("help"))
  expect_error(vdat_call("--convert"))
})

test_that("Errors can be passed to higher-level functions", {
  skip_on_cran()

  expect_no_error(
    err <- vdat_call("gibberish", pass_error = TRUE)
  )

  expect_equal(err$status, 1)
})

test_that("Warns about Wine mode.", {
  skip_on_os(c("mac", "windows", "solaris"))

  skip_if(
    Sys.which("wine") == "",
    message = "Wine not installed"
  )

  expect_message(
    vdat_call(print = FALSE),
    "Using Wine mode: EXPERIMENTAL!",
    fixed = TRUE
  )
})
