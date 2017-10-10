[First page](1st.md)

[Previous page](start.md) | [Next page](3rd.md)
## Getting Started

First you will have to clone or download this repository.

You also need to change THE REPO LOCATION to the location you downloaded or cloned the repository.  This should be the path the folder.  

***Update Hurdat2***

If the Hurdat2 data has changed you will need to update the locations of the two files in [get_data.R](get_data.R#L7-L8).  


***Update repo***

If the Hurdat2 data has changed you will need to update the locations of the two files in [run_hurr.R](run_hurr.R#L1).  

Open R studio

```R
source('THE REPO LOCATION\560-prez\run_hurr.R')
```
The [run_hurr.R](run_hurr.R) script will do a whole lot of things for us.
- Set some varriables
- Install all the packages we need [install.R](install.R)
- Load functions for cleaning the data [clean_data_functions.R](clean_data_functions.R)
- Get, clean, and prepare the data [get_data.R](get_data.R)
- Load functions to create maps [map_functions.R](map_functions.R)
- Load functions to create charts [chart_functions.R](chart_functions.R)
- Write csv data [write_csv.R](write_csv.R)
- Create Plots [.R](.R)

- Create track maps and graphs [.R](.R).  This is not run automtically you will have to run this seperately and it takes a while. 


[Previous page](start.md) | [Next page](3rd.md)

[Last page](last.md)
