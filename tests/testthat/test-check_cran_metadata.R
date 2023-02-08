test_that("check_cran_metadata", {
  suppressWarnings(testthat::expect_error(check_cran_metadata()))
})
