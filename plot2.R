data <- read.delim("household_power_consumption.txt",sep=";",na = c("?"))
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
subset = data[data$Datetime < "2007-02-03 00:00:00" & data$Datetime >= "2007-02-01 00:00:00",]

png("plot2.png",width=480,height=480)
plot(subset$Datetime,subset$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()