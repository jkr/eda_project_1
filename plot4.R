source("util.R")

data.df <- getRelevantData()

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data.df, {
     plot(DateTime, Global_active_power, type="l",
          xlab="",
          ylab="Global Active Power (kilowatts)")

     plot(DateTime, Voltage, type="l",
          xlab="",
          ylab="Voltage")

     max.height <- max(Sub_metering_1, Sub_metering_2, Sub_metering_3)
     min.height <- min(Sub_metering_1, Sub_metering_2, Sub_metering_3)

     plot(DateTime, rep(NA, length(DateTime)),
          xlab="",
          ylab="Energy sub metering",
          ylim=c(min.height, max.height))
     lines(DateTime, Sub_metering_1, col="black")
     lines(DateTime, Sub_metering_2, col="red")
     lines(DateTime, Sub_metering_3, col="blue")
     legend(x="topright",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "red", "blue"),
            lwd=1, bty="n")

     plot(DateTime, Global_reactive_power, type="l",
          xlab="",
          ylab="Global Reactive Power")
 })
dev.off()

## reset old par




