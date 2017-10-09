[First page](1st.md)

[Previous page](start.md) | [Next page](3rd.md)
## Getting Started

First you will have to clone or download this repository.

You will have to change THE REPO LOCATION to the location you downloaded or cloned the repository.  This should be the path the folder.  

If the Hurdat2 data has changed you will need to update the locations of the two files in [get_data.R](get_data.R#L7-L8).  

Open R studio

```R
source('THE REPO LOCATION\560-prez\run_hurr.R')
```
The run_hurr.R script will do a whole lot of things for us.
Install all packages [install.R](install.R)

Next  will load, clean, create charts, create maps, and create csv's from the hurdat2 data so we can use it in some basic analysis.  The code that cleans the data is [clean_data_functions.R](clean_data_functions.R)


[Previous page](start.md) | [Next page](3rd.md)

[Last page](last.md)
