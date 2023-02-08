#' @include utils-pipe.R
#' @importFrom shiny runApp
NULL

#' Launch sdmverse App
#
#' This function launch the sdmverse application.
#'
#' @param ... additional parameters from the \code{\link[shiny:runApp]{runApp}} function in the \emph{shiny} package.
#' @return This function does not return.
#'
#' @examples
#' \dontrun{
#'   ForestryAnalysisInR::launchRFA(launch.browser = TRUE)
#' }
#'
#' @export
#'
launch_app <- function(...){
  appDir <- file.path(path.package("ssdmverse", quiet=TRUE),"app")
  shiny::runApp(appDir)
}
