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
# PLOT 1
# 
#
# original data needs to be divided by 500 to get the x-axis the same as in the example graph
# plot:
#
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data_small$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
#
#
#