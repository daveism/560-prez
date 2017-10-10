make_hurricane_track_maps <- function(hurr, tittle, source){
  storm_max_wind <- aggregate(x=hur$wind_mph, by=list(hur$storm_id),FUN=max)
  storm_min_pressure <- aggregate(x=hur$pressure, by=list(hur$storm_id),FUN=min)
  storm_max_category <- aggregate(x=hur$category, by=list(hur$storm_id),FUN=max, na.rm=TRUE, na.action=NULL)

  storm_min_date <- aggregate(x=hur$date, by=list(hur$storm_id),FUN=min)
  storm_max_date <- aggregate(x=hur$date, by=list(hur$storm_id),FUN=max)

  storm_max_wind <- dplyr::rename(storm_max_wind,  storm_id = Group.1, max_wind_mph = x)
  storm_min_pressure <- dplyr::rename(storm_min_pressure,  storm_id = Group.1, min_pressure = x)
  storm_max_category <- dplyr::rename(storm_max_category,  storm_id = Group.1, max_category = x)

  storm_min_date <- dplyr::rename(storm_min_date,  storm_id = Group.1, min_date = x)
  storm_max_date <- dplyr::rename(storm_max_date,  storm_id = Group.1, max_date = x)

  storm_min_date$min_date <- format(as.Date(storm_min_date$min_date), format='%b %d, %Y')
  storm_max_date$max_date <- format(as.Date(storm_max_date$max_date), format='%b %d, %Y')

  storm_max_category[mapply(is.infinite, storm_max_category)] <- "N/A"

  storm_max_windst <- paste("Max Wind: ", format(storm_max_wind$max_wind_mph, digits = 3))
  storm_min_pressurest <- paste("Min pressure: ", format(storm_min_pressure$min_pressure, digits = 3))
  storm_max_categoryt <- paste("Max category: ", storm_max_category$max_category )
  storm_datet <- paste("Date: ", paste(storm_min_date$min_date, storm_max_date$max_date , sep=" - ") )

  the_subtitle <- paste(storm_datet, storm_max_windst,  storm_min_pressurest, storm_max_categoryt, sep="\n")

  storm_max_lat <- aggregate(x=hur$latitude, by=list(hur$storm_id),FUN=max)
  storm_max_lat <- as.numeric(storm_max_lat$x)

  storm_min_lat <- aggregate(x=hur$latitude, by=list(hur$storm_id),FUN=min)
  storm_min_lat <- as.numeric(storm_min_lat$x)

  storm_max_long <- aggregate(x=hur$longitude, by=list(hur$storm_id),FUN=max)
  storm_max_long <- as.numeric(storm_max_long$x)

  storm_min_long <- aggregate(x=hur$longitude, by=list(hur$storm_id),FUN=min)
  storm_min_long <- as.numeric(storm_min_long$x)

  worldmap = map_data ("world")

  hur$map_status <- ifelse(is.na(hur$category), as.character(hur$status), paste(hur$status, "category", hur$category ))

  storm_color <- c(
        # "" = "#367b7f",
        "Other low" = "#60999e",
        "Tropical depression" = "#4B8A8E",
        "Tropical storm" = "#367b7f",
        "Subtropical storm" = alpha("#367b7f", .8),
        "Extratropical cyclone" = alpha("#367b7f", .8),
        "Hurricane category 1" = "#f29d69",
        "Extratropical cyclone category 1" = alpha("#f29d69", .8),
        "Hurricane category 2" = "#e0713e",
        "Hurricane category 3" = "#D86136",
        "Hurricane category 4" = "#D0512E",
        "Hurricane category 5" = "#c94227"
      )

  ditch_the_axes <- theme(
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank()
  )

  wrld <- c(geom_polygon(aes(long,lat,group=group), size = 0.1, colour= "gray50", fill="cornsilk", alpha=0.8, data=worldmap))
  track_map <- ggplot() +
    coord_fixed(1.3) +
    coord_fixed(xlim = c(-160, -10.0),  ylim = c(60, 00)) +
    # coord_fixed(xlim = c(-storm_max_long, storm_min_long), ylim = c(storm_max_lat, storm_min_lat), ratio = 1.5) +
    wrld  +
    theme(panel.background = element_rect(fill='lightblue')) +
    geom_path(data = hur,
              aes(x = -longitude, y = latitude,
                  group = num_id,
                  color = map_status),
                  size = 1,
            linejoin = "mitre", lineend = "round") +
     scale_color_manual(values = storm_color) +
     labs(color="Storm Level")  +
    # geom_path(data = hur,
    #           aes(x = -longitude, y = latitude,
    #               group = num_id,
    #               color = status,
    #               size = wind_mph),
    #         linejoin = "mitre", lineend = "round") +
      # scale_color_gradientn(colours = rainbow(7), breaks = seq(25, 200, by = 25))
    # geom_path(data = hur,
    #          aes(x = -longitude, y = latitude,
    #              group = NULL, color = status,
    #              linejoin = "mitre", lineend = "butt",
    # #              size = (wind_mph/10)), alpha = 0.5) +
    # geom_path(data = hur,
    #          aes(x = -longitude, y = latitude,
    #              group = NULL)) +
  #   geom_point(data = hur,
  #            aes(x = -longitude, y = latitude,
  #                group = NULL, color = status,
  #                size = wind_mph), alpha = 0.5) +
   guides(row=guide_legend(nrow=2)) +
   theme_minimal(base_size=theme_base_size) +
   ditch_the_axes +
   theme(panel.background = element_rect(fill='lightblue')) +
   labs(x = NULL,
         y = NULL,
     title = tittle,
      subtitle=the_subtitle,
      caption=paste("Source:",source))+
      theme(legend.title=element_text(size=4),
            legend.text=element_text(size=3),
            legend.position="bottom",
            plot.subtitle = element_text(size=5,color="#666666"),
           plot.caption = element_text(color="#AAAAAA", size=5))

  return(track_map)

}
