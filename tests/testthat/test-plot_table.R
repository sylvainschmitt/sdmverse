test_that("plot_table", {
  expect_s3_class(prep_table() %>% plot_table(), "ggplot")
})
