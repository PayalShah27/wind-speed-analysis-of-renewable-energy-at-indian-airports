# Load necessary libraries
library(forecast)
library(zoo)

# Sample data (replace this with your actual wind speed data for June from 2017-2023)
# Assume 'wind_speed_data' is a vector with daily observations for June, with NA for missing values.
wind_speed_data <-Porbandar_estimates$sknt  # Replace with your actual data

# Step 1: Fill missing values temporarily with linear interpolation
wind_filled <- na.approx(wind_speed_data)  # Simple linear interpolation for initial imputation

# Step 2: Convert to a time series object (frequency = 30 for daily data in June)
wind_ts <- ts(wind_filled, frequency = 30, start = c(2017, 1))

# Step 3: Fit ARIMA model
# Use auto.arima to automatically select the best ARIMA model for your data
arima_model <- auto.arima(wind_ts, seasonal = TRUE)  # Seasonal = TRUE for seasonal ARIMA

# Step 4: Forecast missing values and fill them in
# Make predictions using the fitted ARIMA model for the entire time series
fitted_values <- fitted(arima_model)

# Replace missing values in the original series with the fitted ARIMA values
imputed_data <- wind_speed_data
imputed_data
imputed_data[is.na(imputed_data)] <- fitted_values[is.na(imputed_data)]

# Optional: Plot the imputed time series for visualization
plot(ts(imputed_data, frequency = 30, start = c(2017, 1)), 
     main = "Wind Speed Data with Imputed Missing Values",
     ylab = "Wind Speed", xlab = "Time")
lines(fitted_values, col = "blue")  # Add fitted values as a line for comparison

#For accuracy
# Load necessary libraries
library(Metrics)  # For calculating accuracy metrics

# Step 1: Create a holdout set by masking some known values
# Make a copy of the original data
wind_data_with_na <- wind_speed_data

# Define the indices of the known values to mask for testing
set.seed(100)  # For reproducibility
mask_indices <- sample(which(!is.na(wind_speed_data)), size = 10)  # Mask 10 random known values
wind_data_with_na[mask_indices] <- NA  # Introduce NAs for testing

# Step 2: Predict values for the masked (test) points
predicted_values <- fitted(arima_model)[mask_indices]
predicted_values
# Step 3: Calculate error metrics by comparing predictions with actual masked values
actual_values <- wind_speed_data[mask_indices]  # The original known values
actual_values
m=matrix(c(actual_values,predicted_values),ncol=2);m

# Calculate error metrics
mae <- mae(actual_values, predicted_values)  # Mean Absolute Error
mse <- mse(actual_values, predicted_values)  # Mean Squared Error
rmse <- rmse(actual_values, predicted_values)  # Root Mean Squared Error

# Display results
cat("Mean Absolute Error (MAE):", mae, "\n")
cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")
