[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml)
[![Codecov test coverage](https://codecov.io/gh/sylvainschmitt/sdmverse/branch/main/graph/badge.svg)](https://app.codecov.io/gh/sylvainschmitt/sdmverse?branch=main)
[![lint](https://github.com/sylvainschmitt/sdmverse/workflows/lint/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Alint)
[![check-cran-metadata](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-cran-metadata.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Acheck-cran-metadata)

##  How to review contributions to *sdmverse*?

#### **Why?**

*sdmverse* is a collaborative metapackage for listing all the metadata of the Species Distribution Modelling (SDM) packages
Thus, *sdmverse* depends on the contribution and reviews of SDM packages maintainers to exist.

The package metadata is located in independent YAML files in `inst/extdata/packages/`.
For example, take a look at [*SSDM* metadata](https://github.com/sylvainschmitt/sdmverse/blob/main/inst/extdata/packages/SSDM.yaml).

#### **How?**

If you have agreed to review a contribution, thank you first as this repository could not work without your voluntary work!
In the online Pull Request on GitHub, use the `Add your review` button if you have been designated by the editor.
Please perform a line-by-line review of the package metadata to be reviewed in `inst/extdata/packages/{the_package}.yaml`.
Once the line-by-line review is complete, make a decision in the interface (Comment only, Approve, or Request changes) with a message justifying your choice for the editor.
In particular, we ask you to check that the fields where the package maintainer has answered yes are indeed included in a metadata function of the submitted package.
If necessary, you can use the interface to request specific details from the package maintainer.
Details of the various metadata fields are given below.

#### **What?**

Here you will find details of each metadata field to be filled in.
If your package is on CRAN, please use exactly the same text in the common fields.

- **name** : Name of package (same as CRAN)
- **title**: Title of package (same as CRAN)
- **version**: Version of package (same as CRAN)
- **author**: Author(s) of package (same as CRAN)
- **maintainer**: Maintainer of package (same as CRAN)
- **cran**: yes/no
- **github**: GitHub URL of package (if none, leave blank)
- **description**: Description of package (same as DESCRIPTION file and on CRAN)
- **occ_acquisition**: Function(s) to download occurrence data (yes/no).
- **occ_cleaning**: Function(s) to clean occurrence data (remove errors, fix georeferencing, etc.; yes/no)
- **data_integration**: Function(s) that statistically incorporate multiple types of data (e.g., presence/absence and presence-only; abundance and presence-only; etc.)
- **env_collinearity**: Function(s) to explore or address collinearity of environmental data (yes/no)
- **env_process**: Functions to process environmental data (interpolation, resampling, etc.; yes/no)
- **bias**: Function(s) to assess and/or correct biases in data (e.g., spatially thinning occurrences or weighting background to address occurrence sampling bias; yes/no)
- **study_region**: Function(s) to define the study area (yes/no)
- **backg_sample**: Function(s) to sample background/pseudoabsence records (yes/no)
- **data_partitioning**: Function(s) to partition data for model evaluation (yes/no)
- **mod_fit**: Function(s) to fit models (yes/no)
- **mod_tuning**: Function(s) to tune models (yes/no)
- **mod_ensemble**: Function(s) to generate ensemble models (yes/no)
- **mod_stack**: Function(s) to stack multiple single-species models to estimate community composition / diversity (yes/no)
- **mod_evaluate**: Function(s) to evaluate model performance (yes/no)
- **mod_multispecies**: Function(s) that model multiple species at once to estimate community composition / diversity (i.e., not a “stacked model; yes/no)
- **mod_mechanistic**: Function(s) that account for physiological, genetic, and/or trait-based components of species-environmental relationships (i.e., not just correlative; yes/no)
- **pred_general**: Function(s) to make model predictions (yes/no)
- **pred_extrapolation**: Function(s) to address or visualize prediction extrapolation (yes/no)
- **pred_inspect**: Function(s) to inspect or visualize the behavior of the model prediction (response curves, variable importance, xAI, etc.; yes/no)
- **post_processing**: Function(s) to post-process SDM predictions (dispersal or population simulation, niche overlap, estimation of biodiversity, etc.; yes/no)
- **gui**: Includes a graphical user interface (yes/no)
- **metadata**: Function(s) to  record analysis metadata (yes/no)
- **manuscript_citation**: Full citation of associated manuscript(s)  (if none, leave blank; if multiple, separate with semicolons)
- **manuscript_doi**: DOI for manuscripts in previous field (if multiple, separate with semicolons)

Thanks! :heart: :heart: :heart:

*sdmverse* Team
