#' @include utils-pipe.R
#' @import shiny
#' @import shinycssloaders
#' @import shinydashboard
#' @importFrom DT renderDataTable dataTableOutput
NULL

#' Launch sdmverse App
#
#' This function launch the sdmverse application.
#'
#' @param port char. The TCP port that the application should listen on (see
#'   \code{\link[shiny]{runApp}} for more details).
#' @param host char. The IPv4 address that the application should listen on (see
#'   \code{\link[shiny]{runApp}} for more details).
#'
#' @return Open a window with a shiny app to use the SSDM package with an
#'   user-friendly interface.
#'
#' @examples
#' \dontrun{
#' launch_app()
#' }
#'
#' @export
#'
launch_app <- function(port = getOption("shiny.port"),
                       host = getOption("shiny.host", "127.0.0.1")) {
  app_dir <- system.file("app", package = "sdmverse")
  if (app_dir == "") {
    stop("Could not find shiny directory. Try re-installing `ssdmverse`.",
      call. = FALSE
    )
  }
  runApp(app_dir, display.mode = "normal", port = port, host = host)
}
