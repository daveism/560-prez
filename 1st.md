[Next page](2nd.md)
# Investigating Hurricanes with hurdat2 data and R - Reproducible Research.

## https://github.com/daveism/560-prez/

Reproducible research simple means, anyone should be able to reproduce the results of your study.  There are many ways to accomplish reproducible research.  I really believe it should include the publishing of data and any code you used, so anyone with the right motivation should be to get the same results as you.  More importantly, anyone should be able to provide feedback and improvements to your work in an open and transparent way. 

The following uses R and Github to import, clean, and investigate data associated with Hurricanes, while demonstrating one take on the practice of reproducible research.

## A little backgound

NOAA's National Hurricane Center publishes historical hurricane data in the hurdat2 format.
The complete list of available data is here:
http://www.aoml.noaa.gov/hrd/hurdat/Data_Storm.html

The Official documentation for the hurdat2 format can be found at   http://www.aoml.noaa.gov/hrd/hurdat/newhurdat-format.pdf.

*Note: When this data is updated, the file name is also updated and the old file is no longer available.*

So you **MAY** have to update locations to the hurdat2 text files for both the western Atlantic and eastern Pacific - [get_data.R](get_data.R#L7-L8)

[Next page](2nd.md)
