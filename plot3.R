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
png(filename = "plot3.png")

# Add the black points, labelling the axes
plot(data$Date, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
# Add the red points to the plot
points(data$Date, data$Sub_metering_2,
       type = "l",
       col = "red")
# Add the blue points to the plot
points(data$Date, data$Sub_metering_3,
       type = "l",
       col = "blue")
# Add the legend
legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

# Close png device
dev.off()