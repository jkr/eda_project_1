source("util.R")

data.df <- getRelevantData()

png("plot2.png", width=480, height=480)
plot(data.df$DateTime, data.df$Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()

