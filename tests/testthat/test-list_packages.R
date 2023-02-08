test_that("list_packages", {
  expect_s3_class(list_packages(), "tbl")
})
