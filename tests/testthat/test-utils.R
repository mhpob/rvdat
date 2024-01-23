test_that("", {
  skip_on_ci()

  expect_true(
    skip_example_on_ci()
  )
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
