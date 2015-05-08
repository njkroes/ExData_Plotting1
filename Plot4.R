# set file type
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

# set colClasses
columns <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# read in data
data <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses=columns, dec=".")

# add DateTime column
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset data to 2/1/2007 and 2/2/2007
februaryData <- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# create charts
par(mfrow = c(2,2))
with(februaryData, {
  plot(DateTime, Global_active_power, type="l", xlab = "", ylab="Global Active Power")
  plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")  
    legend("topright", lwd = 1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
})

# save file
dev.off()
