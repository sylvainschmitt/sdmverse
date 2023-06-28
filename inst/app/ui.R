shinyUI(fluidPage(
  headerPanel("sdmverse: A Meta-Package For Harnessing The Growing Diversity Of
              Species Distribution Modeling Packages"),
  mainPanel(
    DT::dataTableOutput("table")
  )
))
