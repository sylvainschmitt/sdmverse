[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml)
[![Codecov test coverage](https://codecov.io/gh/sylvainschmitt/sdmverse/branch/main/graph/badge.svg)](https://app.codecov.io/gh/sylvainschmitt/sdmverse?branch=main)
[![lint](https://github.com/sylvainschmitt/sdmverse/workflows/lint/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Alint)
[![check-cran-metadata](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-cran-metadata.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Acheck-cran-metadata)

##  How to edit contributions to *sdmverse*?

#### **Why?**

*sdmverse* is a collaborative metapackage for listing all the metadata of the Species Distribution Modelling (SDM) packages
Thus, *sdmverse* depends on the contribution, reviews, and editions of SDM packages maintainers to exist.

The package metadata is located in independent YAML files in `inst/extdata/packages/`.
For example, take a look at [*SSDM* metadata](https://github.com/sylvainschmitt/sdmverse/blob/main/inst/extdata/packages/SSDM.yaml).

#### **How?**

If you have agreed to edit a contribution, thank you first as this repository could not work without your voluntary work!

Here is the list of action to do (to be improved with text):

1. Activate GitHub actions and check CRAN metadata
1. Thanks submission, and ask for metadata change if not meeting CRAN metadata:
    1. Dear {name} thanks for your submission.
    1. Unfortunately the fields {fields} information does not match those on CRAN {link to GitHub Action}
1. Seek reviewers:
    1. I'm looking for a second reviewer, @{collaborators} are you available? Please have a look to [reviewing guidelines](https://github.com/sylvainschmitt/sdmverse/blob/main/REVIEWING.md)
1. Wait for review approval
1. Decide:
    1. Unfortunately, your package does not meet the `sdmverse` requirements for inclusion, so I am sorry to reject your pull request.
    1. Reviewers pointed to modification for you to do for me to approve your pull request.
    1. Thank you for your contribution. After merging your pull request I'll add yo to repository contributors and I'll probably ask you for review when I have new submission. Best, {name}
    
Thanks! :heart: :heart: :heart:

*sdmverse* Team
