#
#
#

householdDataFile = ".\\data\\household_power_consumption.txt";

householdDataSet <- read.table(householdDataFile, sep=";", header=T, na.strings = c("?"));

householdSubSet <- householdDataSet[ as.Date(householdDataSet$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(householdDataSet$Date, "%d/%m/%Y") <= "2007-02-02", ];


# Plot 2. Line plot of the Global Active Power dimension over time

datetimes <- strptime(paste(householdSubSet$Date, householdSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S");
power <- as.numeric(householdSubSet$Global_active_power);

# open png device for plot output
png("plot2.png", width=504, height=504);

# plot line chart with no annotations
plot(datetimes, power, type = "l", ann = FALSE);

# add labels to axis
title(ylab="Global Active Power (kilowatts)")
title(xlab="")

# close device
dev.off();

# clean up memory
rm(list=ls());
