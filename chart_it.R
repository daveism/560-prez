#plot map by decade
ggplot(east_us, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "cornsilk", color = "cornsilk") +
  theme_void() +
  geom_path(data = hurr_obs,
  aes(x = -longitude, y = latitude,
  group = storm_id),
  color = "red", alpha = 0.2, size = 0.2) +
  geom_path(data = filter(hurr_obs, cat_5),
  aes(x = -longitude, y = latitude,
  group = storm_id),
  color = "red") +
  facet_wrap(~ decade)
  ggplot(hurr_obs, aes(x = pressure, y = wind,
  color = status)) +
  geom_point(size = 0.2, alpha = 0.4)
  plot(pressure, wind)

  the_us <- map_data("state")
    ggplot(the_us, aes(x = long, y = lat, group = group)) +
    geom_polygon(fill = "cornsilk", color = "cornsilk") +
    theme_void() +
    geom_path(data = hurr_obs,
    aes(x = -longitude, y = latitude,
    group = storm_id),
    color = "red", alpha = 0.2, size = 0.2) +
    geom_path(data = filter(hurr_obs, cat_5),
    aes(x = -longitude, y = latitude,
    group = storm_id),
    color = "red") +
    facet_wrap(~ decade)

  # plot tracks by decade
  plot(hurr_obs$year(date_time),hurr_obs$summarize(highest_wind = max(wind, na.rm = TRUE)) )
    ggplot(the_us, aes(x = long, y = lat, group = group)) +
    geom_polygon(fill = "cornsilk", color = "cornsilk") +
    theme_void()
    ggplot(the_us, aes(x = long, y = lat, group = group)) +
    geom_polygon(fill = "cornsilk", color = "cornsilk") +
    theme_void() + geom_path(data = hurr_obs,
    aes(x = -longitude, y = latitude,
    group = storm_id),
    color = "red", alpha = 0.2, size = 0.2)
    ggplot(the_us, aes(x = long, y = lat, group = group)) +
    geom_polygon(fill = "cornsilk", color = "cornsilk") +
    theme_void() + geom_path(data = hurr_obs,
    aes(x = -longitude, y = latitude,
    group = storm_id),
    color = "red", alpha = 0.2, size = 0.2) + facet_wrap(~ decade)



  # plot pres wind scatter - move to my function
  plot(hurr_obs$pressure, hurr_obs$wind)





    ggplot(highest_wind_year, aes(x = storm_year, y = highest_wind)) +
      geom_line() + geom_smooth(se = FALSE, span = 0.5)

    ggplot(highest_wind_year_mph, aes(x = storm_year, y = highest_wind)) +
      geom_line() + geom_smooth(se = FALSE, span = 0.5)


    # point plot of wind by year
    plot(highest_wind_year$storm_year,highest_wind_year$highest_wind)

    plot(highest_wind_year$storm_year,highest_wind_year$highest_wind)
