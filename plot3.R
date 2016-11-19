#
#
#

householdDataFile = ".\\data\\household_power_consumption.txt";

householdDataSet <- read.table(householdDataFile, sep=";", header=T, na.strings = c("?"));

householdSubSet <- householdDataSet[ as.Date(householdDataSet$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(householdDataSet$Date, "%d/%m/%Y") <= "2007-02-02", ];


# Plot 3. Overlay 3 line chart plots of the Sub metering dimensions

datetimes <- strptime(paste(householdSubSet$Date, householdSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
power <- as.numeric(householdSubSet$Global_active_power);
subMeter1 <- as.numeric(householdSubSet$Sub_metering_1);
subMeter2 <- as.numeric(householdSubSet$Sub_metering_2);
subMeter3 <- as.numeric(householdSubSet$Sub_metering_3);

# open png device for plot output
png("plot3.png", width=504, height=504);

# plot sub_metering_1 line chart in black
plot(datetimes, subMeter1, col="black", xlab="", ylab="Energy sub metering", type="l")

# plot sub_metering_2 line chart in red
lines(datetimes, subMeter2, col="red", type="l")

# plot sub_metering_3 line chart in blue
lines(datetimes, subMeter3, col="blue", type="l")

# add legend to topright corner of the device
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

# close device
dev.off();

# clean up memory
rm(list=ls());
