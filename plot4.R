#
#
#

householdDataFile = ".\\data\\household_power_consumption.txt";

householdDataSet <- read.table(householdDataFile, sep=";", header=T, na.strings = c("?"));

householdSubSet <- householdDataSet[ as.Date(householdDataSet$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(householdDataSet$Date, "%d/%m/%Y") <= "2007-02-02", ];


# Plot 4. 2x2 grid of charts

datetimes <- strptime(paste(householdSubSet$Date, householdSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
activePower <- as.numeric(householdSubSet$Global_active_power);
reactivePower <- as.numeric(householdSubSet$Global_reactive_power);
voltage <- as.numeric(householdSubSet$Voltage);
subMeter1 <- as.numeric(householdSubSet$Sub_metering_1);
subMeter2 <- as.numeric(householdSubSet$Sub_metering_2);
subMeter3 <- as.numeric(householdSubSet$Sub_metering_3);

# open png device for plot output
png("plot4.png", width=504, height=504);

# setup 2x2 grid
par(mfrow = c(2, 2))

# plot 1.1 - active power line chart
plot(datetimes, activePower, xlab="", ylab="Global Active Power", type="l")

# plot 1.2 - voltage line chart
plot(datetimes, voltage, xlab="datetime", ylab="Voltage", type="l")

# plot 2.1 - sub_metering_1 line chart in black
plot(datetimes, subMeter1, col="black", xlab="", ylab="Energy sub metering", type="l")

# add to 2.1 - sub_metering_2 line chart in red
lines(datetimes, subMeter2, col="red", type="l")

# add to 2.1 - sub_metering_3 line chart in blue
lines(datetimes, subMeter3, col="blue", type="l")

# add to 2.1 - legend to topright corner of the device
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

# plot 2.2 - reactive power line chart
plot(datetimes, reactivePower, xlab="datetime", ylab="Global_reactive_power", type="l")

# close device
dev.off();

# clean up memory
rm(list=ls());
