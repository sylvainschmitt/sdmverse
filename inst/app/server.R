shinyServer(function(input, output) {
  # packages
  packages <- sdmverse::prep_table()

  # to further play with the table
  tab <- reactive(
    {
      packages
    }
  )

  # output
  output$table <- DT::renderDataTable(
    {
      tab()
    }
    , escape = FALSE, server = TRUE)
})
