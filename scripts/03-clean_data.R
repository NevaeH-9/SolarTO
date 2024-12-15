#### Preamble ####
# Purpose: Cleans the raw data downloaded from Open Data Toronto
# Author: Yuanchen Miao
# Date: 3 December 2024
# Contact: vincent.miao@mail.utoronto.ca
# Pre-requisites: The `tidyverse`, `dplyr`, `lubridate` and 'arrow' packages must be installed
                  #The raw data must be downloaded and saved


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")
raw_data$structureid <- gsub(" - ", " ", raw_data$structureid)
mean_system_cost <- mean(raw_data$system_cost, na.rm = TRUE)
mean_annual_electricity_generation_k <- mean(raw_data$annual_electricity_generation_k, na.rm = TRUE)
mean_system_size <- mean(raw_data$system_size, na.rm = TRUE)
mean_annual_ghg_reduction_kg <- mean(raw_data$annual_ghg_reduction_kg, na.rm = TRUE)
mean_roof_size800k <- mean(raw_data$roof_size800k, na.rm = TRUE)

cleaned_data <- 
  raw_data |>
  janitor::clean_names() %>% 
  na.omit(raw_data)%>%
  dplyr::select(structureid, annual_electricity_generation_k, first_year_bill_savings, system_size,payback_period,annual_ghg_reduction_kg, roof_size800k, system_cost)%>%
  filter(!grepl("Building Address Not Found", structureid, ignore.case = TRUE))
filtered_data <- cleaned_data %>%
  filter(system_size != 0)

filtered_data <- filtered_data %>%
  filter(system_cost < mean_system_cost) %>%
  filter(annual_electricity_generation_k < mean_annual_electricity_generation_k) %>%
  filter(annual_ghg_reduction_kg < mean_annual_ghg_reduction_kg) %>%
  filter(system_size < mean_system_size)

filtered_data <- head(filtered_data,5000)
#### Save data ####
write_parquet(filtered_data, "data/02-analysis_data/analysis_data.parquet")
