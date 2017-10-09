#############################
###Hurricane tracks by storm
#############################

for (huricane in hurr_meta$storm_id){
  # print(huricane)
  hur <- subset(hurr_obs, hurr_obs$storm_id == huricane )
  map_track <- make_hurricane_track_maps(hur)

  map_image <- paste( hur$basin, paste(hur$storm_name, paste("track_map", "png", sep="."), sep="_" ), sep="_" )
  map_image <- file.path(maps_storm_dir, map_image)
  map_image <- map_image[1]
  chart_image <- gsub(" ", "_", map_image)
  ggsave(map_image, map_track, width=4, height=3)

}

#############################
###Hurricane winds by storm
#############################

for (huricane in hurr_meta$storm_id){
  # print(huricane)
  hur <- subset(hurr_obs, hurr_obs$storm_id == huricane )

  bar_time_winds <- ggBarTime(
    hur,
    paste( paste("Winds by Date for", hur$storm_name),  hur$year),
    hur$date_time,
    hur$wind_mph,
    "Date Time",
    "Wind (MPH)",
    "NOAA - Hurrdat2 data"
  )


    chart_image <- paste( hur$basin, paste(hur$storm_name, paste("wind", "png", sep="."), sep="_" ), sep="_" )
    chart_image <- file.path(charts_storm_dir, chart_image)
    chart_image <- chart_image[1]
    chart_image <- gsub(" ", "_", chart_image)
    ggsave(chart_image, bar_time_winds, width=5, height=3)


}


#############################
###Hurricane Charts all basins
#############################
hurr_meta <- arrange(hurr_meta,desc(num_id))

#pressure vs wind
chartWindvsPressure <- ggScatterAuto(hurr_obs,
  hurr_obs$pressure,
  hurr_obs$wind_mph,
  "lm",
  "Pressure and Wind",
  "Pressure",
  "Wind MPH",
  "NOAA - Hurrdat2 data"
)

chart_image <- paste("all", paste("scatter_pressure_wind", "png", sep="."), sep="_" )
chart_image <- file.path(charts_dir, chart_image)
chart_image <- chart_image[1]
chart_image <- gsub(" ", "_", chart_image)
ggsave(chart_image, chartWindvsPressure, width=4, height=3)


#storm vs wind
allyearwind <- ggScatterAutoNoR(hurr_meta,
  hurr_meta$num_id,
  hurr_meta$max_wind_mph,
  "lm",
  "Storm and Max Wind",
  "Storm",
  "Max Wind MPH",
  "NOAA - Hurrdat2 data"
)

chart_image <- paste("all", paste("scatter_strom_wind", "png", sep="."), sep="_" )
chart_image <- file.path(charts_dir, chart_image)
chart_image <- chart_image[1]
chart_image <- gsub(" ", "_", chart_image)
ggsave(chart_image, allyearwind, width=5, height=3)

#storm vs wind
allyearwindZoom <- ggScatterAutoNoRLim(hurr_meta,
  hurr_meta$num_id,
  hurr_meta$max_wind_mph,
  "lm",
  "Storm and Max Wind",
  "Storm",
  "Max Wind MPH",
  "NOAA - Hurrdat2 data"
)

chart_image <- paste("all", paste("scatter_strom_wind_zoom", "png", sep="."), sep="_" )
chart_image <- file.path(charts_dir, chart_image)
chart_image <- chart_image[1]
chart_image <- gsub(" ", "_", chart_image)
ggsave(chart_image, allyearwindZoom, width=5, height=3)



BarYearWind <- ggBarMaxAll(
  hurr_meta,
  paste("Hurricanes Max Wind by Storm", ""),
  hurr_meta$num_id,
  hurr_meta$max_wind_mph,
  "Storm",
  "Max wind (MPH)",
  "NOAA - Hurrdat2 data"
)

chart_image <- paste("All", paste("bar_storm_maxwind", "png", sep="."), sep="_" )
chart_image <- file.path(charts_dir, chart_image)
chart_image <- chart_image[1]
chart_image <- gsub(" ", "_", chart_image)
ggsave(chart_image, BarYearWind, width=4, height=3)

meta_hurr_1050 <- subset(hurr_meta, hurr_meta$basin == basin & hurr_meta$year >= 1950)

#storm vs wind
allyearwind_1950 <- ggScatterAutoNoR(meta_hurr_1050,
  meta_hurr_1050$num_id,
  meta_hurr_1050$max_wind_mph,
  "lm",
  "Storm and Max Wind \n Since 1950",
  "Storm",
  "Max Wind MPH",
  "NOAA - Hurrdat2 data"
)

chart_image <- paste("all", paste("scatter_strom_wind_1950", "png", sep="."), sep="_" )
chart_image <- file.path(charts_dir, chart_image)
chart_image <- chart_image[1]
chart_image <- gsub(" ", "_", chart_image)
ggsave(chart_image, allyearwind_1950, width=5, height=3)

Chart_BarYearWind_1950 <- ggBarMaxAll(
  meta_hurr_1050,
  paste("Hurricanes Max Wind by Storm Since 1950 \n", basin, sep = " - "),
  meta_hurr_1050$num_id,
  meta_hurr_1050$max_wind_mph,
  "Storm",
  "Max wind (MPH)",
  "NOAA - Hurrdat2 data"
)
chart_image <- paste("All", paste("bar_storm_maxwind_1950", "png", sep="."), sep="_" )
chart_image <- file.path(charts_dir, chart_image)
chart_image <- chart_image[1]
chart_image <- gsub(" ", "_", chart_image)
ggsave(chart_image, Chart_BarYearWind_1950, width=5, height=3)



#############################
###Hurricane Charts by individual basins
#############################
basins <- unique(hurr_meta$basin)
#
# basins <- unique(hurr_meta$basin)
# for (basin in basins){
#   print(basin)
#   print("Test")
# }
#
#
# basin_meta_hurr <- subset(hurr_meta, hurr_meta$basin == 'Eastern Pacific' )
# basin_obs_hurr <- subset(hurr_obs, hurr_obs$basin == 'Eastern Pacific' )
#
# basin_meta_hurr <- arrange(basin_meta_hurr,desc(num_id))
# basin_obs_hurr <- arrange(basin_obs_hurr,desc(num_id))
#
#
# #year wind
# Chart_ScatterYearWind <- ggScatterAutoNoR(basin_meta_hurr,
#   basin_meta_hurr$num_id,
#   basin_meta_hurr$max_wind_mph,
#   "lm",
#   "Storm and Max Wind",
#   "Storm",
#   "Max Wind MPH",
#   "NOAA - Hurrdat2 data"
# )
#
# chart_image <- paste('Eastern Pacific', paste("scatter_storm_wind", "png", sep="."), sep="_" )
# chart_image <- file.path(charts_dir, chart_image)
# chart_image <- chart_image[1]
# chart_image <- gsub(" ", "_", chart_image)
# ggsave(chart_image, Chart_ScatterYearWind, width=4, height=3)
#


for (basin in basins){
  basin_meta_hurr <- subset(hurr_meta, hurr_meta$basin == basin )
  basin_obs_hurr <- subset(hurr_obs, hurr_obs$basin == basin )

  basin_meta_hurr <- arrange(basin_meta_hurr,desc(num_id))
  basin_obs_hurr <- arrange(basin_obs_hurr,desc(num_id))

  #year wind
  Chart_ScatterYearWind <- ggScatterAutoNoR(basin_meta_hurr,
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "lm",
    "Storm and Max Wind",
    "Storm",
    "Max Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(basin, paste("scatter_storm_wind", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_ScatterYearWind, width=4, height=3)

  #year wind
  Chart_ScatterYearWind_zoom <- ggScatterAutoNoRLim(basin_meta_hurr,
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "lm",
    "Storm and Max Wind",
    "Storm",
    "Max Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(basin, paste("scatter_storm_wind_zoom", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_ScatterYearWind_zoom, width=4, height=3)


  Chart_BarYearWind <- ggBarMaxAll(
    basin_meta_hurr,
    paste("Hurricanes Max Wind by Storm", basin, sep = " - "),
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "Storm",
    "Max wind (MPH)",
    "NOAA - Hurrdat2 data"
  )
  chart_image <- paste(basin, paste("bar_storm_maxwind", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_BarYearWind, width=4, height=3)


  #pressure vs wind
  chartWindvsPressure <- ggScatterAuto(basin_obs_hurr,
    basin_obs_hurr$pressure,
    basin_obs_hurr$wind_mph,
    "lm",
    paste("Pressure and Wind", basin),
    "Pressure",
    "Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(basin, paste("scatter_pressure_wind", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, chartWindvsPressure, width=4, height=3)

  Sys.sleep(10)
}



#############################
###Hurricane Charts by individual basins Since 1950 \n
#############################

for (basin in basins){
  basin_meta_hurr <- subset(hurr_meta, hurr_meta$basin == basin & hurr_meta$year >= 1950)
  basin_obs_hurr <- subset(hurr_obs, hurr_obs$basin == basin & hurr_obs$year >= 1950)

  basin_meta_hurr <- arrange(basin_meta_hurr,desc(num_id))
  basin_obs_hurr <- arrange(basin_obs_hurr,desc(num_id))

  #year wind
  Chart_ScatterYearWind <- ggScatterAutoNoR(basin_meta_hurr,
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "lm",
    "Storm and Max Wind Since 1950 \n",
    "Storm",
    "Max Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(basin, paste("scatter_storm_wind_1950", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_ScatterYearWind, width=4, height=3)

  Chart_BarYearWind <- ggBarMaxAll(
    basin_meta_hurr,
    paste("Hurricanes Max Wind by Storm Since 1950 \n", basin, sep = " - "),
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "Storm",
    "Max wind (MPH)",
    "NOAA - Hurrdat2 data"
  )
  chart_image <- paste(basin, paste("bar_storm_maxwind_1950", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_BarYearWind, width=4, height=3)


  #pressure vs wind
  chartWindvsPressure <- ggScatterAuto(basin_obs_hurr,
    basin_obs_hurr$pressure,
    basin_obs_hurr$wind_mph,
    "lm",
    paste("Pressure and Wind Since 1950 \n", basin),
    "Pressure",
    "Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(basin, paste("scatter_pressure_wind_1950", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, chartWindvsPressure, width=4, height=3)

  Sys.sleep(10)

}
