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
cleaned_data <- cleaned_data %>% select(-c(X_id, DIVISION,
                                           TICKET_TYPE, NEIGHBOURHOOD_158))

# Rename column names
names(cleaned_data) <- c("Offence Year", "Offence Category", "Age Group", 
                         "District Number", "Ticket Count")


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
