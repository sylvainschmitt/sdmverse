[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![R-CMD-check](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-standard.yaml)
[![Codecov test coverage](https://codecov.io/gh/sylvainschmitt/sdmverse/branch/main/graph/badge.svg)](https://app.codecov.io/gh/sylvainschmitt/sdmverse?branch=main)
[![lint](https://github.com/sylvainschmitt/sdmverse/workflows/lint/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Alint)
[![check-cran-metadata](https://github.com/sylvainschmitt/sdmverse/actions/workflows/check-cran-metadata.yaml/badge.svg)](https://github.com/sylvainschmitt/sdmverse/actions?query=workflow%3Acheck-cran-metadata)

## How to contribute to *sdmverse*

#### **Why?**

*sdmverse* is a collaborative metapackage for listing all the metadata of the Species Distribution Modelling (SDM) packages
Thus, *sdmverse* depends on the contribution and reviews of SDM packages maintainers to exist.

The package metadata is located in independent YAML files in `inst/extdata/packages/`.
For example, take a look at [*SSDM* metadata](https://github.com/sylvainschmitt/sdmverse/blob/main/inst/extdata/packages/SSDM.yaml).

#### **How?**

If you want to contribute, please fork the repository on GitHub.
Then, online on GitHub, in Rstudio or with your favourite editor, create a YAML file in `inst/extdata/packages/` called `{your_package}.yaml`.
Copy and fill in the contents of the file [`example.yaml`] (https://github.com/sylvainschmitt/sdmverse/blob/main/inst/extdata/packages/example.yaml).
Details of the various metadata fields are given below.
Once your file is ready and online on your GitHub fork, open a pull request to contribute to *sdmverse*.
Please ensure that the GitHub *check-CRAN-metadata* action does not fail.
You can then ask an editor to start the review process.
Remember that the review process is voluntary, so try to be understanding with reviewers and editors.
Once the review process has been successfully completed, we will be happy to include your package in the *sdmverse* to help users discover it.

#### **What?**

Here you will find details of each metadata field to be filled in.
If your package is on CRAN, please use exactly the same text in the common fields.

* **name** : Name of your package (same as CRAN)
* **title**: Title of your package (same in CRAN)
* **version**: Version of your package (same in CRAN)
* **author**: Author(s) of your package (same in CRAN)
* **maintainer**: Maintainer of your package (same in CRAN)
* **cran**: Is your package on CRAN (yes or no)?
* **github**: GitHub URL of your package (empty string if not)
* **description**: Maintainer of your package (same as CRAN)
* **occ_acquisition**: Does your package include occurrence data acquisition (yes or no, if minor please use no).
* **occ_cleaning**: Does your package include the cleaning of occurrence data (yes or no, if minor please use no)?
* **env_collinearity**: Does your package help deal with collinearity of environmental data (yes or no, if minor please use no)?
* **env_interpolation**: Does your package include interpolation of environmental data (yes or no, if minor please use no)?
* **bias**: Does your package include bias assessment and correction (yes or no, if minor please use no)?
* **study_region**: Does your package help to address study area and background sampling (yes or no, if minor please use no)?
* **data_partitioning**: Does your package include data partitioning for model evaluation (yes or no, if minor please use no)?
* **calib_general**: Does your package include calibration (yes or no, if minor please use no)?
* **calib_ensemble**: Does your package include calibration for the ensemble model (yes or no, if minor please use no)?
* **calib_evaluation**: Does your package include calibration evaluation (yes or no, if minor please use no)?
* **pred_general**: Does your package include prediction (yes or no, if minor please use no)?
* **pred_extrapolation**: Does your package include prediction extrapolations (yes or no, if minor please use no)?
* **post_processing**: Does your package include SDM post-processing (yes or no, if minor please use no)?
* **gui**: Does your package include a graphical user interface (yes or no, if minor please use no)?
* **metadata**: Does your package help to process the metadata of the analyses (yes or no, if minor please use no)?

Thanks! :heart: :heart: :heart:

*sdmverse* Team
