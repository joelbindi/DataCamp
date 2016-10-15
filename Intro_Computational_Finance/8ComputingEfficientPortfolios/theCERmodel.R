# Load the relevant packages
library("zoo")

# Load the working environment
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/compfin/lab9.RData"))

# Explore the data set
head(returns_df)
tail(returns_df)

# Parameters CER model
mu_hat_month <- apply(returns_df, 2, mean)
print(mu_hat_month)
sigma2_month <- apply(returns_df, 2, var)
print(sigma2_month)
sigma_month <- apply(returns_df, 2, sd)
print(sigma_month)
cov_mat_month <- var(returns_df)
print(cov_mat_month)
cor_mat_month <- cor(returns_df)
print(cor_mat_month)

# Pairwise scatterplots
pairs(coredata(returns_df), col = "blue", pch = 16)

# All data and CER parameters are preloaded in your workspace.  Type ls() in the console to see them.

# Calculate the global minimum variance portfolio
global_min_var_portfolio <- globalMin.portfolio(mu_hat_month, cov_mat_month, shorts = TRUE)
global_min_var_portfolio

# Plot the portfolio weights of our four stocks
plot(global_min_var_portfolio)