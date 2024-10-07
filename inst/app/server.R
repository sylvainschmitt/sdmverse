library(DT)
library(magrittr)
library(dplyr)

shinyServer(function(input, output) {
  # packages
  packages <- sdmverse::list_packages(where = "online") %>%
    select(
      -author, -cran, -description, -manuscript_citation
    )

  # to further play with the table
  tab <- reactive({
    packages %>%
      mutate(name = ifelse(
        !is.na(repository),
        paste0("<a href=", repository, ">", name, "</a>"),
        name
      )) %>%
      select(-repository) %>%
      mutate(manuscript_doi = paste0(
        "https://www.doi.org/",
        manuscript_doi
      )) %>%
      mutate(manuscript_doi = paste0(
        "<a href='", manuscript_doi, "'>",
        manuscript_doi, "</a>"
      )) %>%
      datatable(
        escape = FALSE,
        class = "cell-border stripe",
        filter = "top",
        rownames = FALSE,
        selection = "none",
        extensions = c("FixedColumns", "FixedHeader"),
        options = list(
          dom = '<"top"firBp>t<"bottom">',
          language = list(
            info = "Showing _TOTAL_ packages", # _START_ to _END_ of
            infoFiltered = " (filtered from _MAX_ packages)"
          ),
          paging = FALSE,
          autoWidth = TRUE,
          columnDefs = list(list(targets = 1, width = "400px")),
          searching = TRUE,
          scrollX = TRUE,
          scrollY = input$dimension[2] - 290,
          fixedHeader = TRUE,
          fixedColumns = list(leftColumns = 1, rightColumns = 0),
          scrollCollapse = TRUE,
          deferRender = TRUE
        ),
        callback = JS("var tips = [
          'name',
          'title - info',
          'version - info',
          'maintainer - info',
          'occ_acquisition - info',
          'occ_cleaning - info',
          'data_integration - info',
          'env_collinearity - info',
          'env_process - info',
          'bias - info',
          'study_region - info',
          'backg_sample - info',
          'data_partitioning - info',
          'mod_fit - info',
          'mod_tuning - info',
          'mod_ensemble - info',
          'mod_stack - info',
          'mod_evaluate - info',
          'mod_multispecies - info',
          'mod_mechanistic - info',
          'pred_general - info',
          'pred_extrapolation - info',
          'pred_inspect - info',
          'post_processing - info',
          'gui - info',
          'metadata - info',
          'manuscript_doi - info'
        ],
        header = table.columns().header();
        for (var i = 0; i < tips.length; i++) {
          $(header[i]).attr('title', tips[i]);
        }")
      ) %>%
      formatStyle(colnames(select_if(packages, is.logical)),
        backgroundColor = styleEqual(
          c(TRUE, FALSE),
          c("#28CC2D", "white")
        ),
        fontWeight = styleEqual(
          c(TRUE, FALSE),
          c("bold", "normal")
        )
      )
  })
  output$table <- DT::renderDataTable({
    tab()
  }, )
})
