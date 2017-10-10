[First page](1st.md)

[Previous page](2nd.md) | [Next page](4th.md)
## Verify it all worked

What's the top 10 hurricanse by max wind
```
head(arrange(hurr_meta, desc(max_wind_mph)),10) %>% select(storm_name,  max_wind_mph, min_pressure, year)

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

How about top 10 hurricanse by minimum pressure
```
head(arrange(hurr_meta, min_pressure),10) %>% select(storm_name,  max_wind_mph, min_pressure, year)

   storm_name max_wind_mph min_pressure year
1    PATRICIA     212.8902          872 2015
2       WILMA     184.1212          882 2005
3     GILBERT     184.1212          888 1988
4     UNNAMED     184.1212          892 1935
5        RITA     178.3674          895 2005
6       ALLEN     189.8750          899 1980
7     CAMILLE     172.6136          900 1969
8        IOKE     161.1061          900 2006
9     KATRINA     172.6136          902 2005
10      LINDA     184.1212          902 1997
```


I want to make sure things imported correctly so let's take a look at variables we know are related.  Pressure and Wind should be related.  Lower pressures generally should have higher winds.

To create this chart run [charts_all.R](charts_all.R) in R studio.
```
source(paste(repo_loc,"charts_all.R", sep = "/"))
```
***Wind vs pressure for all basins***

<img alt="Wind vs pressure for all basins" src="../master/charts/all_scatter_pressure_wind.png?raw=true" width="60%" height="60%" >

Looks like a definite relationship.

We downloaded both the Western Atlantic and Eastern Pacific basins.  Let's make sure we see the same relationships for both.

To create these charts run [charts_basins_all.R](charts_basins_all.R) in R studio.
```
source(paste(repo_loc,"charts_basins_all.R", sep = "/"))
```

***Wind vs pressure for Western Atlantic***

<img alt="wind vs pressure for Western Atlantic" src="../master/charts/Western_Atlantic_scatter_pressure_wind.png?raw=true" width="60%" height="60%" >

Looks like a definite relationship too.

***Wind vs pressure for Eastern Pacific***

<img alt="wind vs pressure for Eastern Pacific" src="../master/charts/Eastern_Pacific_scatter_pressure_wind.png?raw=true" width="60%" height="60%" >

Looks like a definite relationship.

[Previous page](2nd.md) | [Next page](4th.md)

[Last page](last.md)
