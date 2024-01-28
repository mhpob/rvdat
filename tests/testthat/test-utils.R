test_that("example CI skipper works on CI.", {
  skip_if_not(
    testthat:::on_ci(),
    'Not on CI.'
  )

  #should return F if on CI, T if local/RUniverse
  expect_false(
    skip_example_on_ci()
  )
})

test_that("example CI skipper works when not on CI.", {
  skip_if(
    testthat:::on_ci(),
    'On CI.'
  )

  #should return F if on CI, T if local/RUniverse
  expect_true(
    skip_example_on_ci()
  )
})




test_that("example RUniverse skipper works on RUniverse.", {
  skip_if_not(
    is.na(Sys.getenv("MY_UNIVERSE", unset = NA)),
    "Not on RUniverse."
  )

  # should return F if on RU, T if local/CI
  expect_false(
    skip_example_on_runiverse()
  )
})

test_that("example RUniverse skipper works when not on RUniverse.", {
  skip_if(
    is.na(Sys.getenv("MY_UNIVERSE", unset = NA)),
    "On RUniverse."
  )

  # should return F if on RU, T if local/CI
  expect_true(
    skip_example_on_runiverse()
  )
})



test_that("errors error", {
  expect_error(
    error_generic_call('abc'),
    'Call to VDAT failed\\.'
  )
  expect_error(
    error_generic_call('abc'),
    'Is abc a valid command\\?'
  )


  expect_error(
    error_too_many_files(),
    'Only one file is allowed at a time\\.'
  )
  expect_error(
    error_too_many_files(),
    'Consider using lapply\\(vdata_files, vdat_to_csv\\)\\.'
  )


  expect_error(
    error_convert(
      shell_out = list(stderr = charToRaw('some_shell_error')),
      vdata_file = 'some_bad_vdat_file'),
    'Call to VDAT failed:'
  )
  expect_error(
    error_convert(
      shell_out = list(stderr = charToRaw('some_shell_error')),
      vdata_file = 'some_bad_vdat_file'),
    'some_shell_error'
  )
  expect_error(
    error_convert(
      shell_out = list(stderr = charToRaw('some_shell_error')),
      vdata_file = 'some_bad_vdat_file'),
    'Is the location of some_bad_vdat_file correct\\?'
  )
})
