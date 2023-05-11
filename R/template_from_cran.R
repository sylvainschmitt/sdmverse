#' @include utils-pipe.R
#' @include list_packages.R
#' @importFrom tools CRAN_package_db
#' @importFrom tibble as_tibble
#' @importFrom dplyr filter select rename mutate left_join rowwise
#' @importFrom stringr str_squish
#' @importFrom tidyr gather
#' @importFrom stringr str_squish
#' @importFrom utils as.person
#' @importFrom yaml read_yaml write_yaml
NULL

#' Template from CRAN
#
#' This function create a yaml template from CRAN metadata.
#'
#' @param name str. Name of the package on CRAN.
#' @param path str. Path to save the yaml file.
#'
#' @return Write the corresponding file in inst/extdata/pacakges.
#'
#' @examples
#' \dontrun{
#' template_from_cran()
#' }
#'
#' @export
#'
template_from_cran <- function(name,
                               path = file.path(
                                 "inst", "extdata",
                                 "packages"
                               )) {
  title <- author <- NULL
  description <- NULL
  Package <- Title <- Version <- Author <- Maintainer <- NULL # nolint
  Description <- NULL # nolint

  cran_db <- CRAN_package_db()
  cran <- as_tibble(cran_db) %>%
    filter(Package == name) %>%
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

  file <- read_yaml(file.path(
    system.file(package = "sdmverse"),
    "extdata", "packages", "example.yaml"
  ))
  file$name <- cran$name
  file$title <- cran$title
  file$version <- cran$version
  file$author <- cran$author
  file$maintainer <- cran$maintainer
  file$cran <- TRUE
  file$description <- cran$description
  if (!is.null(path)) {
    write_yaml(
      file,
      file.path(path, paste0(name, ".yaml"))
    )
  } else {
    return(TRUE)
  }
}
