# Load the relevant packages
library("zoo")

# Load the working environment
load(url("http://s3.amazonaws.com/assets.datacamp.com/course/compfin/lab9.RData"))

# Explore the data set
head(returns_df)
tail(returns_df)

# Timeplots of stocks on seperate graphs
my.panel <- function(...) {
  lines(...)
  abline(h = 0)
}
plot(returns_df, lwd = 2, panel = my.panel, col = "blue")

# Timeplots of stocks on same graph
plot(returns_df, plot.type = "single", main = "Returns", col = 1:4, lwd = 2)
abline(h = 0)
legend(x = "bottomleft", legend = colnames(returns_df), col = 1:4, lwd = 2)