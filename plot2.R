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
# PLOT 2
# need the day names for this
library(lubridate)
data_small$day <- wday(data_small$Date, label = TRUE)
#
#
# and format time data properly
data_small$dateTime <- paste(data_small$Date, data_small$Time)
data_small$time <- strptime(data_small$dateTime, "%d/%m/%Y %H:%M:%S")
#
#
# then draw the plot
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(data_small$time, data_small$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
#