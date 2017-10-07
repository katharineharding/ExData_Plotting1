# Coursera - Data Science Specialisation
# 4: Exploratory Data Analysis
# Assignment week 1
# October 2017
#
#
#
# Download and unzip the data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL, temp)
a <- unzip(temp)
#
#
# Read in the downloaded data, remembering to code "?" as missing
data <- read.table(a, header = TRUE, sep = ";", na.strings = "?")
#
#
# format the dates properly
data$date <- as.Date(data$Date, format = "%d/%m/%Y")
#
#
# subset only the data that we want (1st and 2nd February 2007)
data_small <- subset(data, data$date == "2007-02-01" | data$date == "2007-02-02")
#
#
#
#
#
#
#
# PLOT 4
#
png(file = "plot4.png", width = 480, height = 480, units = "px")
#
par(mfrow = c(2, 2))
#
plot(data_small$time, data_small$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
#
plot(data_small$time, data_small$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")
#
plot(data_small$time, data_small$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
par(new = T)
plot(data_small$time, data_small$Sub_metering_2, type = "l", xlab = "", ylab = "", col = "red", ylim = c(0, 38), axes = FALSE)
par(new = T)
plot(data_small$time, data_small$Sub_metering_3, type = "l", xlab = "", ylab = "", col = "blue", ylim = c(0, 38), axes=FALSE)
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")
#
plot(data_small$time, data_small$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
#
dev.off()
#
#
#
#
#
#
#