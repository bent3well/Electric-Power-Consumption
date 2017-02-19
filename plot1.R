# Plot 1 Histogram
rm(list = ls())

##read in data 
fileloc <- './household_power_consumption.txt'
power <- read.table(fileloc, header = TRUE, sep = ";", stringsAsFactors = FALSE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")

powersub <- subset(power, power$Date >= '2007-02-01' & power$Date <= '2007-02-02')


##Change formats
powersub$Date <- as.Date(powersub$Date, "%d/%m/%Y")
powersub$DateTime <- format(as.POSIXct(paste(powersub$Date, powersub$Time)), "%Y-%m-%d %H:%M:%S")
powersub$Time <- strptime(powersub$Time, "%H:%M:%S")
powersub$Global_active_power <- as.numeric(powersub$Global_active_power)
powersub$Global_reactive_power <- as.numeric(powersub$Global_reactive_power)
powersub$Voltage <- as.numeric(powersub$Voltage)
powersub$Global_intensity <- as.numeric(powersub$Global_intensity)
powersub$Sub_metering_1 <- as.numeric(powersub$Sub_metering_1)
powersub$Sub_metering_2 <- as.numeric(powersub$Sub_metering_2)

# Open PNG Graphics Device
png(filename = './plot1.png', width = 480, height = 480)

# Histogram
hist(
      powersub$Global_active_power
      , col = "red"
      , main = "Global Active Power"
      , xlab = "Global Active Power (kilowatts)"
     )

dev.off()







