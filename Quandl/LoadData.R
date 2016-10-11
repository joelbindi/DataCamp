# Load in the Quandl package with the help of library() here:
library(Quandl)

# Assign your first dataset to the variable:
mydata <- Quandl("NSE/OIL")

# Assign the Prague Stock Exchange to:
PragueStockExchange <- Quandl("PRAGUESE/PX")

# The quantmod package is ready for use:
library(quantmod)

# Load the Facebook data with the help of Quandl
Facebook <- Quandl("GOOG/NASDAQ_FB", type = "xts")

# Plot the chart with the help of candleChart()
candleChart(Facebook)

# Look up the first 3 results for 'Bitcoin' within the Quandl database:
results <- Quandl.search("Bitcoin", page = 3, silent=FALSE)

# Print out the results
str(results)

# Assign the data set with code BCHAIN/TOTBC
BitCoin <- Quandl("BCHAIN/TOTBC")

  
  