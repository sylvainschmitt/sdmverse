test_that("plot_table", {
  expect_s3_class(plot_dendrogram(prep_table()), "ggplot")
})
