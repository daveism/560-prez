#############################
###Hurricane tracks by storm
#############################

basin_meta_hurr <- subset(hurr_meta, hurr_meta$basin == "Western Atlantic" )
basin_obs_hurr <- subset(hurr_obs, hurr_obs$basin == "Western Atlantic" )

basin_meta_hurr <- arrange(basin_meta_hurr,desc(num_id))
basin_obs_hurr <- arrange(basin_obs_hurr,desc(num_id))

for (huricane in basin_meta_hurr$storm_id){
  # print(huricane)
  hur <- subset(basin_obs_hurr, basin_obs_hurr$storm_id == huricane )

  title <- paste(hur$storm_name[1], hur$year[1])
  map_track <- make_hurricane_track_maps(hur, title, "NOAA - Hurrdat2 data")

  # basinname <- gsub(" ", "_", basin)
  storm_name_id <- paste( hur$storm_name, hur$storm_id, sep = "_")
  # image_name_1 <- paste(basinname , storm_name_id, sep = "_")
  image_name <- paste(storm_name_id , "track_map", sep = "_")

  map_image <- paste(image_name, "png", sep=".")
  map_image <- file.path(maps_storm_dir, map_image)
  map_image <- map_image[1]
  chart_image <- gsub(" ", "_", map_image)
  ggsave(map_image, map_track, width=4, height=3)

}

#############################
###Hurricane winds by storm
#############################

basin_meta_hurr <- subset(hurr_meta, hurr_meta$basin == "Western Atlantic" )
basin_obs_hurr <- subset(hurr_obs, hurr_obs$basin == "Western Atlantic" )

basin_meta_hurr <- arrange(basin_meta_hurr,desc(num_id))
basin_obs_hurr <- arrange(basin_obs_hurr,desc(num_id))

for (huricane in basin_obs_hurr$storm_id){
  # print(huricane)
  hur <- subset(hurr_obs, hurr_obs$storm_id == huricane )

  bar_time_winds <- ggBarTime(
    hur,
    paste( paste("Winds by Date for", hur$storm_name),  hur$year),
    hur$date_time,
    format(hur$wind_mph, digits = 3),
    "Date Time",
    "Wind (MPH)",
    "NOAA - Hurrdat2 data"
  )


    chart_image <- paste( hur$basin, paste(hur$storm_name, paste("wind", "png", sep="."), sep="_" ), sep="_" )
    chart_image <- file.path(charts_storm_dir, chart_image)
    chart_image <- chart_image[1]
    chart_image <- gsub(" ", "_", chart_image)
    ggsave(chart_image, bar_time_winds, width=4, height=3, type = "cairo-png")


}


#############################
###Hurricane Charts all basins
#############################
hurr_meta_sort <- arrange(hurr_meta,num_id)
hurr_obs_sort <- arrange(hurr_obs,num_id)

#pressure vs wind
chartWindvsPressure <- ggScatterAuto(hurr_obs_sort,
  hurr_obs_sort$pressure,
  hurr_obs_sort$wind_mph,
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
allyearwind <- ggScatterAutoNoR(hurr_meta_sort,
  hurr_meta_sort$num_id,
  hurr_meta_sort$max_wind_mph,
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
allyearwindZoom <- ggScatterAutoNoRLim(hurr_meta_sort,
  hurr_meta_sort$num_id,
  hurr_meta_sort$max_wind_mph,
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
  hurr_meta_sort,
  paste("Hurricanes Max Wind by Storm", ""),
  hurr_meta_sort$num_id,
  hurr_meta_sort$max_wind_mph,
  "Storm",
  "Max wind (MPH)",
  "NOAA - Hurrdat2 data"
)

chart_image <- paste("All", paste("bar_storm_maxwind", "png", sep="."), sep="_" )
chart_image <- file.path(charts_dir, chart_image)
chart_image <- chart_image[1]
chart_image <- gsub(" ", "_", chart_image)
ggsave(chart_image, BarYearWind, width=4, height=3)

meta_hurr_1050 <- subset(hurr_meta_sort, hurr_meta_sort$basin == basin & hurr_meta_sort$year >= 1950)

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
basins <- unique(hurr_meta_sort$basin)
#
# basins <- unique(hurr_meta_sort$basin)
# for (basin in basins){
#   print(basin)
#   print("Test")
# }
#
#
# basin_meta_hurr <- subset(hurr_meta_sort, hurr_meta_sort$basin == 'Eastern Pacific' )
# basin_obs_hurr <- subset(hurr_obs_sort, hurr_obs_sort$basin == 'Eastern Pacific' )
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


for (thebasin in basins){
  basin_meta_hurr <- subset(hurr_meta_sort, hurr_meta_sort$basin == thebasin )
  basin_obs_hurr <- subset(hurr_obs_sort, hurr_obs_sort$basin == thebasin )

  basin_meta_hurr <- arrange(basin_meta_hurr,num_id)
  basin_obs_hurr <- arrange(basin_obs_hurr,num_id)

  #year wind
  Chart_ScatterYearWind <- ggScatterAutoNoR(basin_meta_hurr,
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "lm",
    paste("Storm and Max Wind", thebasin, sep = " - "),
    "Storm",
    "Max Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(thebasin, paste("scatter_storm_wind", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_ScatterYearWind, width=4, height=3)

  #year wind
  Chart_ScatterYearWind_zoom <- ggScatterAutoNoRLim(basin_meta_hurr,
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "lm",
    paste("Storm and Max Wind", thebasin, sep = " - "),
    "Storm",
    "Max Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(thebasin, paste("scatter_storm_wind_zoom", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_ScatterYearWind_zoom, width=4, height=3)


  Chart_BarYearWind <- ggBarMaxAll(
    basin_meta_hurr,
    paste("Hurricanes Max Wind by Storm", thebasin, sep = " - "),
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "Storm",
    "Max wind (MPH)",
    "NOAA - Hurrdat2 data"
  )
  chart_image <- paste(thebasin, paste("bar_storm_maxwind", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_BarYearWind, width=4, height=3)


  #pressure vs wind
  chartWindvsPressure <- ggScatterAuto(basin_obs_hurr,
    basin_obs_hurr$pressure,
    basin_obs_hurr$wind_mph,
    "lm",
    paste("Pressure and Wind", thebasin, sep = " - "),
    "Pressure",
    "Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(thebasin, paste("scatter_pressure_wind", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, chartWindvsPressure, width=4, height=3)

}



#############################
###Hurricane Charts by individual basins Since 1950 \n
#############################

for (thebasin in basins){
  basin_meta_hurr <- subset(hurr_meta_sort, hurr_meta_sort$basin == thebasin & hurr_meta$year >= 1950)
  basin_obs_hurr <- subset(hurr_obs_sort, hurr_obs_sort$basin == thebasin & hurr_obs_sort$year >= 1950)

  basin_meta_hurr <- arrange(basin_meta_hurr,num_id)
  basin_obs_hurr <- arrange(basin_obs_hurr,num_id)

  #year wind
  Chart_ScatterYearWind <- ggScatterAutoNoR(basin_meta_hurr,
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "lm",
    paste("Storm and Max Wind Since 1950 \n", thebasin),
    "Storm",
    "Max Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(thebasin, paste("scatter_storm_wind_1950", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_ScatterYearWind, width=4, height=3)

  Chart_BarYearWind <- ggBarMaxAll(
    basin_meta_hurr,
    paste("Hurricanes Max Wind by Storm Since 1950 \n", thebasin),
    basin_meta_hurr$num_id,
    basin_meta_hurr$max_wind_mph,
    "Storm",
    "Max wind (MPH)",
    "NOAA - Hurrdat2 data"
  )
  chart_image <- paste(thebasin, paste("bar_storm_maxwind_1950", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, Chart_BarYearWind, width=4, height=3)


  #pressure vs wind
  chartWindvsPressure <- ggScatterAuto(basin_obs_hurr,
    basin_obs_hurr$pressure,
    basin_obs_hurr$wind_mph,
    "lm",
    paste("Pressure and Wind Since 1950 \n", thebasin),
    "Pressure",
    "Wind MPH",
    "NOAA - Hurrdat2 data"
  )

  chart_image <- paste(thebasin, paste("scatter_pressure_wind_1950", "png", sep="."), sep="_" )
  chart_image <- file.path(charts_dir, chart_image)
  chart_image <- chart_image[1]
  chart_image <- gsub(" ", "_", chart_image)
  ggsave(chart_image, chartWindvsPressure, width=4, height=3)

}
