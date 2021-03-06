set.seed(123)

# Simulate 250 observations from the described AR(1) model
ar1_sim <- arima.sim(model = list(ar = 0.5), n = 250, mean = 0, sd = 0.1) + 0.05

# Generate the theoretical ACF with ten lags
acf_ar1_model <- ARMAacf(ar = 0.5, lag.max = 10)

# Split plotting window in three rows
par(mfrow = c(3, 1))

# First plot: The simulated observations
plot(ar1_sim, type = "l", main = "AR(1) Process: mu = 0.05, phi = 0.5", xlab = "time", ylab = "y(t)")
abline(h = 0)

# Second plot: Theoretical AFC
plot(1:10, acf_ar1_model[2:11], type = "h", col = "blue", main = "theoretical ACF")

# Third plot: Sample AFC
tmp <- acf(ar1_sim, lag.max = 10, main = "Sample ACF")

# Reset plotting window to default
par(mfrow = c(1, 1))