# Analysis script for 31701 zip code 

#library
library(here)
library(readxl) #for loading Excel files
library(dplyr) #for data processing/cleaning
library(tidyr)

# Loading the data

## Loading September 31701
data_location1 = here("data", "processed_data", "Sept", "processed_data_31701_Sept.rds")
processed_data_31701_Sept = readRDS(data_location1)

## Loading October 31701 and joining september and october 
data_location2 = here("data", "processed_data", "Oct", "processed_data_31701_Oct.rds")
processed_data_31701_Oct = readRDS(data_location2)
processed_combined <- left_join(processed_data_31701_Sept, processed_data_31701_Oct, by = c("FIPS" = "FIPS"))

## Loading November 31701
data_location3 = here("data", "processed_data", "Nov", "processed_data_31701_Nov.rds")
processed_data_31701_Nov = readRDS(data_location3)

## Loading December 31701
data_location4 = here("data", "processed_data", "Dec", "processed_data_31701_Dec.rds")
processed_data_31701_Dec = readRDS(data_location4)

## Loading January 31701
data_location5 = here("data", "processed_data", "Jan", "processed_data_31701_Jan.rds")
processed_data_31701_Jan = readRDS(data_location5)

## Loading February 31701
data_location6 = here("data", "processed_data", "Feb", "processed_data_31701_Feb.rds")
processed_data_31701_Feb = readRDS(data_location6)


filename <- file.choose()
Canteen_clean <- readRDS(filename)