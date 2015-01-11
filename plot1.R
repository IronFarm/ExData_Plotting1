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
png(filename = "plot1.png")

# Make the plot
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# Close png device
dev.off()