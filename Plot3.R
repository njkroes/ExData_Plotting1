# set file type
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

# set colClasses
columns <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# read in data
data <- read.table("Data/household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, colClasses=columns, dec=".")

# add DateTime column
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset data to 2/1/2007 and 2/2/2007
februaryData <- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# create chart
with(februaryData, plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering"))
with(februaryData, lines(DateTime, Sub_metering_2, col="red"))
with(februaryData, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lwd = 1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save file
dev.off()
