# Install required packages if not already installed
if (!require("fitdistrplus")) install.packages("fitdistrplus")
if (!require("VGAM")) install.packages("VGAM")
if (!require("readxl")) install.packages("readxl")

# Load libraries
library(fitdistrplus)
library(VGAM)
library(readxl)

# Load the data (replace 'your_file.xlsx' and 'Wind_Speed_Column' with actual file and column names)
data <- MISSING_values_estimates_me
wind_speed_data <-na.omit(MISSING_values_estimates_me$SEPTEMBER)
# Filter the data between truncation points 3 and 10
truncated_data <- wind_speed_data[wind_speed_data >= 3 & wind_speed_data <= 10]

# Define the log-likelihood function for the truncated Weibull distribution
trunc_weibull_loglik <- function(params) {
  shape <- params[1]
  scale <- params[2]
  # Probability for the truncated range
  p_a <- pweibull(3, shape = shape, scale = scale)
  p_b <- pweibull(10, shape = shape, scale = scale)
  log_lik <- sum(dweibull(truncated_data, shape = shape, scale = scale, log = TRUE) - log(p_b - p_a))
  return(-log_lik)  # Return negative log-likelihood for optimization
}

# Use optim to estimate parameters (starting with initial guesses)
init_params <- c(shape =0.1, scale = 0.1)
fit <- optim(init_params, trunc_weibull_loglik)

# Extract the fitted parameters
shape_est <- fit$par["shape"];shape_est
scale_est <- fit$par["scale"];scale_est

# Plot the histogram and fitted truncated Weibull distribution
hist(truncated_data, probability = TRUE, breaks = 10, col = "gray", border = "black",
     main = "Truncated Weibull Fit for Wind Speed Data", xlab = "Wind Speed", xlim = c(2, 10))

# Generate x values for plotting
x_vals <- seq(3, 10, length.out = 100)

# Calculate truncated Weibull PDF values
truncated_pdf <- function(x) {
  dweibull(x, shape = shape_est, scale = scale_est) /
    (pweibull(10, shape = shape_est, scale = scale_est) - pweibull(3, shape = shape_est, scale = scale_est))
}

# Plot the truncated Weibull distribution
lines(x_vals, truncated_pdf(x_vals), col = "red", lwd = 2)
legend("topright", legend = sprintf("Truncated Weibull\nShape=%.2f, Scale=%.2f", shape_est, scale_est),
       col = "red", lwd = 2)

