#### Preamble ####
# Purpose: Sanity check of the data
# Author: Richard Guo
# Date: 26 September 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/raw_data/simulated.csv")

# Test ticket count for negative numbers
data$ticket_count |> min() < 0

# Test divisions for NAs
all(is.na(data$division))

# Test offence category for NAs
all(is.na(data$offence_category))

# Test hood id for negative numbers
data$hood_id |> min() < 0

# Test that offence year is within range
data$offence_year |> min() < 2014 
data$offence_year |> max() > 2023




