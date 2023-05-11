library(DT)
library(magrittr)
library(dplyr)

shinyServer(function(input, output) {
  # packages
  packages <- sdmverse::prep_table(where = "online")

  # to further play with the table
  tab <- reactive(
    {
      packages %>%
        mutate(name = ifelse(
          !is.na(repository),
          paste0("<a href=", repository, ">", name, "</a>"),
          name
        )) %>%
        select(-repository) %>%

        mutate(manuscript_doi = paste0("https://www.doi.org/",
                                       manuscript_doi)) %>%
        mutate(manuscript_doi =  paste0("<a href='", manuscript_doi, "'>",
                                        manuscript_doi, "</a>")) %>%
        datatable(escape = FALSE, class = "cell-border stripe",
                  filter = "top", rownames = FALSE) %>%
        formatStyle(colnames(select_if(packages, is.logical)),
                    backgroundColor = styleEqual(c(TRUE, FALSE),
                                                    c("#28CC2D", "white")),
                    fontWeight = styleEqual(c(TRUE, FALSE),
                                               c("bold", "normal")))
    }
  )

  # output
  output$table <- DT::renderDataTable(
    {
      tab()
    }
    , escape = FALSE, server = TRUE)
})
