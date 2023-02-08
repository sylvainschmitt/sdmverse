test_that("check_cran_metadata", {
  suppressWarnings(testthat::expect_warning(check_cran_metadata()))
})
