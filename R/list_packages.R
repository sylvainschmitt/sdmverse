#' @include utils-pipe.R
#' @importFrom gh gh
#' @importFrom yaml read_yaml
#' @importFrom tibble as_tibble
#' @importFrom dplyr bind_rows filter
NULL

#' List sdmverse packages
#
#' This function list sdmverse packages from online yamls.
#'
#' @param where char. Where to download the packages metadata,
#'  either 'locally' with the package or 'online' in the GitHub repository.
#'
#' @return sdmverse packages metadata.
#'
#' @examples
#' \donttest{
#' list_packages()
#' }
#'
#' @export
#'
list_packages <- function(where = "online") {
  name <- version <- NULL
  if (!(where %in% c("locally", "online"))) {
    stop("The where argument should be 'locally' or 'online'.")
  }
  if (where == "online") {
    request <-
      gh("GET /repos/sylvainschmitt/sdmverse/git/trees/main?recursive=1")
    files <- vapply(request$tree, "[[", "", "path")
    packages <- grep("inst/extdata/packages/", files,
      value = TRUE, fixed = TRUE
    )
    packages <- lapply(packages, function(p) {
      paste0(
        "https://raw.githubusercontent.com/sylvainschmitt/sdmverse/main/",
        p
      )
    })
  }
  if (where == "locally") {
    packages <- list.files(file.path(
      system.file(package = "sdmverse"),
      "extdata", "packages"
    ), full.names = TRUE)
  }
  lapply(packages, read_yaml) %>%
    lapply(as_tibble) %>%
    lapply(function(x) mutate(x, version = as.character(version))) %>%
    bind_rows() %>%
    filter(name != "Name of package (same as CRAN)") %>%
    return()
}
