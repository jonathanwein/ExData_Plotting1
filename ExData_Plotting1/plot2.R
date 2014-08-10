DF <- data.frame(read.table(file = "~/Downloads/household_power_consumption.txt", sep = ";", header = TRUE))
DF_days <- subset(DF, DF$Date == "1/2/2007" | DF$Date == "2/2/2007")


### make plot 2
png(file = "/Users/yoyo/Documents/coursera/exploratory_analysis/plot2.png", width = 480, height = 480)

par(mfrow=c(1,1))
rows <- row.names(DF_days)
plot(rows, DF_days$Global_active_power, 
     type = "l", ylab = "Global Active Power (kilowatts)"
     ,xaxt = 'n', yaxt = 'n', xlab = '')
axis(1, at = c(rows[1], rows[length(rows) / 2], 
               rows[length(rows)]),labels = c("The", "Fri", "Sat"))
axis(2, at = seq(0, 3000, 1000), labels = seq(0, 6, 2))
dev.off()