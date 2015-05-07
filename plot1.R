source("util.R")

data.df <- getRelevantData()

gap.v <- data.df$Global_active_power
png(filename="plot1.png", width=480, height=480)
hist(gap.v,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

