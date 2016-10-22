library("ggplot2")
library("zoo")

# Load the data

f <- file.path(getwd(),"users.csv")

data <- read.csv(f, sep = ",", header = TRUE)

dates <- data[,1]
id <- data[,2]

df <-data.frame(dates,id)

dup <- duplicated(df$dates)

new <- (df[!duplicated(df$dates), ])
revdf <- new[rev(rownames(new)),] 
write.csv(revdf, file = "users_output.csv", row.names = TRUE)
