# Download price data
VBLTX_prices <- get.hist.quote(instrument = "vbltx", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)
FMAGX_prices <- get.hist.quote(instrument = "fmagx", start = "2005-09-01", end = "2010-09-30", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)

index(VBLTX_prices) <- as.yearmon(index(VBLTX_prices))
index(FMAGX_prices) <- as.yearmon(index(FMAGX_prices))


# Create merged price data
all_prices <- merge(VBLTX_prices, FMAGX_prices, SBUX_prices)
colnames(all_prices) <- c("VBLTX", "FMAGX", "SBUX")

# Calculate cc returns as difference in log prices
all_returns <- diff(log(all_prices))

#Test correlation that VBLTX and FMAGX does not equal zero at 95% confidence 
cor.test(all_returns[,1], all_returns[,2], conf.level = 0.95)

