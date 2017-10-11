[First page](1st.md)

[Previous page](7th.md)

# Your Turn!

Use this guide to dive into the hurdat2 data or just grab the data:
- Hurricane details: [hurricanes_detail.csv](data/hurricanes_detail.csv)
- Hurricane summarries: [hurricanes_summary.csv](data/hurricanes_summary.csv)

## Getting indivdual storms
Just run the get_storm_data function with a storm id and you get
- track map
- wind chart
- summary data csv
- detail data csv

for example getting the storm EP202015 aka PATRICIA run this

```
get_storm_data("EP202015")
```
- [track map](blob/master/maps/storm/storm_PATRICIA_EP202015_wind_chart.png)
- [wind chart](blob/charts/storm/storm_PATRICIA_EP202015_track_map.png)
- [summary data csv](data/storm_EP202015_summary_data.csv)
- [detail data csv](data/storm_EP202015_detail_data.csv)

and get this


## Charts
A collection of charts I used in this and some others I did not.
- [Other charts](charts/)


## References

Hurdat2 http://www.aoml.noaa.gov/hrd/hurdat/Data_Storm.html

A good amount of the logic to clean the hurdata2: https://geanders.github.io/RProgrammingForResearch/entering-and-cleaning-data-3.html published under Creative Commons Zero v1.0 Universal <http://creativecommons.org/publicdomain/zero/1.0/>

ropensci http://ropensci.github.io/reproducibility-guide/sections/introduction/

NOAA http://www.nhc.noaa.gov/climo/

[Previous page](7th.md)

[Last page](last.md)
