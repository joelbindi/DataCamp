# Standard deviations and correlation
sig_x <- 0.10
sig_y <- 0.05
rho_xy <- -0.9
sig_xy <- rho_xy * sig_x * sig_y
Sigma_xy <- matrix(c(sig_x ^ 2, sig_xy, sig_xy, sig_y ^ 2), nrow = 2, ncol = 2)
mu_x <- 0.05
mu_y <- 0.025

# Simulate 100 observations
set.seed(123)
xy_vals <- rmvnorm(100, mean = c(mu_x, mu_y), sigma = Sigma_xy)
head(xy_vals)

# Create plot
plot(xy_vals[, 1], xy_vals[, 2], pch = 16, cex = 2, col = "blue", 
     main = "Bivariate normal: rho = -0.9", xlab = "x", ylab = "y")
abline(h = mu_y, v = mu_x)
segments(x0 = 0, y0 = -1e10, x1 = 0, y1 = 0, col = "red")
segments(x0 = -1e10, y0 = 0, x1 = 0, y1 = 0, col = "red")

# Compute joint probability
pmvnorm(lower = c(-Inf, -Inf), upper = c(0, 0), 
        mean = c(mu_x, mu_y), sigma = Sigma_xy)