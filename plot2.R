#Data downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
#on 11/4/2015



library(data.table)
power_data <- fread('household_power_consumption.txt')
# Select out just data in the dates specified in the instructions
mydates <- power_data[Date %in% c("1/2/2007","2/2/2007"),]
png('plot2.png')
plot(mydates$Global_active_power,xaxt="n", type="l", ylab='Global Active Power (kilowatts)', xlab=NA)
axis(1, at= c(1, nrow(mydates)/2, nrow(mydates) ), labels=c("Thu","Fri","Sat"))
dev.off()


