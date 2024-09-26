#### Preamble ####
# Purpose: Simulates data of police tickets by neighborhood
# Author: Richard Guo
# Date: 21 September 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(777)

# Define the start and end date
start_year <- 2014
end_year <- 2023

# Define the number of unique districts in Toronto
districts <- 174

# Define a list of possible ticketable offences 
offences <- c("Speeding", "Aggressive Driving", "Distracted Driving", 
              "All CAIA", "Other HTA")

# Set the number of random tickets you want to generate
number_of_tickets <- 500

sim_data <-
  tibble(
    offence_year = sample(
      start_year:end_year,
      number_of_tickets,
      replace = TRUE
    ),
    division = paste(
      "D",
      as.character(
        runif(
          number_of_tickets,
          1,
          50
        )
      ),
      sep = ""
    ),
    offence_category = sample(offences, number_of_tickets, replace = TRUE),
    hood_id = as.integer(
      runif(
        number_of_tickets,
        1,
        districts + 1
      )
    ),
    ticket_count = rpois(n = number_of_tickets, lambda = 200)
  )


#### Write_csv
write_csv(sim_data, file = "data/raw_data/simulated.csv")
