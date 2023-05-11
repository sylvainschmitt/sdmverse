#' @include utils-pipe.R
#' @include list_packages.R
#' @importFrom tools CRAN_package_db
#' @importFrom tibble as_tibble
#' @importFrom dplyr filter select rename mutate left_join rowwise
#' @importFrom stringr str_squish
#' @importFrom tidyr gather
#' @importFrom stringr str_squish
#' @importFrom utils as.person
NULL

#' Check CRAN metadata
#
#' This function check package metadata with CRAN metadata.
#'
#' @return TRUE or an error if this is not matching
#'
#' @examples
#' \dontrun{
#' check_cran_metadata()
#' }
#'
#' @export
#'
check_cran_metadata <- function() {
  name <- title <- version <- author <- NULL
  maintainer <- description <- NULL
  Package <- Title <- Version <- Author <- Maintainer <- NULL # nolint
  Description <- NULL # nolint
  value_sdmverse <- value_cran <- check <- NULL
  packages <- list_packages(where = "locally") %>%
    filter(cran) %>%
    select(name, title, version, author, maintainer, description)
  cran_db <- CRAN_package_db()
  cran <- as_tibble(cran_db) %>%
    filter(Package %in% packages$name) %>%
    select(
      Package, Title, Version, Author, Maintainer,
      Description
    ) %>%
    rename(
      name = Package, title = Title, version = Version,
      author = Author, maintainer = Maintainer,
      description = Description
    ) %>%
    mutate(title = gsub("\n", " ", title)) %>%
    mutate(title = str_squish(title)) %>%
    mutate(description = gsub("\n", " ", description)) %>%
    mutate(description = str_squish(description)) %>%
    rowwise() %>%
    mutate(author = paste(
      format(as.person(author),
        include = c("given", "family")
      ),
      collapse = ", "
    ))
  packages <- packages %>%
    gather("variable", "value_sdmverse", -name)
  cran <- cran %>%
    gather("variable", "value_cran", -name)
  fails <- left_join(packages, cran, by = c("name", "variable")) %>%
    mutate(check = (value_sdmverse == value_cran)) %>%
    filter(!check)
  if (nrow(fails) > 0) {
    message <- "\n"
    for (l in seq_len(nrow(fails))) {
      message <- paste0(
        message,
        "-For package ", fails[l, ]$name, ", ",
        fails[l, ]$variable, " is defined as '",
        fails[l, ]$value_sdmverse,
        "' but should be defined as '", fails[l, ]$value_cran,
        "' according to CRAN.\n"
      )
    }
    stop(message)
  }
  return(TRUE)
}
