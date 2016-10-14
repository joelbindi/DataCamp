# Load relevant packages
library(PerformanceAnalytics)
library(zoo)
library(tseries)

# Get the adjusted closing prices from Yahoo!
VBLTX_prices <- get.hist.quote(instrument = "vbltx", start = "1998-01-01", end = "2009-12-31", 
                               quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", 
                               compression = "m", retclass = "zoo", quiet = TRUE)

# Get the adjusted closing prices from Fidelity Magellan
FMAGX_prices <- get.hist.quote(instrument = "fmagx", start = "1998-01-01", end = "2009-12-31", quote = "AdjClose", provider = "yahoo", origin = "1970-01-01", compression = "m", retclass = "zoo", quiet = TRUE)

# Get the adjusted closing prices from Starbucks
SBUX_prices <- get.hist.quote(instrument = "SBUX", start = "1998-01-01", end = "2009-12-31",
                              quote="AdjClose", provider = "yahoo", origin = "1970-01-01",  
                              compression = "m", retclass = "zoo", quiet = TRUE)

# Change the class of the time index to yearmon
index(VBLTX_prices) <- as.yearmon(index(VBLTX_prices))
index(FMAGX_prices) <- as.yearmon(index(FMAGX_prices))
index(SBUX_prices) <- as.yearmon(index(SBUX_prices))

# Inspect SBUX_prices
start(SBUX_prices)
end(SBUX_prices)


# Create merged price data
all_prices <- merge(VBLTX_prices, FMAGX_prices, SBUX_prices)

# Rename columns
colnames(all_prices) <- c("VBLTX", "FMAGX", "SBUX")

# Calculate cc returns as difference in log prices
all_returns <- diff(log(all_prices))
  
# Look at the return data
start(all_returns)
end(all_returns)
colnames(all_returns) 
head(all_returns)

# Plot returns using the PerformanceAnalytics function chart.TimeSeries().
# This function creates a slightly nicer looking plot than plot.zoo()
chart.TimeSeries(all_returns, legend.loc = "bottom", main = " ") 

# The previous charts are a bit hard to read. The PerformanceAnalytics function
# chart.Bar makes it easier to compare the returns of different assets
chart.Bar(all_returns, legend.loc = "bottom", main = " ")

# Cumulative return plot - must use simple returns (!) and not cc returns for this
# Use PerformanceAnalytics function chart.CumReturns()
simple_returns <- diff(all_prices) / lag(all_prices, k = -1)
chart.CumReturns(simple_returns, legend.loc = "topleft", wealth.index = TRUE, main = "Future Value of $1 invested")