[First page](1st.md)

[Previous page](3rd.md) | [Next page](5th.md)
## Max wind speed overtime
I have added a bunch of extra data to the datasets.  Data such as max wind speed and min wind for each storm

Enter this and take a look at the storm summary data.
```
View(hurr_meta)
```

You can add more summary data by editing the function [clean_data_functions.R](clean_data_functions.R#L7 )

I also converted wind speed to MPH, because it's easier for me to relate to MPH.  

I also added a field in the hurdata2 data that creates a storm id that uses the year, storm order, and basin to create a numeric value.  This way we can see storms by year in a scatter plot. As an example, the fifth storm in the Atlantic in 1970 would have an id of 197005.1.

This allows us to look at wind speed in several different ways.  

Bar charts seem like the simplest way to look at data.  Maybe we can see a trend of increasing max winds trending up over time.


***Max wind speed for storms for all basins***

<img alt="Max wind speed for storms for all basins" src="../master/charts/All_bar_storm_maxwind.png?raw=true" width="60%" height="60%" >

I can't really tell if there is anything trending and to me it looks pretty random.

Maybe there is a difference in the two basins (Western Atlantic and Eastern Pacific)?

***Max wind speed for storms for Western Atlantic***

<img alt="Max wind speed for storms for Western Atlantic" src="../master/charts/Western_Atlantic_bar_storm_maxwind.png?raw=true" width="60%" height="60%" >

In the Western Atlantic it looks pretty random.

***Max wind speed for storms for Eastern Pacific***

<img alt="Max wind speed for storms for Eastern Pacific" src="../master/charts/Eastern_Pacific_bar_storm_maxwind.png?raw=true" width="60%" height="60%" >

Looks like a slight upward trend in the later years, but it's really hard to tell.

Maybe a scatter plot can reveal a little more?

[Previous page](3rd.md) | [Next page](5th.md)

[Last page](last.md)
