#
#
#

householdDataFile = ".\\data\\household_power_consumption.txt";

householdDataSet <- read.table(householdDataFile, sep=";", header=T, na.strings = c("?"));

householdSubSet <- householdDataSet[ as.Date(householdDataSet$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(householdDataSet$Date, "%d/%m/%Y") <= "2007-02-02", ];


# Plot 1. Histogram plot of the Global Active Power dimension

# open png device for plot output
png("plot1.png", width=504, height=504);

# plot histogram
hist(householdSubSet$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency");

#close device
dev.off();

# clean up memory
rm(list=ls());
