#' @include utils-pipe.R
#' @importFrom dplyr select
#' @importFrom tidyr pivot_longer
#' @importFrom ggplot2 ggplot aes geom_tile scale_fill_discrete
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
  d <- prep_table() %>%
    select(name, occ_acquisition:metadata) %>%
    pivot_longer(cols = occ_acquisition:metadata, names_to = "category")
  ggplot(d, aes(x = name, y = category, fill = value)) +
    geom_tile() +
    scale_fill_discrete(type = c("white", "gray30"))
}
