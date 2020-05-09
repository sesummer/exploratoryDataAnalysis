data <- read.delim("household_power_consumption.txt",sep=";",na = c("?"))
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
subset = data[data$Datetime < "2007-02-03 00:00:00" & data$Datetime >= "2007-02-01 00:00:00",]

png("plot3.png",width=480,height=480)
plot(subset$Datetime,subset$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(subset$Datetime,subset$Sub_metering_2, col="red")
lines(subset$Datetime,subset$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()