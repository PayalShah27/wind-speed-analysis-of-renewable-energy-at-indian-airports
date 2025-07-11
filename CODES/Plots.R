# Parameters for standard Weibull distribution (replace with your values)
shape_weibull <- 2.821446
  # example shape parameter for Weibull
scale_weibull <- 4.502625
 # example scale parameter for Weibull

# Parameters for truncated Weibull distribution (replace with your values)
shape_trunc <-2.289947
 # example shape parameter for truncated Weibull
scale_trunc <- 4.01191
 # example scale parameter for truncated Weibull
a <- 3 # lower truncation point
b <- 10 # upper truncation point

# Generate x values for plotting
x_vals <- seq(min(a, 0), b +15, length.out = 100)  # extend range a bit beyond b for visualization

# Define the truncated Weibull PDF
truncated_pdf <- function(x) {
  dweibull(x, shape = shape_trunc, scale = scale_trunc) /
    (pweibull(b, shape = shape_trunc, scale = scale_trunc) - pweibull(a, shape = shape_trunc, scale = scale_trunc))
}

# Plot the standard Weibull distribution
plot(x_vals, dweibull(x_vals, shape = shape_weibull, scale = scale_weibull), 
     type = "l", col = "blue", lwd = 2, ylim = c(0, max(dweibull(x_vals, shape = shape_weibull, scale = scale_weibull)) * 1.2), 
     xlab = "Wind Speed", ylab = "Density", main = "Fit")

# Add the truncated Weibull distribution (only for x within truncation points)
lines(x_vals[x_vals >= a & x_vals <= b], truncated_pdf(x_vals[x_vals >= a & x_vals <= b]), 
      col = "red", lwd = 2, lty = 2)

# Add a legend
legend("topright", legend = c(
  sprintf("Weibull"),
  sprintf("Truncated Weibull")
), col = c("blue", "red"), lwd = 2, lty = 1:2)

