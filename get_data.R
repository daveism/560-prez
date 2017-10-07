#get hur data data from http://www.aoml.noaa.gov/hrd/hurdat/Data_Storm.html
# look for the hurdat2 link the text file has a date in it so IT WILL CHANGE you will jave
# to update this link! Note this is the western atlantic

#there is also a sepreate file for the pacific ocean
#documentation of data is at http://www.aoml.noaa.gov/hrd/hurdat/newhurdat-format.pdf
tracks_url_atlantic <- paste0("http://www.aoml.noaa.gov/hrd/hurdat/hurdat2-1851-2016-apr2017.txt")
tracks_url_pacific <- paste0("http://www.aoml.noaa.gov/hrd/hurdat/hurdat2-nepac-1949-2016-apr2017.txt")

#import hurricane tracks into hurr_tracks
hurr_tracks_atlantic <- readLines(tracks_url_atlantic)
# hurr_tracks_pacific <- readLines(tracks_url_pacific)

atlantic_meta_data <- create_meta_data(hurr_tracks_atlantic, "Western Atlantic")
atlantic_obs_data <- create_obs_data(hurr_tracks_atlantic, atlantic_meta_data, "Western Atlantic")

# import_hurdat(tracks_url_atlantic, "Atlantic")
