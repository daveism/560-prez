[First page](1st.md)

[Previous page](5th.md) | [Next page](7th.md)
## Wind Speed for Intense Hurricanes
Maybe the real increase is when hurricanes are intense.  We will define intense hurricanes any storm that is category 3 or higher [NOAA](http://www.nhc.noaa.gov/climo/). 

To create this chart run [charts_intense_all.R](charts_intense_all.R) in R studio.
```
source(paste(repo_loc,"charts_intense_all.R", sep = "/"))
```

Then take a look at the intense hurricane data
```
View(major_meta_hurr)
View(major_obs_hurr)
```
The top 10 Major Hurricanes

```
head(arrange(major_meta_hurr, desc(max_wind_mph)),10) %>% select(storm_name,  max_wind_mph, min_pressure, year)

    storm_name max_wind_mph min_pressure year
1    PATRICIA     212.8902          872 2015
2       ALLEN     189.8750          899 1980
3     UNNAMED     184.1212          892 1935
4     GILBERT     184.1212          888 1988
5       WILMA     184.1212          882 2005
6        PAKA     184.1212           NA 1997
7       LINDA     184.1212          902 1997
8       MITCH     178.3674          905 1998
9        RITA     178.3674          895 2005
10       RICK     178.3674          906 2009
```
<img alt="Max wind speed for storms for all basins" src="../master/charts/all_scatter_major_strom_wind.png?raw=true" width="60%" height="60%" >

It appears that max winds for intense hurricanse are trending up!

Let's see if there are any differences in the two basins.

To create this chart run [charts_intense_all_basins.R](charts_intense_all_basins.R) in R studio.
```
source(paste(repo_loc,"charts_intense_all_basins.R", sep = "/"))
```

The top 10 Major Hurricanes for the Western Atlantic

```
head(subset(major_meta_hurr, basin == "Western Atlantic")  %>%  arrange(desc(max_wind_mph)), 10)  %>% select(storm_name,  max_wind_mph, min_pressure, year) 

   storm_name max_wind_mph min_pressure year
1       ALLEN     189.8750          899 1980
2     UNNAMED     184.1212          892 1935
3     GILBERT     184.1212          888 1988
4       WILMA     184.1212          882 2005
5       MITCH     178.3674          905 1998
6        RITA     178.3674          895 2005
7       CARLA     172.6136          931 1961
8      ANDREW     172.6136          922 1992
9        DEAN     172.6136          905 2007
10      ANITA     172.6136          926 1977
```

<img alt="Max wind speed for storms for Western Atlantic" src="../master/charts/Western_Atlantic_scatter_major_storm_wind.png?raw=true" width="60%" height="60%" >

In the Western Atlantic, it looks like max winds of intense hurricans are trending up.  

The top 10 Major Hurricanes for the Eastern Pacific

```
head(subset(major_meta_hurr, basin == "Eastern Pacific")  %>%  arrange(desc(max_wind_mph)), 10)  %>% select(storm_name,  max_wind_mph, min_pressure, year) 

   storm_name max_wind_mph min_pressure year
1    PATRICIA     212.8902          872 2015
2        PAKA     184.1212           NA 1997
3       LINDA     184.1212          902 1997
4        RICK     178.3674          906 2009
5       PATSY     172.6136           NA 1959
6        JOHN     172.6136          929 1994
7       KENNA     166.8598          913 2002
8        IOKE     161.1061          900 2006
9       OLIWA     161.1061           NA 1997
10        AVA     161.1061          915 1973
```

<img alt="Max wind speed for storms for Eastern Pacific" src="../master/charts/Eastern_Pacific_scatter_major_storm_wind.png?raw=true" width="60%" height="60%" >

In the WesEastern Pacific, it appears max wind are trending up also for intense hurricanes!

Is this Real? Well all the data is ready for you to dig in too, what else can do with scripting.

[Previous page](5th.md) | [Next page](7th.md)

[Last page](last.md)
