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
#' }
#'
#' @export
#'
prep_table <- function(where = "online") {
  author <- cran <- repository <- description <- NULL
  manuscript_citation <- manuscript_doi <- NULL
  list_packages(where = where) %>%
    select(
      -author, -cran, -repository, -description,
      -manuscript_citation, -manuscript_doi
    ) %>%
    return()
}
