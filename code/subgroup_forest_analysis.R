# subgroup_forest_analysis.R
# Examples of how subgroup analyses and grouped forest plots were performed

library(meta)
library(dmetar)

# === Load dataset ===
data <- read.csv("data/input.csv")

# === Meta-analysis with grouping variable ===
# For example: population group (general, diabetes, cardio)
m.grouped <- metagen(TE = log(data$TE),
                     lower = log(data$lower),
                     upper = log(data$upper),
                     studlab = data$author,
                     sm = "HR", random = TRUE, prediction = TRUE,
                     method.tau = "PM", method.random.ci = "HK",
                     byvar = data$pop)

# === Grouped forest plot ===
forest(m.grouped,
       sortvar = data$TE,
       comb.fixed = FALSE,
       comb.random = TRUE,
       prediction = TRUE,
       smlab = "Hazard ratio",
       print.tau2 = TRUE,
       print.I2 = TRUE,
       print.I2.ci = TRUE,
       label.left = "↓ CV mortality",
       label.right = "↑ CV mortality",
       leftlabs = c("Author", "TE", "SE"))

# === Subgroup analysis ===
# Example using population type
subgroup_result <- update(m.grouped, subgroup = data$pop, tau.common = FALSE)

# Print subgroup-specific p-values
print(subgroup_result$pval.random.w)

# === Additional subgrouping: by depression assessment method ===
# (Assumes column `depression_dx_method` exists in data)
m.subgrouped <- update(m.grouped, subgroup = data$depression_dx_method, tau.common = FALSE)

# Print subgroup heterogeneity stats
print(m.subgrouped$I2.w)
print(m.subgrouped$tau2.w)
