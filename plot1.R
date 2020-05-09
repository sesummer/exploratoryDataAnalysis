data <- read.delim("household_power_consumption.txt",sep=";",na = c("?"))
data$Datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
subset = data[data$Datetime < "2007-02-03 00:00:00" & data$Datetime >= "2007-02-01 00:00:00",]

png("plot1.png",width=480,height=480)
hist(subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200), col="red")
dev.off()