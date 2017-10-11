[First page](1st.md)

[Previous page](4th.md) | [Next page](6th.md)
## More on max wind speed in mph!
Bar charts are great, but maybe a scatter plot will reveal something we can't see in the bar charts.  

To create this chart run [charts_all.R](charts_all.R) in R studio.
```
source(paste(repo_loc,"charts_all.R", sep = "/"))
```

<img alt="Max wind speed for storms for all basins" src="../master/charts/all_scatter_strom_wind.png?raw=true" width="60%" height="60%" >

Looks max winds might be down slightly? 

Maybe there are any differences between the two basins.

To create this chart run [charts_basins_all.R](charts_basins_all.R) in R studio.
```
source(paste(repo_loc,"charts_basins_all.R", sep = "/"))
```

***Max wind speed for storms for Western Atlantic***

<img alt="Max wind speed for storms for Western Atlantic" src="../master/charts/Western_Atlantic_scatter_storm_wind.png?raw=true" width="60%" height="60%" >

In the Western Atlantic, it appears max winds are trending down?

***Max wind speed for storms for Eastern Pacific***

<img alt="Max wind speed for storms for Eastern Pacific" src="../master/charts/Eastern_Pacific_scatter_storm_wind.png?raw=true" width="60%" height="60%" >

In the Eastern Pacific, it appears max winds are trending slightly up?

Maybe all the storms that never became intense hurricanse are masking what we are looking for are intense storms getting more intense. Next up a max winds of intense hurricanse.

[Previous page](4th.md) | [Next page](6th.md)

[Last page](last.md)
