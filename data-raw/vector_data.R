## code to prepare vector data goes here
library(dplyr)
library(usethis)

# .rds with river points made by TACAR https://github.com/darrennorris/TACAR
mypath <- "yourpathhere"
mypath <- "C:\\Users\\user\\Documents\\Articles\\2024_Norris_Greenstatus\\TACAR\\inst\\other\\scenario_res_current.rds"
# points
inpoints <- readRDS(mypath)
# keep only columns needed for plotting
points_bau <- inpoints |>
  filter(model_name == "modelkey_BAU") |>
  mutate(flag_50_42y = factor(if_else(fem_diff_t42 <= -0.5, 1, 0))) |>
  select(BASIN_N, subbasn, SUBBASI,
         BAS_NAME, COUNTRY, RIV_ORD, BB_ID, BB_NAME, REACH_ID,
         Protected, Accessible, Free.flowing,
         fem_diff_t42, flag_50_42y,
         geometry)

# export
usethis::use_data(points_bau, overwrite = TRUE)
