[First page](1st.md)

[Previous page](7th.md)

# Your Turn!

Use this as a guide to dive into the hurdat2 data your self, or grab the data and go:
- Hurricane details: [hurricanes_detail.csv](data/hurricanes_detail.csv)
- Hurricane summarries: [hurricanes_summary.csv](data/hurricanes_summary.csv)

## Getting indivdual storms
To get information on any individual storm in the hurdat2 dataset, I created a function in [make_storm_datasets.R](make_storm_datasets.R).  All you need is the storm id.

For example getting information on the storm EP202015 aka PATRICIA run this:

```
get_storm_data("EP202015")
```

- track map
- wind chart
- summary data csv
- detail data csv

and get this
- [track map](maps/storm/storm_PATRICIA_EP202015_track_map.png)
- [wind chart](charts/storm/storm_PATRICIA_EP202015_wind_chart.png)
- [summary data csv](data/storm_EP202015_summary_data.csv)
- [detail data csv](data/storm_EP202015_detail_data.csv)


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
