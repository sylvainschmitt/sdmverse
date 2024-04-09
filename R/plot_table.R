#' @include utils-pipe.R
#' @importFrom dplyr select
#' @importFrom tidyr pivot_longer
#' @importFrom ggplot2 ggplot aes geom_tile scale_fill_discrete theme
#'   coord_equal element_text theme_bw element_blank scale_x_discrete
NULL

#' Plot sdmverse table
#'
#' @param d data frame. sdmverse table built with prep_table().
#' @param pkg_order char. Order of packages to plot.
#' @param pkg_cols char. Color for packages plot.
#' @param remove_empty_cats bool. Remove empty categories.
#'
#' @return Plot package characteristics from the sdmverse table using ggplot.
#'
#' @examples
#' \dontrun{
#' prep_table() %>%
#'   plot_table()
#' }
#'
#' @export
#'
plot_table <- function(
    d,
    pkg_order = NULL,
    pkg_cols = NULL,
    remove_empty_cats = FALSE) {
  name <- occ_acquisition <- metadata <- category <- value <- NULL
  `occurrence data acquisition` <- `metadata tools` <- NULL # nolint
  lu <- c(
    occ_acquisition = "occurrence data acquisition",
    occ_cleaning = "occurrence data cleaning",
    data_integration = "data integration",
    env_collinearity = "environmental variable collinearity",
    env_process = "environmental variable processing",
    bias = "addressing data biases",
    study_region = "defining model training extent",
    backg_sample = "background data sampling",
    data_partitioning = "occurrence data partitioning",
    mod_fit = "model fitting",
    mod_tuning = "model tuning",
    mod_ensemble = "model ensembles",
    mod_stack = "model stacking",
    mod_evaluate = "model evaluation",
    mod_multispecies = "multispecies modeling",
    mod_mechanistic = "mechanistic modeling",
    pred_general = "model prediction",
    pred_extrapolation = "model extrapolation tools/plots",
    pred_inspect = "model behavior inspection/plots",
    post_processing = "using predictions as analysis inputs",
    gui = "graphical user interface",
    metadata = "metadata tools"
  )
  dd <- dplyr::select(d, name, occ_acquisition:metadata)
  names(dd)[-1] <- lu[names(dd)[-1]]

  if (remove_empty_cats) {
    whichEmpty <- which(colSums(dd[, -1]) == 0) #nolint
    if (length(whichEmpty) > 0) {
      dd <- dd[, -whichEmpty + 1]
    }
  }
  dd <- dd %>%
    tidyr::pivot_longer(
      cols = `occurrence data acquisition`:`metadata tools`,
      names_to = "category"
    ) %>%
    dplyr::mutate(category = gsub("_", " ", category))

  if (!is.null(pkg_order)) {
    dd$name <- factor(dd$name, levels = pkg_order)
  }

  d_n <- rev(unique(dd$category))
  dd$category <- factor(dd$category, levels = d_n)

  ggplot(dd, aes(y = category, x = name, fill = value)) +
    geom_tile() +
    scale_fill_discrete(
      guide = "none",
      type = c("white", "gray30")
    ) +
    coord_equal() +
    theme_bw() +
    theme(
      axis.text.x = element_text(color = pkg_cols, angle = 90, size = 12),
      axis.text.y = element_text(size = 12),
      axis.title = element_blank()
    ) +
    scale_x_discrete(position = "top")
}
