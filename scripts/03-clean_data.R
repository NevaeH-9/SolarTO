#### Preamble ####
# Purpose: Cleans the raw data downloaded from Open Data Toronto
# Author: Yuanchen Miao
# Date: 3 December 2024
# Contact: vincent.miao@mail.utoronto.ca
# Pre-requisites: The `tidyverse`, `dplyr`, `lubridate` packages must be installed
                  #The raw data must be downloaded and saved

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")
raw_data$structureid <- gsub(" - ", " ", raw_data$structureid)
raw_data <- head(raw_data, 5000)

cleaned_data <- 
  raw_data |>
  janitor::clean_names() %>% 
  na.omit(raw_data)%>%
  dplyr::select(structureid, annual_electricity_generation_k, first_year_bill_savings, system_size,payback_period,annual_ghg_reduction_kg, roof_size800k, system_cost)%>%
  filter(!grepl("Building Address Not Found", structureid, ignore.case = TRUE))

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")
