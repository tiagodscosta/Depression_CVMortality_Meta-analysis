# meta_analysis_summary.R
# Summary meta-analysis script for CV mortality and depression

library(meta)
library(metafor)
library(dmetar)
library(tidyverse)

# === Load data ===
# Replace 'input.csv' with actual dataset path
data <- read.csv("data/input.csv")

# === Meta-analysis from raw binary data (unadjusted) ===
m.raw <- metabin(event.e = data$event.e, n.e = data$n.e,
                 event.c = data$event.c, n.c = data$n.c,
                 studlab = data$author,
                 sm = "RR", method = "MH", MH.exact = TRUE,
                 random = TRUE, prediction = TRUE,
                 method.tau = "PM", method.random.ci = "HK")

# === Meta-analysis from adjusted models ===
m.adj <- metagen(TE = log(data$TE), lower = log(data$lower),
                 upper = log(data$upper), studlab = data$author,
                 sm = "HR", random = TRUE, prediction = TRUE,
                 method.tau = "PM", method.random.ci = "HK")

# === Forest and Funnel Plots ===
forest(m.adj, sortvar = data$TE, comb.random = TRUE,
       prediction = TRUE, smlab = "Hazard ratio")

funnel(m.adj, xlab = "Log HR", ylab = "Standard Error",
       pch = 16, col = "blue", bg = "lightblue")

# === Influence Analysis ===
inf <- InfluenceAnalysis(m.adj, random = TRUE)
plot(inf, "es")
plot(inf, "i2")

# === Subgroup Analysis Example ===
update(m.adj, subgroup = data$pop, tau.common = FALSE)
