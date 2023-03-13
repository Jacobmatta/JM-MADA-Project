# Analysis script for 31701 zip code 

#library
library(here)
library(readxl) #for loading Excel files
library(dplyr) #for data processing/cleaning
library(tidyr)

# Loading the data

## Loading September 31701
data_location1 = here("data", "processed_data", "Sept", "processed_data_31701_sept.rds")
prcessed_data_31701_sept = readRDS(data_location1)

## Loading October 31701
data_location1 = here("data", "processed_data", "Oct", "processed_data_31701_Oct.rds")
prcessed_data_31701_Oct = readRDS(data_location1)

## Loading December 31701
data_location1 = here("data", "processed_data", "Oct", "processed_data_31701_Oct.rds")
prcessed_data_31701_sept = readRDS(data_location1)

filename <- file.choose()
Canteen_clean <- readRDS(filename)