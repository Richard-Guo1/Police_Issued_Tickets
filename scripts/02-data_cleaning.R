#### Preamble ####
# Purpose: Cleans the raw ticket data into an analysis dataset
# Author: Richard Guo
# Date: 21 September 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

### 
# The following code was written with help from various guides from
# https://www.statology.org/r-guides/
###

# Remove poorly documented data
cleaned_data <- subset(raw_data, DIVISION != "NSA" & HOOD_158 != "NSA")

# Remove non-relevant information
cleaned_data <- cleaned_data %>% select(-c(X_id, TICKET_TYPE, AGE_GROUP,
                                           NEIGHBOURHOOD_158))

# Rename column names
names(cleaned_data) <- c("Offence Year", "Division", "Offence Category",
                         "Neighbourhood Number", "Ticket Count")

# Create a subset detailing only speeding data
speeding_subset = subset(cleaned_data, 
                         cleaned_data$`Offence Category` == "Speeding")  

### Generate a table of Speeding tickets by district by year ###
#Initialize dummy table
speeding_table = tibble(Neighbourhood = 1:174, `2014`=1,`2015`=1, `2016`=1,`2017`=1, 
                        `2018`=1,`2019`=1, `2020`=1,`2021`=1, `2022`=1,`2023`=1)

#Iteratively fill out table
for(c in 2:11){
  for(hood_number in 1:174){
    temp = subset(speeding_subset, speeding_subset$`Offence Year` == 2012 + c & 
                    speeding_subset$`Neighbourhood Number`== hood_number)
    speeding_table[[c]][[hood_number]] = sum(temp$'Ticket Count')
  }
}

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
write_csv(speeding_subset, "data/analysis_data/speeding_data.csv")
write_csv(speeding_table, "data/analysis_data/speeding_by_district_and_year.csv")
