#### Preamble ####
# Purpose: Simulates a dataset of SolarTo including the object id, roof size and annual electricity generation, system cost, first year bill savings, payback period and annual ghg reduction.
# Author: Yuanchen Miao
# Date: 3 December 2024
# Contact: vincent.miao@mail.utoronto.ca
# Pre-requisites: The `tidyverse` and "dplyr" package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(dplyr)
set.seed(517)

# Number of rows to generate
n <- 100  

#Simulates data
simulated_data <- data.frame(
  object_id = 1:n,
  roof_size800k = sample(1:150, n, replace = TRUE),
  annual_electricity_generation = sample(50:15000, n, replace = TRUE),
  system_cost = sample(5000:50000, n, replace = TRUE),
  first_year_bill_savings = sample(1:1000, n, replace = TRUE),
  payback_period = sample(5:10, n, replace = TRUE),
  annual_ghg_reduction = sample(1:500, n, replace = TRUE)
)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")