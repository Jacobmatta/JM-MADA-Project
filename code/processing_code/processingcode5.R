#processing code 5

#library
library(here)
library(readxl) #for loading Excel files
library(dplyr) #for data processing/cleaning
library(tidyr) #for data processing/cleaning and looking at the data using glimpse()

# Loading the rawdata containing GA residents with at least one dose of the Covid-19 vaccine
rawdata_location = here("data","raw_data","Jan_26.xlsx")
Jan_26 <- read_excel(rawdata_location)


#loading data code book for reference 
codebook_location = here("data","raw_data","Codebook.xlsx")
codebook = read_excel(codebook_location)

#Summary of data
glimpse(Jan_26)
summary(Jan_26)




########################################################################################cleaning1
#filtering data by county because the data contains all counties of Georgia and for this 
#project I am interested in Dougherty Count, which is where the city of Albany is 
Dougherty_Vax_Jan <- filter(Jan_26, COUNTY_NAME == "Dougherty County")  

#replacing negative values with 0
Dougherty_Vax_Jan [Dougherty_Vax_Jan < 0] <- 0  






########################################################################################cleaning2
##organizing the data then separate into zips and add a zip code column   

#Adding a column of the total vax for each census tract (for each observation)  
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>% mutate(total_vax_Jan = sum(across(ends_with("VAX")), na.rm = T))  

#total vax column for male  
Dougherty_Vax_Jan <- Dougherty_Vax_Jan  %>% rowwise() %>%   
  mutate(total_male_vax = sum(across(starts_with("M") & ends_with("VAX")), na.rm = T))  

#total vax column for female 
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_female_vax = sum(across(starts_with("F") & ends_with("VAX")), na.rm = T))  





########################################################################################cleaning3
#total white, black, asian, other race male 

#total vax column for Asian male residents 
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_masian_vax = sum(across(starts_with("MAsianNHPI") & ends_with("VAX")), na.rm = T))  

#total vax column for African American male residents
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_mblack_vax = sum(across(starts_with("MBlack") & ends_with("VAX")), na.rm = T))  

#total vax column for other race male residents
Dougherty_Vax_Jan<- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_morace_vax = sum(across(starts_with("MOtherRace") & ends_with("VAX")), na.rm = T))  

#total vax column for White male residents 
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_mwhite_vax = sum(across(starts_with("MWhite") & ends_with("VAX")), na.rm = T))  






########################################################################################cleaning4
#total white, black, asain, other race female 

#total vax column for Asian female residents  
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_fasian_vax = sum(across(starts_with("FAsianNHPI") & ends_with("VAX")), na.rm = T))  

#total vax column for African American female residents
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_fblack_vax = sum(across(starts_with("FBlack") & ends_with("VAX")), na.rm = T))  

#total vax column for other race female residents
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_forace_vax = sum(across(starts_with("FOtherRace") & ends_with("VAX")), na.rm = T))  

#total vax column for White female residents 
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>%   
  mutate(total_fwhite_vax = sum(across(starts_with("FWhite") & ends_with("VAX")), na.rm = T))  






########################################################################################cleaning5
#Race totals (male + female )  

#Vax total Asian Residents
Dougherty_Vax_Jan$total_asian_vax <- Dougherty_Vax_Jan$total_masian_vax + Dougherty_Vax_Jan$total_fasian_vax  

#Vax total for African American Residents
Dougherty_Vax_Jan$total_black_vax <- Dougherty_Vax_Jan$total_mblack_vax + Dougherty_Vax_Jan$total_fblack_vax  

#Vax total for Other Race Residents
Dougherty_Vax_Jan$total_orace_vax <- Dougherty_Vax_Jan$total_morace_vax + Dougherty_Vax_Jan$total_forace_vax  

#Vax total for White Residents
Dougherty_Vax_Jan$total_white_vax <- Dougherty_Vax_Jan$total_mwhite_vax + Dougherty_Vax_Jan$total_fwhite_vax  





########################################################################################cleaning6
#Summing for age totals: 05-09, 10-17, 18-44, 45-64, 65+  

#summing all residents in the age range of 05-09
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>% mutate(total_05_09_vax = sum(FAsianNHPI_05_09_VAX, MAsianNHPI_05_09_VAX, UAsianNHPI_05_09_VAX,FBlack_05_09_VAX, MBlack_05_09_VAX, UBlack_05_09_VAX,FNone_05_09_VAX, MNone_05_09_VAX, UNone_05_09_VAX,FOtherRace_05_09_VAX, MOtherRace_05_09_VAX, UOtherRace_05_09_VAX,FWhite_05_09_VAX, MWhite_05_09_VAX, UWhite_05_09_VAX, na.rm = T))  

#summing all residents in the age range of 10-17
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>% mutate(total_10_17_vax = sum(FAsianNHPI_10_17_VAX, MAsianNHPI_10_17_VAX, UAsianNHPI_10_17_VAX,FBlack_10_17_VAX, MBlack_10_17_VAX, UBlack_10_17_VAX,FNone_10_17_VAX, MNone_10_17_VAX, UNone_10_17_VAX,FOtherRace_10_17_VAX, MOtherRace_10_17_VAX, UOtherRace_10_17_VAX,FWhite_10_17_VAX, MWhite_10_17_VAX, UWhite_10_17_VAX, na.rm = T))  

#summing all residents in the age range of 18-44
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>% mutate(total_18_44_vax = sum(FAsianNHPI_18_44_VAX, MAsianNHPI_18_44_VAX, UAsianNHPI_18_44_VAX,FBlack_18_44_VAX, MBlack_18_44_VAX, UBlack_18_44_VAX,FNone_18_44_VAX, MNone_18_44_VAX, UNone_18_44_VAX,FOtherRace_18_44_VAX, MOtherRace_18_44_VAX, UOtherRace_18_44_VAX,FWhite_18_44_VAX, MWhite_18_44_VAX, UWhite_18_44_VAX, na.rm = T))  

#summing all residents in the age range of 45-64
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>% mutate(total_45_64_vax = sum(FAsianNHPI_45_64_VAX, MAsianNHPI_45_64_VAX, UAsianNHPI_45_64_VAX,FBlack_45_64_VAX, MBlack_45_64_VAX, UBlack_45_64_VAX,FNone_45_64_VAX, MNone_45_64_VAX, UNone_45_64_VAX,FOtherRace_45_64_VAX, MOtherRace_45_64_VAX, UOtherRace_45_64_VAX,FWhite_45_64_VAX, MWhite_45_64_VAX, UWhite_45_64_VAX, na.rm = T))  

#summing all residents in the age range of 65+ 
Dougherty_Vax_Jan <- Dougherty_Vax_Jan %>% rowwise() %>% mutate(total_65Plus_vax = sum(FAsianNHPI_65Plus_VAX, MAsianNHPI_65Plus_VAX, UAsianNHPI_65Plus_VAX,FBlack_65Plus_VAX, MBlack_65Plus_VAX, UBlack_65Plus_VAX,FNone_65Plus_VAX, MNone_65Plus_VAX, UNone_65Plus_VAX,FOtherRace_65Plus_VAX, MOtherRace_65Plus_VAX, UOtherRace_65Plus_VAX,FWhite_65Plus_VAX, MWhite_65Plus_VAX, UWhite_65Plus_VAX, na.rm = T))  





########################################################################################cleaning7
#Extract necessary variables only  
Dougherty_Vax_Jan_sums <- Dougherty_Vax_Jan[,c(1:4,185:204)]  






########################################################################################cleaning8
#filtering data by zip: 31701  
Zip_31701_Jan<-filter(Dougherty_Vax_Jan_sums,FIPS=="13095000700" | FIPS=="13095000800" | FIPS=="13095001403" | FIPS=="13095001500" | FIPS=="13095010601" | FIPS=="13095011300" | FIPS=="13095011400" | FIPS=="13095010602")  

#filtering data by zip: 31705  
Zip_31705_Jan <- filter(Dougherty_Vax_Jan_sums, FIPS=="13095000100" | FIPS=="13095000200" | FIPS=="13095010302" | FIPS=="13095010700" | FIPS=="13095010900" | FIPS=="13095011000" | FIPS=="13095011200" | FIPS=="13095011600")  

#filtering data by zip: 31707  
Zip_31707_Jan <- filter(Dougherty_Vax_Jan_sums, FIPS=="13095000400" | FIPS=="13095000501" | FIPS=="13095000502" | FIPS=="13095000600" | FIPS=="13095000900" | FIPS=="13095001000" | FIPS=="13095001100")  






########################################################################################cleaning9
#Change the column names for 31701 Jan  
colnames(Zip_31701_Jan) <- c("FIPS", "GEONAME", "COUNTY_ID", "COUNTY_NAME", "total_vax_Jan_26", "total_male_vax_Jan_26", "total_female_vax_Jan_26", "total_masian_vax_Jan_26", "total_mblack_vax_Jan_26", "total_morace_vax_Jan_26", "total_mwhite_vax_Jan_26", "total_fasian_vax_Jan_26", "total_fblack_vax_Jan_26", "total_forace_vax_Jan_26", "total_fwhite_vax_Jan_26", "total_asian_vax_Jan_26","total_black_vax_Jan_26", "total_orace_vax_Jan_26", "total_white_vax_Jan_26", "total_05_09_vax_Jan_26", "total_10_17_vax_Jan_26", "total_18_44_vax_Jan_26", "total_45_64_vax_Jan_26", "total_65Plus_vax_Jan_26") 

#change column names for 31705 Jan  
colnames(Zip_31705_Jan) <- c("FIPS", "GEONAME", "COUNTY_ID", "COUNTY_NAME", "total_vax_Jan_26", "total_male_vax_Jan_26", "total_female_vax_Jan_26", "total_masian_vax_Jan_26", "total_mblack_vax_Jan_26", "total_morace_vax_Jan_26", "total_mwhite_vax_Jan_26", "total_fasian_vax_Jan_26", "total_fblack_vax_Jan_26", "total_forace_vax_Jan_26", "total_fwhite_vax_Jan_26", "total_asian_vax_Jan_26","total_black_vax_Jan_26", "total_orace_vax_Jan_26", "total_white_vax_Jan_26", "total_05_09_vax_Jan_26", "total_10_17_vax_Jan_26", "total_18_44_vax_Jan_26", "total_45_64_vax_Jan_26", "total_65Plus_vax_Jan_26") 

#change column names for 31707 Jan  
colnames(Zip_31707_Jan) <- c("FIPS", "GEONAME", "COUNTY_ID", "COUNTY_NAME", "total_vax_Jan_26", "total_male_vax_Jan_26", "total_female_vax_Jan_26", "total_masian_vax_Jan_26", "total_mblack_vax_Jan_26", "total_morace_vax_Jan_26", "total_mwhite_vax_Jan_26", "total_fasian_vax_Jan_26", "total_fblack_vax_Jan_26", "total_forace_vax_Jan_26", "total_fwhite_vax_Jan_26", "total_asian_vax_Jan_26","total_black_vax_Jan_26", "total_orace_vax_Jan_26", "total_white_vax_Jan_26", "total_05_09_vax_Jan_26", "total_10_17_vax_Jan_26", "total_18_44_vax_Jan_26", "total_45_64_vax_Jan_26", "total_65Plus_vax_Jan_26") 






#######################################################################saving 
##deleting excess variables 
rm(Dougherty_Vax_Jan,Jan_26, codebook, Dougherty_Vax_Jan_sums) 

#saving clean data to processed_data folder: 31701
save_data_location = here("data", "processed_data","Jan", "processed_data_31701_Jan.rds")
saveRDS(Zip_31701_Jan, file = save_data_location)

#saving clean data to processed_data folder: 31705
save_data_location2 = here("data", "processed_data","Jan", "processed_data_31705_Jan.rds")
saveRDS(Zip_31705_Jan, file = save_data_location2)

#saving clean data to processed_data folder: 31707
save_data_location3 = here("data", "processed_data", "Jan", "processed_data_31707_Jan.rds")
saveRDS(Zip_31707_Jan, file = save_data_location3)