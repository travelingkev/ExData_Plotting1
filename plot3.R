#Data downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
#on 11/4/2015



library(data.table)
power_data <- fread('household_power_consumption.txt')
# Select out just data in the dates specified in the instructions
mydates <- power_data[Date %in% c("1/2/2007","2/2/2007"),]

# make plot 3 for energy sub metering
png('plot3.png')

# add plot and lines for data
plot(mydates$Sub_metering_1,xaxt="n", type="l", ylab='Energy sub metering', xlab=NA)
lines(mydates$Sub_metering_2, col="red")
lines(mydates$Sub_metering_3, col="blue")

# add legend and update axis
axis(1, at= c(1, nrow(mydates)/2, nrow(mydates) ), labels=c("Thu","Fri","Sat"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
