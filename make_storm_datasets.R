

get_storm_data <- function(the_storm_id){
  storm_meta_hurr <- subset(hurr_meta, hurr_meta$storm_id  == the_storm_id)
  storm_obs_hurr <- subset(hurr_obs, hurr_obs$storm_id  == the_storm_id)

  storm_obs_hurr <- arrange(storm_obs_hurr,desc(date_time))

  file_name_meta <- paste( paste( "storm", the_storm_id, "summary", "data" , sep = "_"), "csv", sep = ".")
  file_name_obs <- paste( paste( "storm", the_storm_id, "detail", "data" , sep = "_"), "csv", sep = ".")

  write.csv(storm_meta_hurr, file.path(data_dir, file_name_meta))
  write.csv(storm_obs_hurr, file.path(data_dir, file_name_obs))

  hur <- subset(hurr_obs, hurr_obs$storm_id == the_storm_id )

  bar_time_winds <- ggBarTime(
    hur,
    paste( paste("Winds speeds for", hur$storm_name)),
    hur$date_time,
    format(hur$wind_mph, digits = 0),
    "Date Time",
    "Wind (MPH)",
    "NOAA - Hurrdat2 data"
  )

  image_name <- paste( "storm", hur$storm_name, hur$storm_id, "wind", "chart", sep = "_")

  chart_image <- paste(image_name, "png", sep=".")
  chart_image <- file.path(charts_storm_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, bar_time_winds, width=image_width, height=image_height, type = "cairo-png")

  title <- paste(hur$storm_name[1])
  map_track <- make_hurricane_track_maps(hur,
                title,
                "NOAA - Hurrdat2 data")

  image_name <- paste( "storm", hur$storm_name, hur$storm_id, "track",  "map" , sep = "_")

  map_image <- paste(image_name, "png", sep=".")
  map_image <- file.path(maps_storm_dir, map_image)
  map_image <- map_image[1]
  chart_image <- gsub(" ", "_", map_image)
  ggsave(map_image, map_track, width=image_width, height=image_height)

  bar_time_winds
  map_track
  View(storm_obs_hurr)
  View(storm_meta_hurr)
}
