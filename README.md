# *sdmverse*: a meta-package for harnessing the growing diversity of species distribution modeling packages

[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml)
[![Codecov test coverage](https://codecov.io/gh/sylvainschmitt/sdmverse/branch/main/graph/badge.svg)](https://app.codecov.io/gh/sylvainschmitt/sdmverse?branch=main)
[![lint](https://github.com/sylvainschmitt/sdmverse/workflows/lint/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Alint)
[![check-cran-metadata](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-cran-metadata.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Acheck-cran-metadata)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.13927581.svg)](https://doi.org/10.5281/zenodo.13927581)

*sdmverse* is a collaborative metapackage for collecting and visualizing metadata for R packages focusing on species distribution models (SDMs), including a graphical interface for local or online use. Contributions of package metadata to *sdmverse* are checked automatically for validity against CRAN metadata. If you want to contribute your package metadata, please consult the contribution guidelines (see below).

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

## Pacakges

*List of 2024-04-09*

![pacakges](https://github.com/sylvainschmitt/sdmverse/blob/main/inst/img/pkgs.png)

## Contribution

If you want to contribute your package metadata, please submit a pull request following [the contribution guidelines](https://github.com/sylvainschmitt/sdmverse/blob/main/CONTRIBUTING.md).
