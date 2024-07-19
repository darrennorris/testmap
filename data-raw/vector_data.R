## code to prepare vector data goes here
library(dplyr)
library(sf)
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
         geometry) |>
  sf::st_as_sf()
st_crs(points_bau) <- NA
points_bau <- points_bau |> data.frame()
# export
usethis::use_data(points_bau, overwrite = TRUE)

# .rds with Free-flowing river points made by TACAR https://github.com/darrennorris/TACAR
mypath <- "yourpathhere"
mypath <- "C:\\Users\\user\\Documents\\Articles\\2024_Norris_Greenstatus\\TACAR\\inst\\other\\scenario_res_ffr1a5.rds"
# points
inpoints <- readRDS(mypath)
# keep only columns needed for plotting
points_bau_ffr <- inpoints |>
  filter(model_name == "modelkey_BAU") |>
  mutate(flag_50_42y = factor(if_else(fem_diff_t42 <= -0.5, 1, 0)),
         flag_CR_42y = if_else(fem_diff_t42 <= -0.8, 5, NA),
         flag_EN_42y = if_else(fem_diff_t42 <= -0.5, 4, NA),
         flag_VU_42y = if_else(fem_diff_t42 <= -0.3, 3, NA),
         flag_NT_42y = if_else(fem_diff_t42 < 0, 2, NA),
         flag_ok_42y = if_else(fem_diff_t42 >= 0, 1, NA),
         ) |>
  mutate(threat_status = coalesce(flag_CR_42y, flag_EN_42y, flag_VU_42y,
                                  flag_NT_42y, flag_ok_42y)) |>
  select(BASIN_NAME, subbasin, SUBBASIN_FLAG,
         BAS_NAME, COUNTRY, RIV_ORD, BB_ID, BB_NAME, REACH_ID,
         Protected, Accessible, Free.flowing,
         fem_diff_t42, flag_50_42y,
         threat_status,
         geom) |>
  sf::st_as_sf()
sf::st_crs(points_bau_ffr) <- NA
points_bau_ffr <- points_bau_ffr |> data.frame()
points_bau_ffr$threat_status <- as.factor(points_bau_ffr$threat_status)
# Only have two extremes: less than -0.8 or increase 0.4.
levels(points_bau_ffr$threat_status)
# export
usethis::use_data(points_bau_ffr, overwrite = TRUE)

# subset for mapping
points_bau_ffr_map <- points_bau_ffr |>
  arrange(BASIN_NAME, subbasin, BB_ID, REACH_ID) |>
  filter(row_number() %% 10 == 1)
# export
usethis::use_data(points_bau_ffr_map, overwrite = TRUE)
