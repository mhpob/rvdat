test_that("vdat_version works", {
  expect_output(
    vdat_version_result <- vdat_version(),
    "^vdat.*release$"
  )

  expect_invisible(vdat_version(print = FALSE))

  expect_named(vdat_version_result, c("status", "stdout", "stderr"))
  expect_type(vdat_version_result, "list")
  expect_s3_class(vdat_version_result, "vdat_resp")
  expect_length(vdat_version_result, 3)
})
