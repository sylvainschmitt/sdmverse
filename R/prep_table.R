#' @include utils-pipe.R
#' @include list_packages.R
#' @importFrom dplyr select
NULL

#' Prepare sdmverse packages table
#
#' This function prepare sdmverse packages table.
#'
#' @param where char. Where to download the packages metadata,
#'  either 'locally' with the package or 'online' in the GitHub repository.
#'
#' @return sdmverse packages metadata.
#'
#' @examples
#' \donttest{
#' prep_table()
#' }
#'
#' @export
#'
prep_table <- function(where = "online") {
  author <- cran <- repository <- description <- manuscript_citation <- NULL
  list_packages(where = where) %>%
    select(-author, -cran, repository, -description, -manuscript_citation) %>%
    return()
}
