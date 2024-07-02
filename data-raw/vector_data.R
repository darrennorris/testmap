## code to prepare vector data goes here
library(tidyverse)
library(usethis)

# .rds with river points made by TACAR https://github.com/darrennorris/TACAR
mypath <- "yourpathhere"
mypath <- "C:\\Users\\user\\Documents\\Articles\\2024_Norris_Greenstatus\\TACAR\\inst\\other\\scenario_res_current.rds"
# points
inpoints <- readRDS(mypath)
# keep only columns needed for plotting
points_bau <- inpoints |>
  filter(model_name == "modelkey_BAU") |>
  select(BASIN_N, subbasn, SUBBASI,
         BAS_NAME, RIV_ORD, BB_ID, BB_NAME, REACH_ID,
         Protected, Accessible, Free.flowing,
         fem_diff_t42,
         geometry)

# export
usethis::use_data(points_bau, overwrite = TRUE)
