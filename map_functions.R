make_hurricane_track_maps <- function(hurr){
  
  storm_max_wind <- aggregate(x=hur$wind_mph, by=list(hur$storm_id),FUN=max)
  storm_min_pressure <- aggregate(x=hur$pressure, by=list(hur$storm_id),FUN=min)

  storm_max_wind <- dplyr::rename(storm_max_wind,  storm_id = Group.1, max_wind_mph = x)
  storm_min_pressure <- dplyr::rename(storm_min_pressure,  storm_id = Group.1, min_pressure = x)

  storm_max_lat <- aggregate(x=hur$latitude, by=list(hur$storm_id),FUN=max)
  storm_max_lat <- as.numeric(storm_max_lat$x)

  storm_min_lat <- aggregate(x=hur$latitude, by=list(hur$storm_id),FUN=min)
  storm_min_lat <- as.numeric(storm_min_lat$x)

  storm_max_long <- aggregate(x=hur$longitude, by=list(hur$storm_id),FUN=max)
  storm_max_long <- as.numeric(storm_max_long$x)

  storm_min_long <- aggregate(x=hur$longitude, by=list(hur$storm_id),FUN=min)
  storm_min_long <- as.numeric(storm_min_long$x)


  wrld <- c(geom_polygon(aes(long,lat,group=group), size = 0.1, colour= "gray50", fill="cornsilk", alpha=0.8, data=worldmap))
  track_map <- ggplot() +
    coord_fixed(1.3) +
    coord_fixed(xlim = c(-160, -35.0),  ylim = c(60, 00), ratio = 1.5) +
    # coord_fixed(xlim = c(-storm_max_long, storm_min_long), ylim = c(storm_max_lat, storm_min_lat), ratio = 1.5) +
    wrld  +
    theme(base_size=9, spanel.background = element_rect(fill='lightblue')) +
    ditch_the_axes +
    geom_path(data = hur,
             aes(x = -longitude, y = latitude,
                 group = NULL)) +
    geom_point(data = hur,
             aes(x = -longitude, y = latitude,
                 group = NULL, color = status,
                 size = wind_mph), alpha = 0.5)

  return(track_map)

}
