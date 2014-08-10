#read data
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
data <- household_power_consumption

#create new column with Date/Time class and subset to rows with Dates 2/2/2007 or 1/2/2007
data$NewDateTime <- paste(data$Date, data$Time, sep=',')
data$NewDateTime <- strptime(data$NewDateTime, format="%d/%m/%Y,%H:%M:%S")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]


#plot 4. convert global_reactive_power to numeric then plot the 4 graphs with function par
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
png("plot4.png", width =480, height=480, units="px")
par(mfrow=c(2,2))
plot(data$NewDateTime, data$Global_active_power, type ="l", xlab="", ylab="Global Active Power")
plot(data$NewDateTime, data$Voltage, type ="l", xlab="datetime", ylab="Voltage")
plot(data$NewDateTime, data$Sub_metering_1, type ="n", xlab="", ylab="Energy Sub Metering")
points(data$NewDateTime, data$Sub_metering_1, type ="l")
points(data$NewDateTime, data$Sub_metering_2, type ="l",col="red")
points(data$NewDateTime, data$Sub_metering_3, type ="l",col="blue")
legend("topright",lwd=1, bty="n", col=c("black","red","blue"), legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
plot(data$NewDateTime, data$Global_reactive_power, type ="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
