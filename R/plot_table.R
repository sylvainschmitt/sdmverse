#' @include utils-pipe.R
#' @importFrom dplyr select
#' @importFrom tidyr pivot_longer
#' @importFrom ggplot2 ggplot aes geom_tile scale_fill_discrete theme
#'   coord_equal element_text theme_bw element_blank scale_x_discrete
NULL

#' Plot sdmverse table
#'
#' @param d data frame. sdmverse table built with prep_table()
#'
#' @param type char. Type of ggplot to make.
#'
#' @param removeEmptyCats bool. Remove empty categories (TRUE/FALSE).
#'
#' @return Plot package characteristics from the sdmverse table using ggplot.
#'
#' @examples
#' \dontrun{
#' plot_table()
#' }
#'
#' @export
#'
plot_table <- function(d, type = "tile", pkgOrder = NULL, pkgCols = NULL, removeEmptyCats = FALSE) {
  name <- occ_acquisition <- metadata <- category <- value <- NULL
  dd <- d %>%
    dplyr::select(name, occ_acquisition:metadata) %>%
    dplyr::rename("occurrence data acquisition" = occ_acquisition,
           "occurrence data cleaning" = occ_cleaning,
           "data integration" = data_integration,
           "environmental variable collinearity" = env_collinearity,
           "environmental variable processing" = env_process,
           "addressing data biases" = bias,
           "defining model training extent" = study_region,
           "background data sampling" = backg_sample,
           "occurrence data partitioning" = data_partitioning,
           "model fitting" = mod_fit,
           "model tuning" = mod_tuning,
           "model ensembles" = mod_ensemble,
           "model stacking" = mod_stack,
           "model evaluation" = mod_evaluate,
           "multispecies modeling" = mod_multispecies,
           "mechanistic modeling" = mod_mechanistic,
           "model prediction" = pred_general,
           "model extrapolation tools/plots" = pred_extrapolation,
           "model behavior inspection/plots" = pred_inspect,
           "using predictions as analysis inputs" = post_processing,
           "graphical user interface" = gui,
           "metadata tools" = metadata)
  if(removeEmptyCats == TRUE) {
    emptyCols <- which(colSums(dd[,-1]) == 0) + 1
    dd <- dd[,-emptyCols]
  }
  dd <- dd %>%
    tidyr::pivot_longer(cols = `occurrence data acquisition`:`metadata tools`, names_to = "category") %>%
    dplyr::mutate(category = gsub("_", " ", category))

  if(!is.null(pkgOrder)) {
    dd$name <- factor(dd$name, levels = pkgOrder)
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
      axis.text.x = element_text(color = pkgCols, angle = 90, size = 12),
      axis.text.y = element_text(size = 12),
      axis.title = element_blank()
    ) +
    scale_x_discrete(position = "top")
}
