## Read in the data into "data" using read.table.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Subsetting a portion of the data on the basis of "date" from the first to the second of february. 
subSet_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSet_Data$Date, subSet_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## Subsetting the variable "Global_active_power" and converting to numeric. then read it into a new variable
globalActivePower <- as.numeric(subSet_Data$Global_active_power)
## Save the plot as a 'png' file.
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
