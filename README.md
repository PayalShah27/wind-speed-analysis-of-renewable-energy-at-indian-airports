# wind-speed-analysis-of-renewable-energy-at-indian-airports

This project investigates the viability of renewable energy generation at Indian airports using wind speed data and advanced statistical modeling techniques.

---

## Overview

This research focuses on evaluating the feasibility of integrating **wind energy systems** into airport infrastructure, particularly at locations in **coastal and open plain regions** of India. As India moves toward its ambitious goal of achieving **net-zero carbon emissions by 2070**, supplementing solar energy with **wind-based power** becomes essential—especially during monsoon months when solar energy output drops significantly.

To analyze the potential of wind energy, this study utilizes **Weibull** and **Lower-Upper Truncated Weibull Distributions** for modeling wind speed data. Covering **seven years (2017–2023)** across **11 Indian airports**, the study identifies **Porbandar, Rajkot, and Tuticorin** as top candidates based on wind speed suitability and data quality.

---

## Objectives

1. Model wind speed using **Weibull** and **Truncated Weibull** distributions.
2. Evaluate the **energy generation potential** of wind at selected airports.
3. Estimate **power output** using statistical distributions and energy density formulas.
4. Assess the **deployment feasibility** of **Savonius Vertical Axis Wind Turbines (VAWTs)** at airports.

---

## Data Collection

* **Source**: METAR (Meteorological Aerodrome Reports)
* **Provider**: Iowa State University
* **Time Frame**: 2017–2023 (7 years)

---

## Data Preprocessing

* Wind speed values converted from **knots to meters/second (m/s)**
* Focus narrowed to **monsoon months (June–September)** to complement solar energy
* **ARIMA modeling** used to fill missing values and retain seasonality
* Airports shortlisted based on:

  * **Average wind speed > 3 m/s**
  * **Positive skewness** in wind speed distribution

---

## Methodology

### ARIMA Modeling

Used for forecasting and imputing missing daily wind speed values by capturing temporal trends and seasonality.

### Maximum Likelihood Estimation (MLE)

Estimated shape (`k`) and scale (`c`) parameters for:

* **Weibull Distribution**
* **Truncated Weibull Distribution** (range: 3 m/s ≤ wind speed ≤ 10 m/s)

### Goodness-of-Fit Tests

* Goodness-of-Fit Tests Kolmogorov-Smirnov (KS) Test: Compared empirical and theoretical CDFs. Akaike Information Criterion (AIC): Lower AIC indicates a better fitting model. Finding: Truncated Weibull Distribution consistently outperformed the standard Weibull model across most months and airports, particularly for Porbandar.

**Key Finding**: Truncated Weibull Distribution consistently provided a better fit than standard Weibull—particularly for **Porbandar Airport**.

Energy density calculated using the fitted distribution parameters and integrated wind energy formula.

---

## Limitations

* The results are **airport-specific**; broader generalization requires further validation.
* **Turbine specifications** (height, type, placement) and **geographical constraints** need to be evaluated.
* Only **KS Test** and **AIC** were used for goodness-of-fit; incorporating more tests could improve robustness.

---

## Future Scope

* Explore alternative distributions like **Gamma**, **Rayleigh**, or **Lognormal** for improved wind speed modeling.
* Use **wind rose diagrams** for optimal turbine placement based on direction and intensity.
* Investigate the **impact of climate change** on long-term wind speed patterns and energy availability.

---
