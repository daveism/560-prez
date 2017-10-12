```R
repo_loc <- "/Users/daveism/GitHub/560-prez"

maps_dir <- paste(repo_loc,"maps", sep = "/")
maps_storm_dir <- paste(repo_loc,"maps","storm", sep = "/")
charts_dir <- paste(repo_loc,"charts", sep = "/")
charts_storm_dir <- paste(repo_loc,"charts","storm", sep = "/")
data_dir <- paste(repo_loc,"data", sep = "/")

#image defaults
theme_base_size <- 9
image_width <- 4
image_xwidth <- 5
image_height <- 3

source(paste(repo_loc,"run_hurr.R", sep = "/"))

get_storm_data("AL012001")
get_storm_data("EP202015")
get_storm_data("AL212010")

maps_storm_dir <- paste(repo_loc,"maps","storm2", sep = "/")
charts_storm_dir <- paste(repo_loc,"charts","storm2", sep = "/")

source(paste(repo_loc,"map_functions.R", sep = "/"))
source(paste(repo_loc,"maps_tracks.R", sep = "/"))

source(paste(repo_loc,"chart_functions.R", sep = "/"))
source(paste(repo_loc,"chart_tracks.R", sep = "/"))
```
