[First page](1st.md)

[Previous page](2nd.md) | [Next page](4th.md)
## Verify it all worked

What's the top 10 hurricanse by max wind
```
head(arrange(hurr_meta, desc(max_wind_mph)),10) %>% select(storm_name,  max_wind_mph, min_pressure, year)
```

How about top 10 hurricanse by minimum pressure
```
head(arrange(hurr_meta, min_pressure),10) %>% select(storm_name,  max_wind_mph, min_pressure, year)
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
