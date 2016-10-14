#Normality of the asset returns

# Remember that the Constant Expected Return model assumes that returns are normally distributed. Is that a reasonable assumption? The Jarque Bera test provides a way to answer that question. You can easily perform the Jarque Bera test for normality in R with the jarque.bera.test function.
# 
# Let us say that you want to investigate whether it is reasonable that the returns of VBLTX are normally distributed. More formally, you would like to test the null hypothesis:
#   
#   H0:rit∼ normal vs. H1:rit∼ not normal 
# H0:rit∼ normal vs. H1:rit∼ not normal 
# using a 5% significance level, with i=VBLTXi=VBLTX.
# 

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

jarque.bera.test(all_returns[,2])

