
<!-- README.md is generated from README.Rmd. Please edit that file -->

# testmap

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![pkgdown](https://github.com/darrennorris/testmap/workflows/pkgdown/badge.svg)](https://github.com/darrennorris/eprdados/actions)
[![R-CMD-check](https://github.com/darrennorris/testmap/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/darrennorris/testmap/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of testmap is to present projected future population changes of
**Podocnemis unifilis**.

Maps of the projected future changes can be found online.

- 3 generation.  
  Predicted changes after 42 years:
  <https://darrennorris.github.io/testmap/articles/Interactive-map.html>

## Installation

You can install the development version of testmap like so:

``` r
install.packages("remotes")
remotes::install_github("darrennorris/testmap")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(testmap)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

Package developed and built using the following guides:

- Fan Wang:
  <https://fanwangecon.github.io/PkgTestR/articles/ffv_pkgdown_github.html>
  and

- Emil Hvitfeldt:
  <https://emilhvitfeldt.com/post/2018-09-02-usethis-workflow-for-package-development/>
  and

- Saskia O:
  <https://www.marinedatascience.co/blog/2020/01/09/checklist-for-r-package-re-submissions-on-cran/>
