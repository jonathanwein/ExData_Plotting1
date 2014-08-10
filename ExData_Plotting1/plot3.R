DF <- data.frame(read.table(file = "~/Downloads/household_power_consumption.txt", sep = ";", header = TRUE))
DF_days <- subset(DF, DF$Date == "1/2/2007" | DF$Date == "2/2/2007")

png(file = "/Users/yoyo/Documents/coursera/exploratory_analysis/plot3.png", width = 480, height = 480)

### make plot 3
par(mfrow=c(1,1))
rows <- row.names(DF_days)
plot(rows, DF_days$Sub_metering_1, type = "l")
str(line(rows, DF_days$Sub_metering_2))

with(DF_days, plot(rows, Sub_metering_1, type = "l",
                   ylab = "Energy sub metering",
                   xaxt = 'n', yaxt = 'n', xlab = ''))
with(DF_days, lines(rows, Sub_metering_2, col = "red"))
with(DF_days, lines(rows, Sub_metering_3, col = "blue"))
axis(1, at = c(rows[1], rows[length(rows) / 2], 
               rows[length(rows)]),labels = c("The", "Fri", "Sat"))
axis(2, at = seq(0, 30, 10), labels = seq(0, 30, 10))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1,
       xjust = 1)

dev.off()