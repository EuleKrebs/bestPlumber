bestPlumber: A Template for Building Robust Plumber APIs in R
================
EuleKrebs

<!-- README.md is generated from README.Rmd. Please edit that file -->

# bestPlumber

<!-- badges: start -->
<!-- badges: end -->

**bestPlumber** is an example R package demonstrating best practices for
building, documenting, and deploying a
[Plumber](https://www.rplumber.io/) API.  
It is intended as a template for structuring your own Plumber APIs in a
robust and maintainable way.

## Installation

You can install the development version of bestPlumber from
[GitHub](https://github.com/EuleKrebs/bestPlumber) with:

``` r
devtools::install_github("EuleKrebs/bestPlumber")
```

## Example: Running the API

``` r
devtools::load_all()
sysdir <- system.file(package = "bestPlumber")
# start the API server
source(file.path(sysdir, "runApp.R"))
# kill the API server
source(file.path(sysdir, "killApp.R"))
```

This will launch the API locally. You can then access endpoints such as
`http://localhost:<port>` in your browser or with `curl`.

## About this template

-   Follows best practices for organizing Plumber APIs as R packages
-   Includes examples for endpoint definition, input validation, and
    documentation
-   Ready for deployment to production environments

For more details, see the package documentation and the example API
source code.
