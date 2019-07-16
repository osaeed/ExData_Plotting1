library(data.table)

# read the data, using grep to filter out only the 2 dates Feb 1 and Feb 2
febData <- fread("grep '^[12]/2/2007' household_power_consumption.txt", sep=";", header=FALSE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# add a new DateTime column of type date for further tranformation / graphing
febData <- transform(febData, DateTime=strptime(paste(as.Date(febData$Date, "%d/%m/%Y"), febData$Time, sep=" "), "%Y-%m-%d %H:%M:%S"))


# plot 2
png("plot2.png", width=480, height=480, unit="px")
plot(febData$DateTime, febData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
