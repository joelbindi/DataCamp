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