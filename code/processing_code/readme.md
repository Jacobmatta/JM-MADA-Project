This folder contains information regarding the files processingcode1.qmd, processingcode1.R,processingcode2.qmd, and processingcode2.R

------------------------------------------------------------------------
# processingcode1.qmd and processingcode1.R 

The code contains the processing code used to clean the weekly data downloaded from [here](https://www.arcgis.com/home/item.html?id=17a8a4af79e5453a9132aaa29fb4ad22). 

## Filtering

I am filtering data by county because the data contains all counties of Georgia and for this project I am only interested in working with data from Dougherty county, being the county that the city Albany, GA is in.

##replacing negative values with 0
------------------------------------------------------------------------
# processingcode2.qmd and processingcode2.R 

These two files contain the code used to determine whether the data contains vaccinations per 100,000 or if the vaccinations are not saved as rates 

## Plan

To sum the amount of resident vaccinations with at least one dose and compare to the the number of residents with at least one as of Feb 26th 