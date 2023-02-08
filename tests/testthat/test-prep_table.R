test_that("prep_table", {
  expect_s3_class(prep_table(), "tbl")
})
