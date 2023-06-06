#' Create a dendrogram figure showing similarity between SDM packages
#'
#' This function creates a dendrogram figure based on the similarity between SDM packages.
#'
#' @param table Tibble: A \code{tibble} with columns as package capacities and rows as packages. This can be created using \code{\link{prep_table}}.
#' @param diff_method Character: Method for calculating distances between packages. See \code{\link[stats]{dist}}.
#' @param dendro_method Character: Method for calculating clusters to create the dendrogram. See \code{\link[stats]{hclust}}.
#' @param ... Arguments to pass to \code{\link{fviz_dend}}. See \code{Examples} for suggestions.
#'
#' @returns A \pkg{ggplot2} object (class \code{gg} and \code{ggplot}).
#'
#' @examples
#' 
#' library(ggplot2)
#' 
#' # fetch data
#' table <- prep_table()
#' 
#' # a rectangular dendrogram
#' rect <- make_dendrogram_figure(
#'    table = table,
#'    k = nrow(table),
#'    k_colors = 'jco',
#'    rect = TRUE, 
#'    rect_border = 'jco', 
#'    rect_fill = TRUE,
#'    type = 'rectangle',
#'    horiz = TRUE,
#'    main = 'Species distribution modeling software',
#'    sub = date()
#' )
#'
#' rect
#'
#' # a phylogenic plot
#' phylo <- make_dendrogram_figure(
#'    table = table,
#'    k = nrow(table),
#'    k_colors = 'jco',
#'    rect = TRUE, 
#'    rect_border = 'jco', 
#'    type = 'phylogenic',
#'    repel = TRUE,
#'    main = 'Species distribution modeling software',
#'    sub = date()
#' )
#' 
#' phylo
#' 
#' @export
make_dendrogram_figure <- function(
	table,
	diff_method = 'euclidean',
	dendro_method = 'average',
	...
) {

	# ignore these columns when calculating differences between packages
	# NB would be better to not hard-code these!
	ignores <- c('name', 'title', 'version', 'repository', 'manuscript_doi', 'maintainer')
	scores <- table[ , !(names(table) %in% ignores)]

	# calculate differences and add package names
	diffs <- stats::dist(scores, method = diff_method)
	diffs <- as.matrix(diffs)
	rownames(diffs) <- colnames(diffs) <- table$name
	diffs <- stats::as.dist(diffs)
	
	# basic cluster
	clust <- stats::hclust(diffs, method = dendro_method)

	# plot
	graph <- factoextra::fviz_dend(
		x = clust,
		...
	)

	graph

} # EOF
