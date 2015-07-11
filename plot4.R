# read first data frame with all data
dataAll <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors=FALSE)

# converts date to the right structure and make subset in data frame data
dataAll$Date <- as.Date(dataAll$Date, format = "%d/%m/%Y")
data <- subset(dataAll, Date == "2007-02-02" | Date == "2007-02-01")

# add a column with the moment in the right structure (via the function strptime())
data$Moment <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")


# plot data and save as plot4.png
png(file = "plot4.png")

#specify the array of plots
par(mfrow = c(2,2))

with(data , {
        plot(Moment, Global_active_power, type = "l" , xlab = "", ylab = "Global active power (kilowatts)")
        
        plot(Moment, Voltage, type = "l" , xlab = "datetime", ylab = "Voltage")
        
        plot(Moment, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
        points(Moment, Sub_metering_1, col = "black", type = "l")
        points(Moment, Sub_metering_2, col = "red", type = "l")
        points(Moment, Sub_metering_3, col = "blue", type = "l")
        legend("topright",  lty = c(1,1), col = c("black", "red","blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
        
        plot(Moment, Global_reactive_power, type = "l" , xlab = "datetime", ylab = "Global_active_power")
})
dev.off()