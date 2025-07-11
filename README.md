# Time Series Analysis

This repository contains solutions and analysis for graduate work, involving datasets related to Winnebago RV sales, UK retail sales, and US prescription costs. The main tasks involve visualization, regression modeling, residual diagnostics, and statistical testing of time series data.

---

## Winnebago Monthly Unit Sales (Nov 1966 – Feb 1972)

### (a) Time Series Plot Interpretation
- Both the moving average and variance increase over time.
- Clear seasonality: dips in sales during October to January each year.

### (b) Least Squares Linear Fit on Raw Data
- Homoscedasticity assumption violated: variance fans out over time.
- Standardized residuals show increasing spread, indicating model inadequacy.

### (c) Log Transformation and Plot
- Logarithm reduces skewness, especially in later months.
- The trend appears more linear and less exponential.

### (d) Least Squares Fit on Logged Data
- Residual plot shows improved homoscedasticity.
- Residuals lack clear pattern and no extreme outliers, indicating better model fit.

### (e) Seasonal-Means Plus Linear Trend Model (Logged Data)
- Most months significantly differ from January, except Oct, Nov, Dec.
- Spring and summer months show largest positive seasonal effects.

### (f) Residual Plot from Seasonal Trend Model
- Residuals show no pattern; homoscedasticity assumption is met.
- A single spike above 3 standard deviations does not invalidate the model.

---

## UK Retail Sales (Jan 1986 – Mar 2007)

### (a) Time Series Plot
- Clear peaks in November and December, indicating seasonal spikes.
- Plotting symbols used to identify seasonal patterns.

### (b) Seasonal-Means Plus Linear Trend Model
- All months but March significantly differ from January.
- High model fit: Adjusted R² = 0.9755, explaining ~97.5% variance.

### (c) Residual Plot Analysis
- Residuals show some seasonal pattern and possible quadratic curvature.
- Negative outliers early, positive outliers later in the series.

---

## US Prescription Costs (Aug 1986 – Mar 1992)

### (a) Time Series Plot
- Prescription costs dip in winter months (Dec, Jan, Feb).
- Costs increase linearly over time.

### (b) Month-to-Month Percentage Changes
- Positive percentage changes dominate.
- Seasonal pattern resembling a sinusoidal wave: increases in summer, decreases later months.

### (c) Cosine Trend Model on Percentage Changes
- Cosine term insignificant (p > 0.05), sine term significant.
- Low R² indicates limited explanatory power.

### (d) Residual Analysis of Cosine Model
- Residuals have consistent variance, within ±2 standard deviations.
- Model fit considered adequate.

---

## Winnebago Residual Diagnostics

### (a) Residuals from Seasonal Means + Linear Trend (Logged Data)
- Standardized residuals obtained.

### (b) Runs Test
- Observed runs fewer than expected → evidence of autocorrelation.
- p-value < 0.05 confirms lack of independence.

### (c) Autocorrelation Function (ACF)
- Significant autocorrelations at multiple lags.
- Confirms time dependence.

### (d) Normality Check
- Histogram and Q-Q plot mostly normal.
- One negative outlier noted.
- Overall normality assumption reasonable.

---

## UK Retail Sales Residual Diagnostics

### (a) Residuals from Seasonal Means + Linear Trend
- Standardized residuals collected.

### (b) Runs Test
- Fewer runs observed than expected; p-value < 0.05.
- Indicates autocorrelation.

### (c) ACF Analysis
- Significant autocorrelations detected.

### (d) Normality Check
- Histogram roughly bell-shaped.
- Q-Q plot shows heavy tails → residuals deviate from normal.
- Suggests a heavier-tailed distribution (e.g., t-distribution) may be better.

---

## Prescription Costs Residual Diagnostics

### (a) Residuals from Cosine Trend Model
- Standardized residuals obtained.

### (b) Runs Test
- More runs observed than expected; p-value < 0.05.
- Indicates autocorrelation.

### (c) ACF Analysis
- Significant autocorrelations present.

### (d) Normality Check
- Histogram bell-shaped.
- Q-Q plot indicates slightly lighter tails than normal.
- Normality assumption reasonable.

---

# Summary

This set of exercises highlights the importance of:

- Transformations (e.g., log) to stabilize variance and improve model fit.
- Including seasonal components in time series models.
- Residual diagnostics: checking for homoscedasticity, autocorrelation, and normality.
- Using statistical tests (runs test, ACF) to assess independence assumptions.
- Understanding model limitations and when alternative distributions may be more appropriate.
