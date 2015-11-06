#Data downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
#on 11/4/2015



library(data.table)
power_data <- fread('household_power_consumption.txt')
# Select out just data in the dates specified in the instructions
mydates <- power_data[Date %in% c("1/2/2007","2/2/2007"),]
png('plot4.png')
par(mfrow=c(2,2))
with (mydates, {
    # Plot for Global Active Power
    plot(Global_active_power,xaxt="n", type="l", ylab='Global Active Power', xlab=NA)
    axis(1, at= c(1, nrow(mydates)/2, nrow(mydates) ), labels=c("Thu","Fri","Sat"))
    # Plot for Voltage
    plot(Voltage,xaxt="n", type="l", ylab='Voltage', xlab='datetime')
    axis(1, at= c(1, nrow(mydates)/2, nrow(mydates) ), labels=c("Thu","Fri","Sat"))
    # Plot for Energy Sub Metering
    plot(Sub_metering_1,xaxt="n", type="l", ylab='Energy sub metering', xlab=NA)
    lines(Sub_metering_2, col="red")
    lines(Sub_metering_3, col="blue")
	
	#update axis and add legend
    axis(1, at= c(1, nrow(mydates)/2, nrow(mydates) ), labels=c("Thu","Fri","Sat"))
    legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty='n')

    # Plot for Global Reactive Power
    plot(Global_reactive_power ,xaxt="n", type="l", ylab='Global_reactive_power', xlab='datetime')
    axis(1, at= c(1, nrow(mydates)/2, nrow(mydates) ), labels=c("Thu","Fri","Sat"))
    
})
dev.off()
