# read data frame with all data
dataAll <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors=FALSE)

# converts date to the right structure and make subset in data frame data
dataAll$Date <- as.Date(dataAll$Date, format = "%d/%m/%Y")
data <- subset(dataAll, Date == "2007-02-02" | Date == "2007-02-01")

# add a column with the moment in the right structure
data$Moment <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")

# plot data and save as plot2.png
png(file = "plot2.png")
with(data , plot(Moment, Global_active_power, type = "l" , xlab = "", ylab = "Global active power (kilowatts)"))
dev.off()