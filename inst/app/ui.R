library(shinycssloaders)
library(shinydashboard)
options(spinner.color = "#0275D8", spinner.color.background = "#ffffff")
shinyUI(fluidPage(
  align = "left",
  tags$head(tags$script('
                var dimension = [0, 0];
                $(document).on("shiny:connected", function(e) {
                    dimension[0] = window.innerWidth;
                    dimension[1] = window.innerHeight;
                    Shiny.setInputValue("dimension", dimension);
                });
                $(window).resize(function(e) {
                    dimension[0] = window.innerWidth;
                    dimension[1] = window.innerHeight;
                    Shiny.setInputValue("dimension", dimension);
                });
            ')),
  box(
    width = 12,
    HTML("<h3><b><a href='https://github.com/sylvainschmitt/sdmverse'
    target='_blank'>sdmverse</a></b></h3><i><h5><nobr>A
    Meta-Package For Harnessing The Growing Diversity Of
          Species Distribution Modeling Packages</nobr></h5></i>")
  ),
  box(
    width = 12,
    tags$style(HTML(".dataTables_wrapper .dataTables_filter {float: left;")),
    withSpinner(DT::dataTableOutput("table"), type = 1),
    br()
  )
))
