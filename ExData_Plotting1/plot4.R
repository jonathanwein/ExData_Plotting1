DF <- data.frame(read.table(file = "~/Downloads/household_power_consumption.txt", sep = ";", header = TRUE))
DF_days <- subset(DF, DF$Date == "1/2/2007" | DF$Date == "2/2/2007")

png(file = "/Users/yoyo/Documents/coursera/exploratory_analysis/plot4.png", width = 480, height = 480)

### make plot 4
par(mfrow=c(2,2))
# re-make plot 2
rows <- row.names(DF_days)
plot(rows, DF_days$Global_active_power, 
     type = "l", ylab = "Global Active Power (kilowatts)"
     ,xaxt = 'n', yaxt = 'n', xlab = '')
axis(1, at = c(rows[1], rows[length(rows) / 2], 
               rows[length(rows)]),labels = c("The", "Fri", "Sat"))
axis(2, at = seq(0, 3000, 1000), labels = seq(0, 6, 2))

# make top-right plot
rows <- row.names(DF_days)
plot(rows, DF_days$Voltage, 
     type = "l", ylab = "Voltage"
     ,xaxt = 'n', xlab = 'datetime')
axis(1, at = c(rows[1], rows[length(rows) / 2], 
               rows[length(rows)]),labels = c("The", "Fri", "Sat"))
axis(2, at = seq(234, 246, 4), labels = seq(234, 246, 4))

#make left-bottom plot
rows <- row.names(DF_days)
with(DF_days, plot(rows, Sub_metering_1, type = "l",
                   ylab = "Energy sub metering",
                   xaxt = 'n', yaxt = 'n', xlab = ''))
with(DF_days, lines(rows, Sub_metering_2, col = "red"))
with(DF_days, lines(rows, Sub_metering_3, col = "blue"))
axis(1, at = c(rows[1], rows[length(rows) / 2], 
               rows[length(rows)]),labels = c("The", "Fri", "Sat"))
axis(2, at = seq(0, 30, 10), labels = seq(0, 30, 10))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, xjust = 1)

# make right-bottom plot
rows <- row.names(DF_days)
plot(rows, DF_days$Global_reactive_power, type ="l", xaxt = 'n', xlab = "datatime",
     yaxt = 'n', ylab = "Global_reactive_power")
axis(1, at = c(rows[1], rows[length(rows) / 2], 
               rows[length(rows)]),labels = c("The", "Fri", "Sat"))
axis(2, at = seq(0, 250, 50), labels = seq(0, 0.5, 0.1))

dev.off()