## Read in data and cull out all but Feb 1-2, 2007
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"))
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

## Create POSIXlt date & time value
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Open up .png file for the plot
png(filename="plot2.png")

## Create Plot
plot(data$DateTime,data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

## Now close the png file
dev.off()