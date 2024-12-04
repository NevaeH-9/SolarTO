#### Preamble ####
# Purpose: Tests the structure and validity of the simulated SolarTO dataset
# Author: Yuanchen Miao
# Date: 3 December 2024
# Contact: vincent.miao@mail.utoronto.ca
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 100 rows
if (nrow(analysis_data) == 100) {
  message("Test Passed: The dataset has 100 rows.")
} else {
  stop("Test Failed: The dataset does not have 100 rows.")
}

# Check if the dataset has 7 columns
if (ncol(analysis_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if all values in the 'object_id' column are unique
if (n_distinct(analysis_data$object_id) == nrow(analysis_data)) {
  message("Test Passed: All values in 'object_id' are unique.")
} else {
  stop("Test Failed: The 'object_id' column contains duplicate values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}
