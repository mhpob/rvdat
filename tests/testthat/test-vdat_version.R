test_that("vdat_version works", {
  skip_on_cran()

  version <- vdat_version()
  expect_type(version, "character")
  expect_match(version, "^vdat")
})
