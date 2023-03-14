[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml)
[![Codecov test coverage](https://codecov.io/gh/sylvainschmitt/sdmverse/branch/main/graph/badge.svg)](https://app.codecov.io/gh/sylvainschmitt/sdmverse?branch=main)
[![lint](https://github.com/sylvainschmitt/sdmverse/workflows/lint/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Alint)
[![check-cran-metadata](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-cran-metadata.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Acheck-cran-metadata)

##  How to edit contributions to *sdmverse*?

#### **Why?**

*sdmverse* is a collaborative metapackage that catalogues metadata for R packages that focus on Species Distribution Modeling (SDM). This package depends on the contributions, reviews, and edits of SDM package maintainers.

Metadata for packages are found in YAML files located in `inst/extdata/packages/`.
For example, take a look at [*SSDM* metadata](https://github.com/sylvainschmitt/sdmverse/blob/main/inst/extdata/packages/SSDM.yaml).

#### **How?**

If you have agreed to edit a contribution, we'd like to first thank you, as this repository could not function without your help!

Here is the list of actions to do (to be improved with text):

1. Activate GitHub Actions and check CRAN metadata.
2. Thank the contributor for the submission and ask for changes to contribution metadata if not they do not match the metadata on CRAN:
    Ex. Dear {name}, thanks for your submission.
        Unfortunately, the metadata in the fields {fields} do not match those on CRAN {link to GitHub Action}
3. Seek reviewers:
    Ex. I'm looking for a second reviewer: @{collaborators} are you available? Please have a look at the  [reviewing guidelines](https://github.com/sylvainschmitt/sdmverse/blob/main/REVIEWING.md)
4. Wait for review approval.
5. Make a decision:
    Ex. Unfortunately, your package does not meet the `sdmverse` requirements for inclusion, so I must reject your pull request. If you have questions, please post an Issue in this repository.
    Ex. The reviewers suggested edits to be made before approval of your pull request.
    Ex. Your contribution can be integrated without further edits. After merging your pull request, you will be added to the repository contributors. Please expect to be contacted for a review request in the future.
    
Thanks! :heart: :heart: :heart:

*sdmverse* Team
