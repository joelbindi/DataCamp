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
