#### Preamble ####
# Purpose: Fit bayesian logistic regression model with all of the structure data
# Author: Yuanchen Miao
# Date: 3 December 2024
# Contact: vincent.miao@mail.utoronto.ca
# Pre-requisites: data must be cleaned and tested


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")

# Fit the multiple linear regression model
mlr_model <- lm(first_year_bill_savings ~ 
                  payback_period + 
                  roof_size800k + 
                  system_cost +
                  annual_electricity_generation_k +
                  annual_ghg_reduction_kg,
                data = analysis_data)

summary(mlr_model)
#### Save model ####
saveRDS(
  mlr_model,
  file = "models/mlr_model.rds"
)
