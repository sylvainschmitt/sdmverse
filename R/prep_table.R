#' @include utils-pipe.R
#' @include list_packages.R
#' @importFrom dplyr select
NULL

#' Prepare sdmverse packages table
#
#' This function prepare sdmverse packages table.
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
prep_table <- function() {
  author <- cran <- github <- description <- NULL
  list_packages() %>%
    select(-author, -cran, -github, -description) %>%
    return()
}
