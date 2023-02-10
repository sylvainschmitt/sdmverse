test_that("check_cran_metadata", {
  test <- suppressWarnings(tryCatch(check_cran_metadata()))
  res <- (inherits(test, "try-error") | test)
  expect_true(res)
})
