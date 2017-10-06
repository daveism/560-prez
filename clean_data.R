#import hurricane tracks into hurr_tracks
hurr_tracks <- readLines(tracks_url)

# all the documentation on the hurdat data is at
# http://www.aoml.noaa.gov/hrd/hurdat/newhurdat-format.pdf
# data is in very crazy hard to read format so can't just use read csv
# so will work through some really great ways borrowed from  https://geanders.github.io/RProgrammingForResearch/entering-and-cleaning-data-3.html

# split data into arrays by commas
hurr_tracks <- lapply(hurr_tracks, str_split, pattern = ",", simplify = TRUE)

# get lengths of all the fields
hurr_lengths <- sapply(hurr_tracks, length)

# there two longths in the file 4 - which is the id, storm name, and number of obsevatiosn (which reall helps deal with the crazy format)
hurr_meta <- hurr_tracks[hurr_lengths == 4]
hurr_obs <- hurr_tracks[hurr_lengths == 21]

# prepare the hurrican meta data from conversion to data frame
hurr_meta <- lapply(hurr_meta, tibble::as_tibble)

# make the data a dataframe so we can do all the R stuff
hurr_meta <- bind_rows(hurr_meta)

# we have extrax fields so delete it
hurr_meta <- dplyr::select(hurr_meta,-V4)

# rename the fields to something meaningfull
hurr_meta <- dplyr::rename(hurr_meta, storm_id = V1, storm_name = V2, n_obs = V3)

# get rid of spaces (trailing and leading in storm name make observatons numeric)
hurr_meta <- dplyr::mutate(hurr_meta, storm_name = str_trim(storm_name), n_obs = as.numeric(n_obs))

# get the number of observatons and repeat the storm id that number of observatons times
# this will allow us to add the storm_id to the storm observatons line and this add
# storm name
storm_id <- rep(hurr_meta$storm_id, times = hurr_meta$n_obs)

# prepare the hurrican obervation data from conversion to data frames
hurr_obs <- lapply(hurr_obs, tibble::as_tibble)
hurr_obs <- dplyr::bind_rows(hurr_obs)

#add the storm id
hurr_obs <- dplyr::mutate(hurr_obs,storm_id = storm_id)

#rename fields to something meaningfull
hurr_obs <- dplyr::rename(hurr_obs, date = V1, record_indentifer = V3, time = V2, status = V4, latitude = V5,longitude = V6, wind = V7, pressure = V8)
hurr_obs <- dplyr::rename(hurr_obs, radii_34_ne  = V9, radii_34_se  = V10, radii_34_sw  = V11, radii_34_nw  = V12)
hurr_obs <- dplyr::rename(hurr_obs, radii_50_ne  = V13, radii_50_se  = V14, radii_50_sw  = V15, radii_50_nw  = V16)
hurr_obs <- dplyr::rename(hurr_obs, radii_64_ne  = V17, radii_64_se  = V18, radii_64_sw  = V19, radii_64_nw  = V20)

#get rid of blank fields
hurr_obs <- dplyr::select(hurr_obs, -V21)

#add new fields for coded fields
hurr_obs$status_code <- hurr_obs$status
hurr_obs$record_indentifer_code <- hurr_obs$record_indentifer

#prepare coded fields to add a new field description
storm_levels <- c("TD",
                  "TS",
                  "HU",
                  "EX",
                  "SD",
                  "SS",
                  "LO",
                  "WV",
                  "DB")
storm_labels <- c("Tropical depression",
                  "Tropical storm",
                  "Hurricane",
                  "Extratropical cyclone",
                  "Subtropical depression",
                  "Subtropical storm",
                  "Other low",
                  "Tropical wave",
                  "Disturbance")

ri_ids <- c("L",
            "W",
            "P",
            "I",
            "C",
            "S",
            "G",
            "T")
ri_labels <- c("Landfall (center of system crossing a coastline)",
                "Maximum sustained wind speed",
                "Minimum in central pressure",
                "An intensity peak in terms of both pressure and wind",
                "Closest approach to a coast, not followed by a landfall",
                "Change of status of the system",
                "Genesis",
                "Provides additional detail on the track (position) of the cyclone")


#replace with real values and fill nulls with NA
hurr_obs <- dplyr::mutate(hurr_obs, status = factor(str_trim(status), levels = storm_levels,labels = storm_labels))
hurr_obs <- dplyr::mutate(hurr_obs, record_indentifer = factor(str_trim(record_indentifer),levels = ri_ids,labels = ri_labels))

#fix lat long to numbers and make directions sepreate field
hurr_obs <- dplyr::mutate(hurr_obs,lat_dir = str_extract(latitude, "[A-Z]"),
    latitude = as.numeric(str_extract(latitude, "[^A-Z]+")),
    lon_dir = str_extract(longitude, "[A-Z]"),
    longitude = as.numeric(str_extract(longitude, "[^A-Z]+")))

#make wind numeric
hurr_obs <-  dplyr::mutate(hurr_obs, wind = ifelse(wind == " -99", NA, as.numeric(wind)))

#bar chart of wind by year
#ggplot(hurr_obs, aes(x = wind)) + geom_histogram(binwidth = 10)

#fix pressure
hurr_obs  <- dplyr::mutate(hurr_obs, pressure = ifelse(pressure == " -999", NA, as.numeric(pressure)))

#fix radii's 34
hurr_obs  <- dplyr::mutate(hurr_obs, radii_34_ne = ifelse(radii_34_ne == " -999", NA, as.numeric(radii_34_ne)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_34_se = ifelse(radii_34_se == " -999", NA, as.numeric(radii_34_se)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_34_sw = ifelse(radii_34_sw == " -999", NA, as.numeric(radii_34_sw)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_34_nw = ifelse(radii_34_nw == " -999", NA, as.numeric(radii_34_nw)))

#fix radii's 50
hurr_obs  <- dplyr::mutate(hurr_obs, radii_50_ne = ifelse(radii_50_ne == " -999", NA, as.numeric(radii_50_ne)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_50_se = ifelse(radii_50_se == " -999", NA, as.numeric(radii_50_se)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_50_sw = ifelse(radii_50_sw == " -999", NA, as.numeric(radii_50_sw)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_50_nw = ifelse(radii_50_nw == " -999", NA, as.numeric(radii_50_nw)))


#fix radii's 64
hurr_obs  <- dplyr::mutate(hurr_obs, radii_64_ne = ifelse(radii_64_ne == " -999", NA, as.numeric(radii_64_ne)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_64_se = ifelse(radii_64_se == " -999", NA, as.numeric(radii_64_se)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_64_sw = ifelse(radii_64_sw == " -999", NA, as.numeric(radii_64_sw)))
hurr_obs  <- dplyr::mutate(hurr_obs, radii_64_nw = ifelse(radii_64_nw == " -999", NA, as.numeric(radii_64_nw)))


#add data time field make data formated date field
hurr_obs$date_time <- ymd_hm(paste(hurr_obs$date, hurr_obs$time))
hurr_obs$date <- ymd(hurr_obs$date)

# list top 5 low pressure
# hurr_obs %>% dplyr::arrange(pressure) %>% dplyr::select(date_time, wind, pressure) %>% slice(1:5)

#plot
# ggplot(east_us, aes(x = long, y = lat, group = group)) +
# geom_polygon(fill = "cornsilk", color = "cornsilk") +
# theme_void() +
# geom_path(data = hurr_obs,
# aes(x = -longitude, y = latitude,
# group = storm_id),
# color = "red", alpha = 0.2, size = 0.2) +
# geom_path(data = filter(hurr_obs, cat_5),
# aes(x = -longitude, y = latitude,
# group = storm_id),
# color = "red") +
# facet_wrap(~ decade)
# ggplot(hurr_obs, aes(x = pressure, y = wind,
# color = status)) +
# geom_point(size = 0.2, alpha = 0.4)
# plot(pressure, wind)

# plot pres wind scatter - move to my function
plot(hurr_obs$pressure, hurr_obs$wind)

# add decade
hurr_obs$decade <- paste0(substring(year(hurr_obs$date_time), 1, 3), "0s")

#add saffir simpson source_yale
hurr_obs$category <- ifelse(hurr_obs$wind >= 137, "5",
                     ifelse(hurr_obs$wind >= 113 & hurr_obs$wind <= 136, "4",
                     ifelse(hurr_obs$wind >= 96 & hurr_obs$wind <= 112, "3",
                     ifelse(hurr_obs$wind >= 83 & hurr_obs$wind <= 95, "2",
                     ifelse(hurr_obs$wind >= 64 & hurr_obs$wind <= 82, "1", NA)))))
#add mph
hurr_obs$mph <- as.numeric((hurr_obs$wind * 6076)/5280)

#hurr_obs <- hurr_obs %>% dplyr::mutate(decade = substring(year(date_time), 1, 3),decade = paste0(decade, "0s"))

#not sure I need this yet
# hurr_obs <- hurr_obs %>%
#   dplyr::group_by(storm_id) %>% dplyr::mutate(cat_5 = max(wind) >= 137) %>%
#   dplyr::ungroup()
#
# map showing tracks and dark think for cat 5's
# the_us <- map_data("state")
# ggplot(the_us, aes(x = long, y = lat, group = group)) +
# geom_polygon(fill = "cornsilk", color = "cornsilk") +
# theme_void() +
# geom_path(data = hurr_obs,
# aes(x = -longitude, y = latitude,
# group = storm_id),
# color = "red", alpha = 0.2, size = 0.2) +
# geom_path(data = filter(hurr_obs, cat_5),
# aes(x = -longitude, y = latitude,
# group = storm_id),
# color = "red") +
# facet_wrap(~ decade)

#highest_wind
highest_wind_year <- hurr_obs %>%
  dplyr::mutate(storm_year = year(date_time)) %>%
  dplyr::group_by(storm_year) %>%
  dplyr::summarize(highest_wind = max(wind, na.rm = TRUE))

highest_wind_storm_year <- hurr_obs %>%
  dplyr::mutate(storm_year = year(date_time)) %>%
  dplyr::group_by(storm_year,storm_id) %>%
  dplyr::summarize(highest_wind = max(wind, na.rm = TRUE))

ggplot(highest_wind_year, aes(x = storm_year, y = highest_wind)) +
  geom_line() + geom_smooth(se = FALSE, span = 0.5)

# point plot of wind by year
plot(highest_wind_year$storm_year,highest_wind_year$highest_wind)

plot(highest_wind_year$storm_year,highest_wind_year$highest_wind)


#
# hurr_obs %>%
#   dplyr::mutate(storm_year = year(date_time)) %>%
#   dplyr::group_by(storm_year) %>%
#   dplyr::summarize(highest_wind = max(wind, na.rm = TRUE)) %>%
#   ggplot(aes(x = storm_year, y = highest_wind)) +
#   geom_line() + geom_smooth(se = FALSE, span = 0.5)

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

# yearwind <- hurr_obs %>%
# dplyr::mutate(storm_year = year(date_time)) %>%
# dplyr::group_by(storm_year) %>%
# dplyr::summarize(highest_wind = max(wind, na.rm = TRUE)) %>%
# ggplot(aes(x = storm_year, y = highest_wind)) +
# geom_line() + geom_smooth(se = FALSE, span = 0.5)

# yearwind <- lapply(yearwind, tibble::as_tibble)
# yearwind <- bind_rows(yearwind)
# yearwind <- rbind(yearwind)
# View(yearwind)
#
# yearwind <- ldply(yearwind, data.frame)
# yearwind <- hurr_obs %>%
# dplyr::mutate(storm_year = year(date_time)) %>%
# dplyr::group_by(storm_year) %>%
# dplyr::summarize(highest_wind = max(wind, na.rm = TRUE)) %>%
# ggplot(aes(x = storm_year, y = highest_wind)) +
# geom_line() + geom_smooth(se = FALSE, span = 0.5)
# yearwind <- ldply(yearwind, data.frame)
# yearwind <- sapply(yearwind, c)
# yearwind <- data.frame(yearwind)
# yearwind <- hurr_obs %>%
# dplyr::mutate(storm_year = year(date_time)) %>%
# dplyr::group_by(storm_year) %>%
# dplyr::summarize(highest_wind = max(wind, na.rm = TRUE)) %>%
# ggplot(aes(x = storm_year, y = highest_wind)) +
# geom_line() + geom_smooth(se = FALSE, span = 0.5)
# class(yearwind)
# yearwind <- hurr_obs %>%
# dplyr::mutate(storm_year = year(date_time)) %>%
# dplyr::group_by(storm_year) %>%
# dplyr::summarize(highest_wind = max(wind, na.rm = TRUE))

# savehistory("~/rhistory/hurrican_classprez3.Rhistory")
# dplyr::mutate(storm_year = year(date_time))
# hurrobs$storm_year <- year(date_time)
# hurrobs$storm_year <- year(hurrobs$date_time)
# hurr_obs$storm_year <- year(hurr_obs$date_time)
# View(hurr_obs)
# save.image("~/rhistory/hurrican_classprez4.RData")
# savehistory("~/rhistory/hurrican_classprez4.Rhistory")
