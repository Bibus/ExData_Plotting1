# read data frame with all data
dataAll <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors=FALSE)

# converts date to the right structure and make subset in data frame data
dataAll$Date <- as.Date(dataAll$Date, format = "%d/%m/%Y")
data <- subset(dataAll, Date == "2007-02-02" | Date == "2007-02-01")

#make histogram of Global_active_power and save as plot1.png
png(file = "plot1.png")
hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()