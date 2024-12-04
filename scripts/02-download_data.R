#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Yuanchen Miao
# Date: 3 December 2024
# Contact: vincent.miao@mail.utoronto.ca
# License: None
# Pre-requisites: [...UPDATE THIS...]
# Any other Package 'opendatatoronto' must be installed and loaded



#### Download data ####
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("solarto")
package

# get all resources for this package
resources <- list_package_resources("solarto")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#### Save Data ####
write_csv(data, "inputs/data/raw_data.csv") 

         
