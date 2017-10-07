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
# PLOT 3
# this plot needs to separate out Sub_metering_1, 2, and 3
#
#
# draw the plot
# and no need to draw the axes three times as long as scales are correctly set
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(data_small$time, data_small$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
par(new = T)
plot(data_small$time, data_small$Sub_metering_2, type = "l", xlab = "", ylab = "", col = "red", ylim = c(0, 38), axes = FALSE)
par(new = T)
plot(data_small$time, data_small$Sub_metering_3, type = "l", xlab = "", ylab = "", col = "blue", ylim = c(0, 38), axes=FALSE)
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()
#
#
#