
<!-- README.md is generated from README.Rmd. Please edit that file -->

# testmap

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![pkgdown](https://github.com/darrennorris/testmap/workflows/pkgdown/badge.svg)](https://github.com/darrennorris/eprdados/actions)
[![R-CMD-check](https://github.com/darrennorris/testmap/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/darrennorris/testmap/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of testmap is to map future population changes of the
Yellow-spotted river turtle (*Podocnemis unifilis*).

## Objectives

These maps are being used to

- Provide an updated assesment of how threatened the species is.

- Inform development of and implement improvements to the modelling
  process.

## Results

Summaries of the results including maps of the projected future changes
can be found online.

- 3 generation.  
  Predicted changes after 42 years:
  <https://darrennorris.github.io/testmap/articles/Interactive-map.html>

## Installation

You can download the data to check and visualise using R. testmap cannot
be submitted to CRAN as the data files are large and the package does
not therefore pass “cran” checks.

So you need to install testmap like so:

``` r
install.packages("remotes")
remotes::install_github("darrennorris/testmap")
```

## Example

This is a basic example which shows a summary of where *Podocnemis
unifilis* is Endangered.  
Another example with code to make a map is here:
<https://darrennorris.github.io/testmap/articles/testmap.html>

``` r
library(testmap)
library(dplyr)

## Summary by country.
points_bau_ffr |> 
  dplyr::mutate(flag_EN = if_else(fem_diff_t42 <= -0.5, 1, 0)) |>
  dplyr::group_by(COUNTRY) |> 
  dplyr::summarise(pop_start = sum(fem_t0), 
                   pop_end = sum(fem_t42), 
                   pop_change = round(((sum(fem_t42) - sum(fem_t0)) / sum(fem_t0)), 3),
                   change_lcl_95 = Hmisc::smean.cl.boot(fem_diff_t42)["Lower"], 
                   change_ucl_95 = Hmisc::smean.cl.boot(fem_diff_t42)["Upper"],
                   length_river = n(), 
                   length_endangered = sum((flag_EN))) |>
  dplyr::ungroup() |> 
  dplyr::mutate(proportion_endangered = round((length_endangered / length_river), 2)) |> 
  dplyr::mutate(threat_status = case_when(pop_change <= -0.8 ~ "Critically Endangered", 
                                   pop_change <= -0.5 ~ "Endangered", 
                                   pop_change <= -0.3 ~ "Vulnerable", 
                                   pop_change <= -0.2 ~ "Near Threatened"))
#> # A tibble: 9 × 10
#>   COUNTRY  pop_start pop_end pop_change change_lcl_95 change_ucl_95 length_river
#>   <chr>        <dbl>   <dbl>      <dbl>         <dbl>         <dbl>        <int>
#> 1 Bolivia     222170  94300.     -0.576        -0.584        -0.567        22217
#> 2 Brazil     1905550 712133.     -0.626        -0.629        -0.624       190555
#> 3 Colombia    385520 199290.     -0.483        -0.489        -0.477        38552
#> 4 Ecuador      83020  18194.     -0.781        -0.791        -0.771         8302
#> 5 French …     32980  17147.     -0.48         -0.502        -0.458         3298
#> 6 Guyana       73720  55397.     -0.249        -0.263        -0.234         7372
#> 7 Peru        473630 149614.     -0.684        -0.689        -0.679        47363
#> 8 Suriname     57560  42552.     -0.261        -0.278        -0.243         5756
#> 9 Venezue…    300220 185219.     -0.383        -0.391        -0.376        30022
#> # ℹ 3 more variables: length_endangered <dbl>, proportion_endangered <dbl>,
#> #   threat_status <chr>
```

Package developed and built using the following guides:

- Fan Wang:
  <https://fanwangecon.github.io/PkgTestR/articles/ffv_pkgdown_github.html>
  and

- Emil Hvitfeldt:
  <https://emilhvitfeldt.com/post/2018-09-02-usethis-workflow-for-package-development/>
  and

- Saskia O:
  <https://www.marinedatascience.co/blog/2020/01/09/checklist-for-r-package-re-submissions-on-cran/>
