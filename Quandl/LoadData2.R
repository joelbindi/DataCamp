# Load the Quandl package
library(Quandl)

# Assign to the variable Exchange
Exchange <- Quandl("BNP/USDEUR", start_date = "2013-01-01", end_date = "2013-12-01")

## Quandl can transform your data before serving it. You can set the transformation argument to:
#"diff"
#"rdiff"
#"cumul", and
#"normalize".

# You want to know the Canadian GDP annual percent change. 
# Use the rdiff transformation and assign the result to GDP_Change. 
# Use the code "FRED/CANRGDPR"; more information can be found on Quandl's website.

# The result:
GDP_Change <- Quandl("FRED/CANRGDPR", transformation = "rdiff")

#Get crude oil prices on a quarterly basis from the EIA's daily spot price 
#(use the code DOE/RWTC) and assign these to the variable eiaQuarterly.

eiaQuarterly <- Quandl("DOE/RWTC", collapse = "quarterly")