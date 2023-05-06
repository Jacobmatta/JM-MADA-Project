# Introduction

Hello and welcome to Jacob Matta's Course Project for Modern Applied Data Analysis at the University of Georgia. This document provides an outline for the creation of my project broken down by reproducibility steps and by project parts (parts1-6).

# Brief Summary

This study aims to conduct a secondary analysis of residents of the black community in Albany, GA that have received at least one dose of the COVID-19 vaccine from September 2022 through February 2023 and live in the one of the three zip codes 31701, 31705 and 31707. The outcome of interest is the difference in vaccination rates by month from September through February. The predictor of interest is the presence of a COVID-19 Vaccine Hesitancy Program Intervention.

## Part 1: Outline of project

-   `Manuscript.qmd` File: Outline of this research project

-   `supplement.qmd` File: Supplemental information and reproducibility information

## Part 2: Data Processing

-   `data` folder: Contains: Contains `raw_data` folder and `processed_data` folder

-   `code` folder:`processing_code` folder which contains the code for data processing

## Part 3: Exploratory Analysis

-   `code` folder:`analysis_code` folder which contains the code for data analysis
-   `analysis_code` folder: contains code for the exploratory analysis which can be found in the `exploratoryanalysis.qmd` file

## Part 4: Statistical Analysis

-   `code` folder:`analysis_code` folder which contains the code for data analysis
-   `analysis_code` folder: contains code for the exploratory analysis which can be found in the `statisticalanalysis.qmd` file

## Part 5: Review

-   `reviews`: Folder that contains three reveiws from classmates

## Repoduction steps

1.  Render `Manuscript.qmd` file in the `products` folder

2.  Render `supplement.qmd` file for a brief description of every file in this project

3.  Render each `.qmd` file in the `processing_code` folder

4.  Render the `exploratoryanalysis.qmd` file in the `analysis_code` folder

5.  Render the `statisticalanalysis.qmd` file in the `analysis_code` folder

## Variable Description for Processed Data Set Used in Analysis

+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Variable                          | Description                                                                                                                           |
+===================================+=======================================================================================================================================+
| Date                              | Month of the COVID-19 vaccination rate                                                                                                |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| TOTAL_VAX_RATE                    | The COVID-19 vaccination rate of the black population                                                                                 |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Intervention                      | 0 = Zip Codes without COVID-19 vaccine hesitancy and health literacy program (30815 or 30907)                                         |
|                                   |                                                                                                                                       |
|                                   | 1 = Zip Codes with COVID-19 vaccine hesitancy and health literacy program (31701, 31705 and 31707)                                    |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Male_VAX_RATE                     | The COVID-19 vaccination rate of the black males                                                                                      |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Female_VAX_RATE                   | The COVID-19 vaccination rate of the black females                                                                                    |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Age_05_09_VAX_RATE                | The COVID-19 vaccination rate of the black population in the age ranges of 5-9 years of age                                           |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Age_10_17_VAX_RATE                | The COVID-19 vaccination rate of the black population in the age ranges of 10-17 years of age                                         |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Age_18_44_VAX_RATE                | The COVID-19 vaccination rate of the black population in the age ranges of 18-44 years of age                                         |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Age_45_64_VAX_RATE                | The COVID-19 vaccination rate of the black population in the age ranges of 45-64 years of age                                         |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Age_65Plus_VAX_RATE               | The COVID-19 vaccination rate of the black population in the age ranges of 65+ years of age                                           |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| TOTAL_RATE_DIFF                   | The COVID-19 vaccination rate difference by month. A positive value indicates an increase while a negative value indicates a decrease |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| POP_n                             | Population of Black residents in zip code                                                                                             |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Vac_n                             | Vaccination totals of Black residents in zip code                                                                                     |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------+
