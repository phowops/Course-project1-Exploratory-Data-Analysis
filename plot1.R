plot1.R
## Read in the data into "data" using read.table.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## Subsetting a portion of the data on the basis of "date" from the first to the second of february. 
subSet_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## Subsetting the variable "Global_active_power" and converting to numeric. then read it into a new variable
globalActivePower <- as.numeric(subSet_Data$Global_active_power)
## Save the plot as a 'png' file.
png("plot1.png", width=480, height=480)
## Create a histogram from the variable created.
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
