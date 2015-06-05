plot4.R
## Read in the data into "data" using read.table.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Subsetting a portion of the data on the basis of "date" from the first to the second of february. 
subSet_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSet_Data$Date, subSet_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
## Subsetting the variable "Global_active_power" and converting to numeric. then read it into a new variable
globalActivePower <- as.numeric(subSet_Data$Global_active_power)
subMetering1 <- as.numeric(subSet_Data$Sub_metering_1)
subMetering2 <- as.numeric(subSet_Data$Sub_metering_2)
subMetering3 <- as.numeric(subSet_Data$Sub_metering_3)
Voltage <- as.numeric(subSet_Data$Voltage)
globalReactivePower <- as.numeric(subSet_Data$Global_reactive_power)
## Save the plot as a 'png' file.
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
