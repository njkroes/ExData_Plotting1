# set file type
png(filename = "plot1.png",
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

# Generate histogram
hist(februaryData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# save file
dev.off()
