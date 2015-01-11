# Read the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   colClasses = c(rep("character", 2), rep("numeric", 7)))

# Select the relevant days
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
# Replace the Date field with a datetime object
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open png device
png(filename = "plot4.png")

# Split the canvas into two rows and two columns
par(mfrow = c(2,2))

# Make the upper left plot (similar to plot2)
plot(data$Date, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Make the upper right plot
plot(data$Date, data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Make the lower left plot (similar to plot3)
plot(data$Date, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
points(data$Date, data$Sub_metering_2,
       type = "l",
       col = "red")
points(data$Date, data$Sub_metering_3,
       type = "l",
       col = "blue")
legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Make the lower right plot
plot(data$Date, data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Close png device
dev.off()