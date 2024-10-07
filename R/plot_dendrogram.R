#' @include utils-pipe.R
#' @importFrom stats dist as.dist hclust
#' @importFrom dplyr select
#' @importFrom factoextra fviz_dend
#' @import igraph
NULL


#' Plot a dendrogram
#'
#' This function plot a dendrogram figure based on the similarity between SDM
#' packages.
#'
#' @param table Tibble: A \code{tibble} with columns as package capacities and
#'   rows as packages. This can be created using \code{\link{prep_table}}.
#' @param diff_method Character: Method for calculating distances between
#'   packages. See \code{\link[stats]{dist}}.
#' @param dendro_method Character: Method for calculating clusters to create the
#'   dendrogram. See \code{\link[stats]{hclust}}.
#' @param return_clust bool. Should the cluster figure be added.
#' @param ... Arguments to pass to \code{\link{fviz_dend}}. See \code{Examples}
#'   for suggestions.
#'
#' @returns A \pkg{ggplot2} object (class \code{gg} and \code{ggplot}).
#'
#' @examples
#' \donttest{
#' library(dplyr)
#' d <- prep_table(where = "online") %>%
#'   filter(
#'     name != "rgbif",
#'     name != "ibis.iSDM",
#'     name != "dismo"
#'   ) %>%
#'   select(
#'     -mod_mechanistic,
#'     -mod_multispecies
#'   )
#' plot_dendrogram(
#'   d,
#'   k = 5,
#'   cex = 0.7,
#'   diff_method = "binary",
#'   horiz = TRUE,
#'   main = ""
#' )
#' }
#'
#' @export
#'
plot_dendrogram <- function(table,
                            diff_method = "binary",
                            dendro_method = "average",
                            return_clust = FALSE,
                            ...) {
  name <- title <- version <- repository <- NULL
  manuscript_doi <- maintainer <- NULL

  scores <- dplyr::select(
    table, -name, -title, -version, -repository,
    -manuscript_doi, -maintainer
  )

  # calculate differences and add package names
  diffs <- dist(scores, method = diff_method)
  diffs <- as.matrix(diffs)
  rownames(diffs) <- colnames(diffs) <- table$name
  diffs <- as.dist(diffs)

  # basic cluster
  clust <- hclust(diffs, method = dendro_method)
  if (return_clust == TRUE) {
    return(clust)
  }

  # plot
  graph <- suppressWarnings(factoextra::fviz_dend(
    x = clust,
    ...
  ))

  return(graph)
}
