#determining whether the data is per 100K or single counts of vaccinations 

#the count of residents in GA with at least one dose of the covid-19 vaccines is 6,935,491

#the count can be found here https://outlookuga-my.sharepoint.com/personal/jrthapa_uga_edu/_layouts/15/onedrive.aspx?FolderCTID=0x012000EA7894D56E25AD4AA0284A71A1248429&id=%2Fpersonal%2Fjrthapa%5Fuga%5Fedu%2FDocuments%2FProject%5FHealth%20Literacy%20Program%20Evaluation

#library 
library(here)
library(readxl) #for loading Excel files
library(dplyr) #for data processing/cleaning
library(tidyr) #for data processing/cleaning

#loading data and looking at the data using glimpse()
rawdata_location = here("data","raw_data","Feb_26.xlsx")
Feb_26 <- read_excel(rawdata_location)

#dropping columns that i don't need
#keeping county name to group data together 
Feb_26 <- Feb_26[-c(1:3)]

#removing all of the population data 
Feb_26 = Feb_26[-c(3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101, 103, 105, 107, 109, 111, 113, 115, 117, 119, 121, 123, 125, 127, 129, 131, 133, 135, 137, 139, 141, 143, 145, 147, 149, 151, 153, 155, 157, 159, 161, 163, 165, 167, 169, 171, 173, 175, 177, 179, 181.)]
Feb_26[-c(1)]
#summing variables 
Sum_feb26 = Feb_26 %>% rowwise() %>%  mutate(Total_vax = sum(c(UAsianNHPI_05_09_VAX)))

colnames(Feb_26)

## row wise sum using dplyr 
library(dplyr)

my_basket %>%
  rowwise() %>%
  mutate(
    Total_price = sum(c(Price,Tax))
  )

