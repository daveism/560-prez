#############################
###Hurricane Charts by individual basins
#############################
basins <- unique(hurr_meta_sort$basin)

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
  ggsave(chart_image, Chart_ScatterYearWind, width=image_width, height=image_height)

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
  ggsave(chart_image, Chart_ScatterYearWind_zoom, width=image_width, height=image_height)


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
  ggsave(chart_image, Chart_BarYearWind, width=image_width, height=image_height)


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
  ggsave(chart_image, chartWindvsPressure, width=image_width, height=image_height)

}
