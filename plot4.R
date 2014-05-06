## Read in data and cull out all but Feb 1-2, 2007
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                   colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric"))
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007",]

## Create POSIXlt date & time value
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Open up .png file for the plot
png(filename="plot4.png")

## Set up 4x4 plot area
par(mfcol = c(2,2))

## Generate first plot
plot(data$DateTime,data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

## Generate second plot
plot(data$DateTime,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

   ## Add in lines
   points(data$DateTime,data$Sub_metering_2,type="l",col="red")
   points(data$DateTime,data$Sub_metering_3,type="l",col="blue")

   ## Add a legend
   legend("topright", col=c("black", "red", "blue"), lty=1, cex=.85, bty="n",
          legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Generate third plot
plot(data$DateTime,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Generate fourth plot
plot(data$DateTime,data$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

## Now close the png file
dev.off()