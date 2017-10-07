
  #highest wind by year in knts
  highest_wind_year <- hurr_obs %>%
    dplyr::mutate(storm_year = year(date_time)) %>%
    dplyr::group_by(storm_year) %>%
    dplyr::summarize(highest_wind = max(wind_knts, na.rm = TRUE))

  #highest wind by storm by year in knts
  highest_wind_storm_year <- hurr_obs %>%
    dplyr::mutate(storm_year = year(date_time)) %>%
    dplyr::group_by(storm_year,storm_id) %>%
    dplyr::summarize(highest_wind = max(wind_knts, na.rm = TRUE))

  #highest wind by year mph
  highest_wind_year_mph <- hurr_obs %>%
    dplyr::mutate(storm_year = year(date_time)) %>%
    dplyr::group_by(storm_year) %>%
    dplyr::summarize(highest_wind = max(wind_mph, na.rm = TRUE))

  #highest wind by storm by year in MPH
  highest_wind_storm_year_mph <- hurr_obs %>%
    dplyr::mutate(storm_year = year(date_time)) %>%
    dplyr::group_by(storm_year,storm_id) %>%
    dplyr::summarize(highest_wind = max(wind_mph, na.rm = TRUE))


# list top 5 low pressure
hurr_by_pressure <- dplyr::arrange(hurr_obs, hurr_obs$pressure)
top_five_low_pressure <- dplyr::select(hurr_by_pressure, storm_name, date_time, wind_knts, wind_mph, pressure) %>% slice(1:5)


# list top 5 highest wind pressure
hurr_by_mph <- dplyr::arrange(hurr_obs, desc(hurr_obs$wind_mph))
top_five_highest_mph <- dplyr::select(hurr_by_mph, storm_name, date_time, wind_knts, wind_mph, pressure) %>% slice(1:5)
