my.data.set <- "data/household_power_consumption.txt"

getRelevantData <- function (verbose=TRUE) {
    if(verbose){
        cat("Reading in data...\n")
    }

    all.df <- read.table(my.data.set, sep=";",
                         comment.char="", header=T, na.strings="?")
    if(verbose){
        cat("Cleaning up datetimes...\n")
    }

    dateTime.v <- paste(as.character(all.df$Date), as.character(all.df$Time))
    dateTime.v <- strptime(dateTime.v, "%d/%m/%Y %H:%M:%S")
    # Attach dateTime vector to the big dataframe, while dropping Date
    # and Time factor vectors.
    all.df <- cbind(DateTime=dateTime.v,
                    all.df[,!(names(all.df) %in% c("Date", "Time"))])
    ## Limit it to the dates we want.
    if(verbose){
        cat("Narrowing to our desired rows...\n")
    }
    out.df <- all.df[as.Date(all.df$DateTime, tz="")>="2007-02-01" &
                         as.Date(all.df$DateTime, tz="")<="2007-02-02",]

    if(verbose){
        cat("Done reading in data.\n")
    }

    return(out.df)
}
    
