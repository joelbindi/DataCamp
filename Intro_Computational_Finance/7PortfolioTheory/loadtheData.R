# Load relevant packages
library("PerformanceAnalytics")
library("zoo")

# Load the data
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/compfin/lab8.RData"))

# Explore the data set
head(returns_df)
tail(returns_df)

# Estimate the parameters: multivariate
mu_hat_annual <- apply(returns_df, 2, mean) * 12
sigma2_annual <- apply(returns_df, 2, var) * 12
sigma_annual <- sqrt(sigma2_annual)
cov_mat_annual <- cov(returns_df) * 12
cov_hat_annual <- cov(returns_df)[1,2] * 12
rho_hat_annual <- cor(returns_df)[1,2]

# The annual estimates of the CER model parameters for Boeing and Microsoft
mu_boeing <- mu_hat_annual["rboeing"]
mu_msft <- mu_hat_annual["rmsft"]
sigma2_boeing <-  sigma2_annual["rboeing"]
sigma2_msft <- sigma2_annual["rmsft"]
sigma_boeing <- sigma_annual["rboeing"]
sigma_msft <- sigma_annual["rmsft"]
sigma_boeing_msft <- cov_hat_annual
rho_boeing_msft <- rho_hat_annual


# The ratio Boeing stock vs Microsoft stock (adds up to 1)
boeing_weights <- seq(from = -1, to = 2, by = 0.1)
msft_weights <- 1 - boeing_weights

# Portfolio parameters
mu_portfolio <- boeing_weights * mu_boeing + msft_weights * mu_msft
sigma2_portfolio <- boeing_weights ^ 2 * sigma2_boeing + msft_weights ^ 2 * sigma2_msft + 2 * boeing_weights * msft_weights * sigma_boeing_msft
sigma_portfolio <- sqrt(sigma2_portfolio)

# Plotting the different portfolios
plot(sigma_portfolio, mu_portfolio, type = "b", pch = 16, ylim = c(0, max(mu_portfolio)), xlim = c(0, max(sigma_portfolio)), xlab = expression(sigma[p]), ylab = expression(mu[p]), col = c(rep("green", 18), rep("red", 13)))
text(x = sigma_boeing, y = mu_boeing, labels = "Boeing", pos = 4)
text(x = sigma_msft, y = mu_msft, labels = "Microsoft", pos = 4)
