#### Preamble ####
# Purpose: Downloads the data of police tickets from Open Data Toronto
# Author: Richard Guo
# Date: 21 September 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("police-annual-statistical-report-tickets-issued")
package

# get all resources for this package
resources <- list_package_resources("police-annual-statistical-report-tickets-issued")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data