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
png(filename = "plot2.png")

# Make the plot
plot(data$Date, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close png device
dev.off()