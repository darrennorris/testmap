#' Points along rivers.
#'
#' A lot of points along rivers.
#'
#' @description
#'
#' The points show projected population changes along rivers.
#' Projections generated in TACAR (https://github.com/darrennorris/TACAR).
#' The population projections are an updated and extended version of those
#' published by Norris et. al. 2019 (https://doi.org/10.1016/j.biocon.2019.02.022).
#' \describe{
#'   \item{location}{South America.}
#'   \item{coord. ref}{WGS 84 (EPSG:3395).}
#' }
#'
#' @format `points_bau`
#' is a dataframe with 215849 points and 13 fields, including:
#' \describe{
#'   \item{BASIN_N}{Name of major basin.}
#'   \item{subbasn}{Name of subbasn.}
#'   \item{geometry}{sf geometry.}
#' }
#'
#' @references
#' Norris, D., et. al. (2019).
#' Prospects for freshwater turtle population recovery are catalyzed
#' by pan-Amazonian community-based management.
#' Biological Conservation, 233, https://doi.org/10.1016/j.biocon.2019.02.022.
#'
#' @source <https://github.com/darrennorris/TACAR>
#' @importFrom sf st_as_sf
#' @examples
#' \dontrun{
#' # convert to sf object
#' sf_points_bau <- sf::st_as_sf(points_bau, crs = 3395)
#' }
"points_bau"
