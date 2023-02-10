# *sdmverse*: a meta-package for harnessing the growing diversity of species distribution modeling packages

[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml)
[![Codecov test coverage](https://codecov.io/gh/sylvainschmitt/sdmverse/branch/main/graph/badge.svg)](https://app.codecov.io/gh/sylvainschmitt/sdmverse?branch=main)
[![lint](https://github.com/sylvainschmitt/sdmverse/workflows/lint/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Alint)
[![check-cran-metadata](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-cran-metadata.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Acheck-cran-metadata)

*sdmverse* is a collaborative metapackage for listing all the metadata of the Species Distribution Modelling (SDM) packages.
*sdmverse* includes a graphical interface available locally or online (see below).
*sdmverse* integrates metadata from SDM packages and checks their validity against the CRAN metadata for perenity.
If you want to contribute with your package metadata, please use the contribution guidelines (see below).

## Online

The corresponding online shiny application is available at: https://sylvainschmitt.shinyapps.io/smdverse/ .

## Installation

You can install the latest version of **sdmverse** from Github using the [`devtools`](https://github.com/r-lib/devtools) package:

``` r
if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")

devtools::install_github("sylvainschmitt/sdmverse")
```

## Usage

```r
sdmverse::launch_app()
```

## Contribution

If you want to contribute with your package metadata, please use a pull request following [the contribution guidelines](adress).
