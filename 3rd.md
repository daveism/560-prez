[First page](1st.md)

[Previous page](2nd.md) | [Next page](4th.md)
## Verify it all worked

List the top 10 hurricanes by max wind
```
head(arrange(hurr_meta, desc(max_wind_mph)),10) %>% select(storm_name,  max_wind_mph, min_pressure, year)
```

```
   storm_name max_wind_mph min_pressure year
1    PATRICIA          213          872 2015
2       ALLEN          190          899 1980
3     UNNAMED          184          892 1935
4     GILBERT          184          888 1988
5       WILMA          184          882 2005
6        PAKA          184           NA 1997
7       LINDA          184          902 1997
8       MITCH          178          905 1998
9        RITA          178          895 2005
10       RICK          178          906 2009
```

How about top 10 hurricanes by minimum pressure
```
head(arrange(hurr_meta, min_pressure),10) %>% select(storm_name,  max_wind_mph, min_pressure, year)
```

```
   storm_name max_wind_mph min_pressure year
1    PATRICIA          213          872 2015
2       WILMA          184          882 2005
3     GILBERT          184          888 1988
4     UNNAMED          184          892 1935
5        RITA          178          895 2005
6       ALLEN          190          899 1980
7     CAMILLE          173          900 1969
8        IOKE          161          900 2006
9     KATRINA          173          902 2005
10      LINDA          184          902 1997
```


It looks like some of the same names are on the two lists and I already know pressure and wind should be related. So let's look...

```
cor <- lm(formula = hurr_obs$wind_mph ~ hurr_obs$pressure)
```

```
summary(cor)

Call:
lm(formula = hurr_obs_sort$wind_mph ~ hurr_obs_sort$pressure)

Residuals:
    Min      1Q  Median      3Q     Max 
-66.141  -5.452   0.302   6.056  64.863 

Coefficients:
                          Estimate  Std. Error t value            Pr(>|t|)    
(Intercept)            1601.520679    2.953963   542.2 <0.0000000000000002 ***
hurr_obs_sort$pressure   -1.553320    0.002973  -522.5 <0.0000000000000002 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 10.1 on 33084 degrees of freedom
  (43473 observations deleted due to missingness)
Multiple R-squared:  0.8919,	Adjusted R-squared:  0.8919 
F-statistic: 2.73e+05 on 1 and 33084 DF,  p-value: < 0.00000000000000022
```

Looks like there is a strong relationship, let's look at the the scatter plots.

To create this chart run [charts_all.R](charts_all.R) in R studio.
```
source(paste(repo_loc,"charts_all.R", sep = "/"))
```

<img alt="Wind vs pressure for all basins" src="../master/charts/all_scatter_pressure_and_wind.png?raw=true" width="60%" height="60%" >

Looks like a very strong relationship.

We downloaded both the Western Atlantic and Eastern Pacific basins.  Let's make sure we see the same relationships in the individual basins.

To create these charts run [charts_basins_all.R](charts_basins_all.R) in R studio.
```
source(paste(repo_loc,"charts_basins_all.R", sep = "/"))
```

<img alt="wind vs pressure for Western Atlantic" src="../master/charts/Western_Atlantic_scatter_pressure_wind.png?raw=true" width="60%" height="60%" >

<img alt="wind vs pressure for Eastern Pacific" src="../master/charts/Eastern_Pacific_scatter_pressure_wind.png?raw=true" width="60%" height="60%" >


[Previous page](2nd.md) | [Next page](4th.md)

[Last page](last.md)
