[First page](1st.md)

[Previous page](start.md) | [Next page](3rd.md)
## Getting Started

First, you will have to [clone](https://github.com/daveism/560-prez) or [download](https://github.com/daveism/560-prez/archive/master.zip) this repository.

Open R studio and do the following:

### Update Hurdat2
If the Hurdat2 data has changed you will need to update the locations of the two files in [get_data.R](get_data.R#L7-L8).  


### Update repository
You will also need to update the location of the downloaded or cloned repository here [run_hurr.R](run_hurr.R#L1).  

Once updated, copy and paste the first 14 lines so the interactive pieces on this guide work properly [run_hurr.R](https://github.com/daveism/560-prez/blob/master/run_hurr.R#L1:L14).

```r
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

```

### Run the R scripts
In R studio run

```r
source(paste(repo_loc,"run_hurr.R", sep = "/"))
```

### The scripts and what they do
The [run_hurr.R](run_hurr.R) script will do a whole lot of things for us.
- Sets some variables
- Install all the packages we need [install.R](install.R)
- Load functions for cleaning the data [clean_data_functions.R](clean_data_functions.R)
- Get, clean, and prepare the data [get_data.R](get_data.R)
- Load functions to create maps [map_functions.R](map_functions.R)
- Load functions to create charts [chart_functions.R](chart_functions.R)
- Load functions to create individual storm map, chart and data [make_storm_datasets.R](make_storm_datasets.R)
- Write CSV data [write_csv.R](write_csv.R)
- Create charts
  - [charts_all.R]()
  - [charts_basins_all.R]()
  - [charts_all_1950.R]()
  - [charts_basins_all_1950.R]()
  - [charts_intense_all.R]()
  - [charts_intense_all_basins.R]()


---

The following creates maps and charts are not run automatically!  You will want to run this separately and it takes a **LONG** time to run, so if you have the time...

***NOTE before you run this be warned, this will take a long time***
- Create track maps  [run_hurr_track_charts.R](run_hurr_track_charts.R).  

```r
source(paste(repo_loc,"run_hurr_track_charts.R", sep = "/"))
```

- Create Strom Wind graphs [run_hurr_track_charts.R](run_hurr_track_charts.R).

```r
source(paste(repo_loc,"run_hurr_track_charts.R", sep = "/"))
```

[Previous page](start.md) | [Next page](3rd.md)

[Last page](last.md)
