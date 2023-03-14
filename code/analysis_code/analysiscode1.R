# Analysis script for 31701 zip code for the total African American Population

#library
library(here)
library(readxl) #for loading Excel files
library(dplyr) #for data processing/cleaning
library(tidyr)
library(ggplot2)

# Loading the data

# Loading September 31701
data_location1 = here("data", "processed_data", "Sept", "processed_data_31701_Sept.rds")
processed_data_31701_Sept = readRDS(data_location1)

# Loading October 31701 and joining september and october 
data_location2 = here("data", "processed_data", "Oct", "processed_data_31701_Oct.rds")
processed_data_31701_Oct = readRDS(data_location2)
processed_combined <- left_join(processed_data_31701_Sept, processed_data_31701_Oct, by = c("FIPS" = "FIPS"))

# Loading November 31701
data_location3 = here("data", "processed_data", "Nov", "processed_data_31701_Nov.rds")
processed_data_31701_Nov = readRDS(data_location3)
processed_combined <- left_join(processed_combined, processed_data_31701_Nov, by = c("FIPS" = "FIPS"))

# Loading December 31701
data_location4 = here("data", "processed_data", "Dec", "processed_data_31701_Dec.rds")
processed_data_31701_Dec = readRDS(data_location4)
processed_combined <- left_join(processed_combined, processed_data_31701_Dec, by = c("FIPS" = "FIPS"))

# Loading January 31701
data_location5 = here("data", "processed_data", "Jan", "processed_data_31701_Jan.rds")
processed_data_31701_Jan = readRDS(data_location5)
processed_combined <- left_join(processed_combined, processed_data_31701_Jan, by = c("FIPS" = "FIPS"))

# Loading February 31701
data_location6 = here("data", "processed_data", "Feb", "processed_data_31701_Feb.rds")
processed_data_31701_Feb = readRDS(data_location6)
processed_combined_31701 <- left_join(processed_combined, processed_data_31701_Feb, by = c("FIPS" = "FIPS"))

# taking a look at the combined data that contains vaccinations by month for African Americans from September through February
View(processed_combined)
processed_combined_31701

# saving the combined data for African Americans for future use 
save_data_location = here("data", "processed_data","Sept", "processed_combined_31701.rds")
saveRDS(processed_combined_31701, file = save_data_location)

# Dropping all variables except for total black variables in order to obtain vaccination rates of all African Americans in the 31701 zip code 
processed_combined_31701_total_black = processed_combined_31701 %>% select(starts_with("total_black_vax"))

#Summing each column for each month 
sum(processed_combined_31701_total_black$total_black_vax_Sept_17) 
sum(processed_combined_31701_total_black$total_black_vax_Oct_28) 
sum(processed_combined_31701_total_black$total_black_vax_Nov_24) 
sum(processed_combined_31701_total_black$total_black_vax_Dec_29) 
sum(processed_combined_31701_total_black$total_black_vax_Jan_26) 
sum(processed_combined_31701_total_black$total_black_vax_Feb_26) 


#Separating into x and y 
Sum_by_month <- data.frame(Date = c("Sep","Oct","Nov","Dec","Jan","Feb"),
                          Total = c(7797, 7780, 7755, 7773, 7792, 7817)) 

##ggplot 
plot_31701_total_black_vax = Sum_by_month %>% 
  ggplot(aes(Date, Total, group=1)) + geom_point() + geom_line() + scale_x_discrete(limits = c("Sep","Oct","Nov","Dec","Jan","Feb"))

Zip_31701_total_black_plot + ggtitle("Vaccination Totals by Month of African Americans in the 31701 Zipcode") + theme(plot.title = element_text(color="red", size=12, face="bold.italic"))

