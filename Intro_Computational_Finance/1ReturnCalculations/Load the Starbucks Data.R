message("Assign the URL to the CSV file")
data_url <- "http://assets.datacamp.com/course/compfin/sbuxPrices.csv"

message("Load the data frame using read.csv")
sbux_df <- read.csv(file = data_url, header = TRUE, stringsAsFactors = FALSE)

message("Check the structure of sbux_df")
str(sbux_df)

message("Check the first and last part of sbux_df")
head(sbux_df)
tail(sbux_df)

message("Get the class of the Date column of sbux_df")
class(sbux_df$Date)

message("The sbux_df data frame is already loaded in your work space")
closing_prices <- sbux_df[, "Adj.Close", drop=FALSE]

message("Find indices associated with the dates 3/1/1994 and 3/1/1995")
index_1 <- which(sbux_df$Date == "3/1/1994")
index_2 <- which(sbux_df$Date == "3/1/1995")

message("Extract prices between 3/1/1994 and 3/1/1995")
some_prices <- sbux_df[index_1:index_2, "Adj.Close"]

message("Create a new data frame that contains the price data with the dates as the row names")
sbux_prices_df <- sbux_df[, "Adj.Close", drop = FALSE]
rownames(sbux_prices_df) <- sbux_df$Date
head(sbux_prices_df)

# With Dates as rownames, you can subset directly on the dates.
# Find indices associated with the dates 3/1/1994 and 3/1/1995.
price_1 <- sbux_prices_df["3/1/1994", 1]
price_2 <- sbux_prices_df["3/1/1995", 1]

message("add all relevant arguments to the plot function below to get a nicer plot")
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
  
message("add dates as names to the vector and print the first elements of sbux_ret to the console to check")
names(sbux_ret) <- sbux_df[2:n,1]
head(sbux_ret)

# The sbux_df data frame is already loaded in your work space
sbux_prices_df <- sbux_df[, "Adj.Close", drop = FALSE]

# Denote n the number of time periods:
n <- nrow(sbux_prices_df)
sbux_ret <- (sbux_prices_df[2:n, 1] - sbux_prices_df[1:(n - 1), 1]) / sbux_prices_df[1:(n - 1), 1]

# Compute continuously compounded 1-month returns
sbux_ccret <- log(sbux_prices_df[2:n, 1]) - log(sbux_prices_df[1:(n - 1), 1])

# Assign names to the continuously compounded 1-month returns
names(sbux_ccret) <- sbux_df[2:n,1]

message("Show sbux_ccret")
head(sbux_ccret)

message("Compare the simple and cc returns")
head(cbind(sbux_ret,sbux_ccret))

message("Plot the returns on the same graph")
plot(sbux_ret, type = "l", col = "blue", lwd = 2, ylab = "Return", main = "Monthly Returns on SBUX")

# Add horizontal line at zero
abline(h = 0)

# Add a legend
legend(x = "bottomright", legend = c("Simple", "CC"), lty = 1, lwd = 2, col = c("blue", "red"))

message("Add the continuously compounded returns")
lines(sbux_ccret, col = "red", lwd = 2)

# Compute gross returns
sbux_gret <- 1 + sbux_ret

# Compute future values
sbux_fv <- cumprod(sbux_gret)

# Plot the evolution of the $1 invested in SBUX as a function of time
plot(sbux_fv, type = "l", col = "blue", lwd = 2, ylab = "Dollars", main = "FV of $1 invested in SBUX")
