DF <- data.frame(read.table(file = "~/Downloads/household_power_consumption.txt", sep = ";", header = TRUE))
DF_days <- subset(DF, DF$Date == "1/2/2007" | DF$Date == "2/2/2007")

### make plot 1
png(file = "/Users/yoyo/Documents/coursera/exploratory_analysis/plot1.png", width = 480, height = 480)
par(mfrow=c(1,1))

hist(as.numeric(DF_days$Global_active_power), breaks = seq(0, 6000, 500), 
     freq = TRUE, col = "red", ylim = c(0,1200),
     xlab = "Global Active Power (killowats)",
     main = "Global Active Power")
dev.off()