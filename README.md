
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

The predicted future changes are from female-only, stochastic
stage-based matrix population projection models, developed here:
<https://github.com/darrennorris/TACAR>

## Objectives

These maps are being used to

- Provide an updated assesment of how threatened the species is.

- Inform development of and implement improvements to the modelling
  process.

## Results

Summaries of the results including maps of the projected future changes
can be found online.

- 3 generation.  
  Predicted changes after 35 years:
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

This example shows a summary of future changes to *Podocnemis unifilis*
populations in different countries.  
Another example showing where *Podocnemis unifilis* is Endangered is
here: <https://darrennorris.github.io/testmap/articles/testmap.html>

``` r
library(testmap)
library(dplyr)

## Summary by country.
points_bau_ffr |> 
  dplyr::mutate(flag_EN = if_else(fem_diff_t35 <= -0.5, 1, 0)) |>
  dplyr::group_by(COUNTRY) |> 
  dplyr::summarise(pop_start = sum(fem_t0), 
                   pop_end = sum(fem_t35), 
                   pop_change = round(((sum(fem_t35) - sum(fem_t0)) / sum(fem_t0)), 3),
                   length_river = n(), 
                   length_endangered = sum((flag_EN))) |>
  dplyr::ungroup() |> 
  dplyr::mutate(proportion_endangered = round((length_endangered / length_river), 2)) |> 
  dplyr::mutate(threat_status = case_when(pop_change <= -0.8 ~ "Critically Endangered", 
                                   pop_change <= -0.5 ~ "Endangered", 
                                   pop_change <= -0.3 ~ "Vulnerable", 
                                   pop_change <= -0.2 ~ "Near Threatened"))
#> # A tibble: 9 × 8
#>   COUNTRY       pop_start pop_end pop_change length_river length_endangered
#>   <chr>             <dbl>   <dbl>      <dbl>        <int>             <dbl>
#> 1 Bolivia          222170 103830.     -0.533        22217             15505
#> 2 Brazil          1905550 934926.     -0.509       190555            115489
#> 3 Colombia         385520 204235.     -0.47         38552             23628
#> 4 Ecuador           83020  25106.     -0.698         8302              7066
#> 5 French Guiana     32980  18580.     -0.437         3298              2048
#> 6 Guyana            73720  52144.     -0.293         7372              3263
#> 7 Peru             473630 173911.     -0.633        47363             36693
#> 8 Suriname          57560  40255.     -0.301         5756              2643
#> 9 Venezuela        300220 188560.     -0.372        30022             16714
#> # ℹ 2 more variables: proportion_endangered <dbl>, threat_status <chr>
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
