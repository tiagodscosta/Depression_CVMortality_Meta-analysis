# Depression_CVMortality_Meta-analysis
This repository contains example code for the manuscript: "Cardiovascular mortality and depression: A systematic review and meta-analysis of the association with antidepressant treatment and co-morbidity"

Preprint not peer reviewed available here: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5272205

## Structure

- `data/` – Contains CSV with the example structure for datasets used in the meta-analysis (see notes on data sharing).
- `code/` – Contains R scripts for statistical analysis using the `meta`, `metafor`, and `dmetar` packages.

## Statistical Analysis Summary

All analyses were conducted in R (v4.3.0). The following meta-analytic models were used:

- **Unadjusted mortality estimates** were pooled from raw binary data using `metabin()` with Mantel-Haenszel random-effects models.
- **Adjusted hazard ratios** from multivariable models were pooled using `metagen()` with log-transformed HRs and Knapp-Hartung confidence intervals.
- **Between-study variance** was estimated using the Paule-Mandel estimator (`method.tau = "PM"`), and prediction intervals were reported.
- **Publication bias** was assessed via funnel plots and Egger’s tests (`metabias()`), where k ≥ 10.
- **Influence and outlier diagnostics** were performed using `InfluenceAnalysis()` and `find.outliers()` from the `{dmetar}` package.
- **Subgroup analyses** were conducted using the `subgroup` argument in `update()` for population characteristics, depression/treatment definitions, and risk of bias.

See the representative scripts ('code/') for condensed examples.

## Citation

Analytical methods followed:

> Harrer, M., Cuijpers, P., Furukawa, T.A., & Ebert, D.D. (2021). Doing Meta-Analysis with R: A Hands-On Guide. Boca Raton, FL and London: Chapman & Hall/CRC Press. ISBN 978-0-367-61007-4. Available at: https://bookdown.org/MathiasHarrer/Doing_Meta_Analysis_in_R/

## Data Availability

The raw data used to run the meta-analytic models can be shared upon reasonable request to Tiago.da-Silva-Costa@newcastle.ac.uk.

## License

This repository is made available for academic use under a GPL license.
