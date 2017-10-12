[First page](1st.md)

[Previous page](4th.md) | [Next page](6th.md)
## Max wind speed overtime - Scatter Plots
Bar charts are great, but maybe a scatter plot will reveal something we can't see in the bar charts.  

To create this chart run [charts_all.R](charts_all.R) in R studio.
```
source(paste(repo_loc,"charts_all.R", sep = "/"))
```

<img alt="Max wind speed for storms for all basins" src="../master/charts/all_scatter_strom_wind.png?raw=true" width="60%" height="60%" >

Max winds might be down slightly? I was not expecting this.

Maybe there are some differences in the individual basins.

To create this chart run [charts_basins_all.R](charts_basins_all.R) in R studio.
```
source(paste(repo_loc,"charts_basins_all.R", sep = "/"))
```

<img alt="Max wind speed for storms for Western Atlantic" src="../master/charts/Western_Atlantic_scatter_storm_wind.png?raw=true" width="60%" height="60%" >

In the Western Atlantic, it appears max winds are trending down?

<img alt="Max wind speed for storms for Eastern Pacific" src="../master/charts/Eastern_Pacific_scatter_storm_wind.png?raw=true" width="60%" height="60%" >

In the Eastern Pacific, it appears max winds are trending slightly up?

Maybe all the storms that never became intense hurricanse are masking what we are looking for? Are intense storms getting more intense. Next up max winds of intense hurricanes.

[Previous page](4th.md) | [Next page](6th.md)

[Last page](last.md)
