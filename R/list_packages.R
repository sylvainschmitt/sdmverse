#' @include utils-pipe.R
#' @importFrom gh gh
#' @importFrom yaml read_yaml
#' @importFrom tibble as_tibble
#' @importFrom dplyr bind
NULL

#' List sdmverse packages
#
#' This function list sdmverse pacakges from online yamls
#'
#' @examples
#' \dontrun{
#'   list_packages()
#' }
#'
#' @export
#'
list_packages <- function(){
  request <- gh("GET /repos/sylvainschmitt/sdmverse/git/trees/main?recursive=1")
  files <- vapply(request$tree, "[[", "", "path")
  packages <- grep("inst/extdata/packages/", files, value = TRUE, fixed = TRUE)
  packages <- lapply(packages, function(p) paste0("https://raw.githubusercontent.com/sylvainschmitt/sdmverse/main/", p))
  lapply(packages, read_yaml) %>%
    lapply(as_tibble) %>%
    bind_rows() %>%
    return()
}
