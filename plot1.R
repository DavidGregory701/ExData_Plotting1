## Read in data and cull out all but Feb 1-2, 2007

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"))
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

## Open up .png file for the plot
png(filename="plot1.png")

## Create Plot
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## Now close the png file
dev.off()