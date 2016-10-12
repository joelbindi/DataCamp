# Assign the URL to the CSV file
data_url <- "http://assets.datacamp.com/course/compfin/sbuxPrices.csv"

# Load the data frame using read.csv
sbux_df <- read.csv(file = data_url, header = TRUE, stringsAsFactors = FALSE)

# Check the structure of sbux_df
str(sbux_df)

# Check the first and last part of sbux_df
head(sbux_df)
tail(sbux_df)

# Get the class of the Date column of sbux_df
class(sbux_df$Date)

# The sbux_df data frame is already loaded in your work space
closing_prices <- sbux_df[, "Adj.Close", drop=FALSE]

# Find indices associated with the dates 3/1/1994 and 3/1/1995
index_1 <- which(sbux_df$Date == "3/1/1994")
index_2 <- which(sbux_df$Date == "3/1/1995")

# Extract prices between 3/1/1994 and 3/1/1995
some_prices <- sbux_df[index_1:index_2, "Adj.Close"]

# Create a new data frame that contains the price data with the dates as the row names
sbux_prices_df <- sbux_df[, "Adj.Close", drop = FALSE]
rownames(sbux_prices_df) <- sbux_df$Date
head(sbux_prices_df)

# With Dates as rownames, you can subset directly on the dates.
# Find indices associated with the dates 3/1/1994 and 3/1/1995.
price_1 <- sbux_prices_df["3/1/1994", 1]
price_2 <- sbux_prices_df["3/1/1995", 1]

# Now add all relevant arguments to the plot function below to get a nicer plot
plot(sbux_df$Adj.Close, type ="l", col="blue", lwd = 2, ylab = "Adjusted close", 
     main = "Monthly closing price of SBUX")
#Add legend
legend(x = 'topleft', legend = 'SBUX', lty = 1, lwd = 2, col = 'blue')


# The sbux_df data frame is already loaded in your work space
sbux_prices_df <- sbux_df[, "Adj.Close", drop = FALSE]

# Denote n the number of time periods
n <- nrow(sbux_prices_df)
sbux_ret <- (sbux_prices_df[2:n,1] - sbux_prices_df[1:(n - 1),1]) / sbux_prices_df[1:(n - 1),1]

# Notice that sbux_ret is not a data frame object
class(sbux_ret)
  
# Notice that sbux_ret is not a data frame object
class(sbux_ret)
print(sbux_ret)
