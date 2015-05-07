source("util.R")

data.df <- getRelevantData()

## We're going to need to set the y-limits explicitly, because we
## don't want to make the limits of the graph too small due to the
## first thing we plot.
max.height <- with(data.df, max(Sub_metering_1, Sub_metering_2, Sub_metering_3))
min.height <- with(data.df, min(Sub_metering_1, Sub_metering_2, Sub_metering_3))

png("plot3.png", width=480, height=480)
with(data.df, {
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
                lwd=1)
     })
dev.off()
     
