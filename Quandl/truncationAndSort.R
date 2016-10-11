# Load the Quandl package
library(Quandl)

# Assign to TruSo the first 5 observations of the crude oil prices
TruSo <- Quandl("DOE/RWTC", rows=5, sort="asc")
  
# Print the result
TruSo


# Here you should place the return:
Final <- Quandl("DOE/RWTC", transformation = "rdiff", start_date = "2005-01-01", end_date = "2010-03-01",
                collapse = "daily", sort="asc")