# Factors of First-Year Financial Savings in Solar Photovoltaic Systems: Data from Open Data Toronto and SolarOT Map

## Overview

This repo examines the factors affect first-year financial savings for solar photovoltaic (PV) systems using data from Open Data Toronto and the SolarOT Map application. A multiple linear regression model identifies how variables such as payback period, roof size, system cost, electricity generation, and greenhouse gas (GHG) reduction influence initial bill savings. The analysis finds that payback period, roof size, and system cost are significant predictors of first-year savings, while electricity generation and GHG reduction are not. These findings clarify the financial and physical conditions that maximize early solar benefits that can help improve system design, inform policy, and accelerate the adoption of renewable energy technologies
## File Structure

The repo is structured as follows:

-   `data` contains all data
-   `models` contains the multiple linear regression model that is fitted
-   `other` contains details about LLM chat interactions, sketches, and a datasheet for the raw data.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean data and model fitting .

## Statement on LLM Usage

Including code for unit testing, data cleaning, and data visualization, were created with the assistance of ChatGPT 4o. The details of these interactions are recorded in `other/llm/usage.txt`.
