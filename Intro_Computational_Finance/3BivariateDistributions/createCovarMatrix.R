# Standard deviations and correlation
sig_x <- 0.10
sig_y <- 0.05
rho_xy <- 0.9

# Covariance between X and Y
sig_xy <- rho_xy * sig_x * sig_y

# Covariance matrix
Sigma_xy <- matrix(c(sig_x ^ 2, sig_xy, sig_xy, sig_y ^ 2), nrow = 2, ncol = 2)

# Compute joint probability
pmvnorm(lower = c(-Inf, -Inf), upper = c(0, 0), 
        mean = c(mu_x, mu_y), sigma = Sigma_xy)