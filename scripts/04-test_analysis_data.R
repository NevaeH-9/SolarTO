#### Preamble ####
# Purpose: Tests the analysis data
# Author: Yuanchen Miao
# Date: 3 December 2024
# Contact: vincent.miao@mail.utoronto.ca

# Pre-requisites: Packages 'tidyverse' and 'testthat' must be installed
                  #raw_data must be cleaned and saved as analysis data


#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")


#### Test data ####
# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

# Test that the 'structure id' column is double type
test_that("'structure_id' is character", {
  expect_type(analysis_data$structureid, "character")
})

# Test that the 'roofsize_800k' column is double type
test_that("'roofsize_800k' is double", {
  expect_type(analysis_data$roof_size800k, "double")
})

# Test that the 'annual_electricity_generation_k' column is double type
test_that("'annual_electricity_generation_k' is double", {
  expect_type(analysis_data$annual_electricity_generation_k, "double")
})

# Test that the 'first_year_bill_savings' column is double type
test_that("'first_year_bill_savings' is double", {
  expect_type(analysis_data$first_year_bill_savings, "double")
})

# Test that the 'system_size' column is double type
test_that("'system_size' is double", {
  expect_type(analysis_data$system_size, "double")
})

# Test that the 'payback_period' column is double type
test_that("'payback_period' is double", {
  expect_type(analysis_data$payback_period, "double")
})

# Test that the 'annual_ghg_reduction_kg' column is double type
test_that("'annual_ghg_reduction_kg' is double", {
  expect_type(analysis_data$annual_ghg_reduction_kg, "double")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that 'structureid' contains unique values (no duplicates)
test_that("'structureid' column contains unique values", {
  expect_equal(length(unique(analysis_data$structureid)), nrow(analysis_data))
})

# Test that there are no empty strings in 'structureid'
test_that("no empty strings in 'structureid' columns", {
  expect_false(any(analysis_data$structureid == ""))
})
