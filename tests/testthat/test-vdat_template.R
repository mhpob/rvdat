test_that("error if not csv", {
  expect_error(
    vdat_template(format = 'json'),
    '\'arg\' should be "csv.fathom"'
  )
})

test_that("partial matching works", {
  expect_equal(
    vdat_template(),
    vdat_template(format = 'csv')
  )
})

test_that("print works", {
  expect_output(
    vdat_template(print = TRUE)
  )
})

test_that("correct types", {
  template <- vdat_template()

  expect_type(template, 'list')

  expect_length(template, 45)
  expect_named(
    template,
    c("ATTITUDE_DESC", "BATTERY_DESC", "CFG_CHANNEL_DESC", "CFG_RECEIVER_HR3_DESC",
      "CFG_STATION_DESC", "CFG_STUDY_DESC", "CFG_TRANSMITTER_DESC", "CLOCK_REF_DESC",
      "CLOCK_SET_DESC", "DATA_ERROR_DESC", "DATA_SOURCE_FILE_DESC", "DEPTH_DESC",
      "DEPTH_STATS_DESC", "DET_DESC", "DET_HTI_DESC", "DET_FILTER_DESC",
      "DET_SENS_DESC", "DIAG_DESC", "DIAG_FAST_DESC", "DIAG_HR2_DESC",
      "DIAG_HR3_DESC", "DIAG_VR2W_DESC", "DIAG_VR2W_INTERIM_DESC", "DIAG_VR2AR_DESC",
      "DIAG_VR2AR_INTERIM_DESC", "DIAG_VR2TX_DESC", "DIAG_VR2TX_INTERIM_DESC",
      "DIAG_VR4_DESC", "EVENT_DESC", "EVENT_FAULT_DESC", "EVENT_INIT_DESC",
      "EVENT_OFFLOAD_DESC", "HEALTH_HR2_DESC", "HEALTH_HR3_DESC", "HEALTH_VR2AR_DESC",
      "HEALTH_VR2TX_DESC", "HEALTH_VR2W_DESC", "HEALTH_VR4_DESC", "NOISE_DESC",
      "NOISE_STATS_VR2AR_DESC", "NOISE_STATS_VR2TX_DESC", "PING_DESC", "TEMP_DESC",
      "TEMP_STATS_DESC", "XPND_EVENT_DESC")
  )
})
