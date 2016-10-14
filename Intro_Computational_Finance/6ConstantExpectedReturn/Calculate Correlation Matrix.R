# Download price data
VBLTX_prices <- get.hist.quote(instrument = "vbltx", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)
FMAGX_prices <- get.hist.quote(instrument = "fmagx", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)
SBUX_prices <- get.hist.quote(instrument = "sbux", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)
index(VBLTX_prices) <- as.yearmon(index(VBLTX_prices))
index(FMAGX_prices) <- as.yearmon(index(FMAGX_prices))
index(SBUX_prices) <- as.yearmon(index(SBUX_prices))


# Calculate the correlation matrix
cor_matrix <- cor(return_matrix)

# Get the lower triangular part of that 'cor_matrix'
rhohat_vals <- cor_matrix[lower.tri(cor_matrix)]

# Set the names
names(rhohat_vals) <- c("VBLTX, FMAGX", "VBLTX, SBUX", "FMAGX, SBUX")

# Compute the estimated standard errors for correlation
se_rhohat <- (1-rhohat_vals^2)/sqrt(dim(return_matrix)[1])
se_rhohat
