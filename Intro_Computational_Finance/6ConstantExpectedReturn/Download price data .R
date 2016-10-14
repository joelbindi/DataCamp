# Download price data
VBLTX_prices <- get.hist.quote(instrument = "vbltx", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)
FMAGX_prices <- get.hist.quote(instrument = "fmagx", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)
SBUX_prices <- get.hist.quote(instrument = "sbux", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)
index(VBLTX_prices) <- as.yearmon(index(VBLTX_prices))
index(FMAGX_prices) <- as.yearmon(index(FMAGX_prices))
index(SBUX_prices) <- as.yearmon(index(SBUX_prices))

# Create merged price data
all_prices <- merge(VBLTX_prices, FMAGX_prices, SBUX_prices)
colnames(all_prices) <- c("VBLTX", "FMAGX", "SBUX")

# Calculate cc returns as difference in log prices
all_returns <- diff(log(all_prices))

# Create matrix with returns
return_matrix <- coredata(all_returns)

# Number of observations
n_obs <- dim(return_matrix)[1]

# Estimates of sigma2hat
sigma2hat_vals <- apply(return_matrix, 2, var)

# Standard Error of sigma2hat
se_sigma2hat <- sigma2hat_vals/sqrt(n_obs/2)
se_sigma2hat 