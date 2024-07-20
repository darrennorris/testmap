
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
An example with code to make a map is here:
<https://darrennorris.github.io/testmap/articles/testmap.html>

``` r
library(testmap)
library(dplyr)

## Summary by country.
points_bau_ffr |> 
  dplyr::mutate(flag_EN = if_else(fem_diff_t42 <= -0.5, 1, 0)) |>
  dplyr::group_by(COUNTRY) |> 
  dplyr::summarise(length_river = n(), 
                   length_endangered = sum((flag_EN))) |>
    ungroup() |> 
    mutate(proportion_endangered = round((length_endangered / length_river), 2)) |> 
  mutate(threat_status = case_when(proportion_endangered >= 0.8 ~ "Critically Endangered", 
                                   proportion_endangered >= 0.5 ~ "Endangered", 
                                   proportion_endangered >= 0.3 ~ "Vulnerable", 
                                   proportion_endangered >= 0.2 ~ "Near Threatened"))
#> # A tibble: 9 × 5
#>   COUNTRY     length_river length_endangered proportion_endangered threat_status
#>   <chr>              <int>             <dbl>                 <dbl> <chr>        
#> 1 Bolivia            22217             15516                  0.7  Endangered   
#> 2 Brazil            190555            141183                  0.74 Endangered   
#> 3 Colombia           38552             24122                  0.63 Endangered   
#> 4 Ecuador             8302              7066                  0.85 Critically E…
#> 5 French Gui…         3298              2082                  0.63 Endangered   
#> 6 Guyana              7372              3311                  0.45 Vulnerable   
#> 7 Peru               47363             36750                  0.78 Endangered   
#> 8 Suriname            5756              2643                  0.46 Vulnerable   
#> 9 Venezuela          30022             16714                  0.56 Endangered
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
