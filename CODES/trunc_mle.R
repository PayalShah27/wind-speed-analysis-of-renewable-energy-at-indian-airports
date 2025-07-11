# Load necessary libraries
library(stats4)
library(dplyr)

# Example data (Replace with your actual data)
data


# Define truncation limits
lower_bound <- 3# Lower truncation limit
upper_bound <- 10  # Upper truncation limit

# Filter data within truncation limits
truncated_data <- data[data >= lower_bound & data <= upper_bound]
truncated_data

# Negative log-likelihood function for truncated Weibull
neg_log_likelihood <- function(shape, scale) {
  # Probability of the lower and upper truncation bounds
  P_lower <- pweibull(lower_bound, shape, scale)
  P_upper <- pweibull(upper_bound, shape, scale)
  
  # Calculate truncated probabilities
  likelihoods <- dweibull(truncated_data, shape, scale) / (P_upper - P_lower)
  
  # Return the negative log-likelihood
  -sum(log(likelihoods))
}

# Estimate parameters using MLE
mle_result <- mle(neg_log_likelihood, start = list(shape = 1.5, scale = 3.0), 
                  method = "L-BFGS-B", lower = c(1e-3, 1e-3))

# Show estimated parameters
summary(mle_result)





# july
# Load necessary libraries
library(stats4)
library(dplyr)

# Example data (Replace with your actual data)
data1

# Define truncation limits
lower_bound <- 3# Lower truncation limit
upper_bound <- 10  # Upper truncation limit

# Filter data within truncation limits
truncated_data <- data1[data1 >= lower_bound & data1 <= upper_bound]
truncated_data

# Negative log-likelihood function for truncated Weibull
neg_log_likelihood <- function(shape, scale) {
  # Probability of the lower and upper truncation bounds
  P_lower <- pweibull(lower_bound, shape, scale)
  P_upper <- pweibull(upper_bound, shape, scale)
  
  # Calculate truncated probabilities
  likelihoods <- dweibull(truncated_data, shape, scale) / (P_upper - P_lower)
  
  # Return the negative log-likelihood
  -sum(log(likelihoods))
}

# Estimate parameters using MLE
mle_result <- mle(neg_log_likelihood, start = list(shape = 1.5, scale = 3.0), 
                  method = "L-BFGS-B", lower = c(1e-3, 1e-3))

# Show estimated parameters
summary(mle_result)
