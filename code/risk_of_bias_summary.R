# risk_of_bias_summary.R
# Example code for visualising risk of bias using robvis

library(dmetar)
library(robvis)
library(ggplot2)
library(tidyr)
library(dplyr)

# === Load data ===
# For RCTs (RoB 2)
rob2_data <- read.csv("data/risk_bias_RCT.csv")
rob_summary(data = rob2_data, tool = "ROB2", overall = TRUE)
rob_traffic_light(data = rob2_data, tool = "ROB2", psize = 8)

# For cohort studies (ROBINS-I)
robins_data <- read.csv("data/risk_bias_cohort.csv")
rob_summary(data = robins_data, tool = "ROBINS-I", overall = TRUE)
rob_traffic_light(data = robins_data, tool = "ROBINS-I", psize = 4)
