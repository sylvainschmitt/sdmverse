#' @include utils-pipe.R
#' @importFrom dplyr select
#' @importFrom tidyr pivot_longer
#' @importFrom ggplot2 ggplot aes geom_tile scale_fill_discrete theme
#'   coord_equal element_text theme_bw element_blank scale_x_discrete
NULL

#' Plot sdmverse table
#'
#' @param type char. Type of ggplot to make.
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
plot_table <- function(type = "tile") {
  name <- occ_acquisition <- metadata <- category <- value <- NULL
  d <- prep_table("locally") %>%
    select(name, occ_acquisition:metadata) %>%
    pivot_longer(cols = occ_acquisition:metadata, names_to = "category") %>%
    mutate(category = gsub("_", " ", category))
  d_n <- unique(d$category)
  d$category <- factor(d$category, levels = rev(d_n))
  ggplot(d, aes(y = category, x = name, fill = value)) +
    geom_tile() +
    scale_fill_discrete(
      guide = "none",
      type = c("white", "gray30")
    ) +
    coord_equal() +
    theme_bw() +
    theme(
      axis.text.x = element_text(face = "bold", angle = 90, size = 12),
      axis.text.y = element_text(size = 12),
      axis.title = element_blank()
    ) +
    scale_x_discrete(position = "top")
}
