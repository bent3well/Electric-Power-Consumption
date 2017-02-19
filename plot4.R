# Plot 4
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
powersub$Sub_metering_3 <- as.numeric(powersub$Sub_metering_3)

# Set rows and columns for the plots
par(mfrow = c(2,2))

# Plot top left -----
plot(
  x  = powersub$Global_active_power
  , col = "black"
  , type = "l"
  , ylab = "Global Active Power (kilowatts)"
  , xlab = ""
  , xaxt = "n"
  , mfrow = c(2,2)
)


axis(1 
     , at = c(1 
              , .5*length(powersub$Global_active_power)
              , length(powersub$Global_active_power)
     )
     , labels = c("Thu", "Fri", "Sat")
)

# Plot top right-----
plot(
  x  = powersub$Voltage
  , type = "l"
  , ylab = "Voltage"
  , xlab = "datetime"
  , xaxt = "n"
  , mfrow = c(2,2)
)


axis(1 
     , at = c(1 
              , .5*length(powersub$Global_active_power)
              , length(powersub$Global_active_power)
     )
     , labels = c("Thu", "Fri", "Sat")
)


# Plot bottom-left -----
matplot(
  powersub[,c(7:9)]
  , col = c("black", "red", "blue")
  , lty = "solid"
  , type = "s"
  , ylab = "Energy sub metering"
  , xlab = ""
  , xaxt = "n"
  , mfrow = c(2,2)
)

axis(1 
     , at = c(1 
              , .5*length(powersub$Global_active_power)
              , length(powersub$Global_active_power)
     )
     , labels = c("Thu", "Fri", "Sat")
)

legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col = c("black", "red", "blue")
       , lty = 1
       , bty = "n"
)

# Plot bottom right -----
plot(
  x  = powersub$Global_reactive_power
  , type = "l"
  , ylab = "Global_reactive_power"
  , xlab = "datetime"
  , xaxt = "n"
  , mfrow = c(2,2)
)


axis(1 
     , at = c(1 
              , .5*length(powersub$Global_active_power)
              , length(powersub$Global_active_power)
     )
     , labels = c("Thu", "Fri", "Sat")
)

### Save to PNG -----
dev.copy(png, filename = './plot4.png', width = 700, height = 700)
dev.off()


