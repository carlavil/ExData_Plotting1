#read data
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
data <- household_power_consumption

#create new column with Date/Time class and subset to rows with Dates 2/2/2007 or 1/2/2007
data$NewDateTime <- paste(data$Date, data$Time, sep=',')
data$NewDateTime <- strptime(data$NewDateTime, format="%d/%m/%Y,%H:%M:%S")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]

#plot 3. convert all sub metering columns to numeric. then plot the three columns on top of each other
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
png("plot3.png", width =480, height=480, units="px")
plot(data$NewDateTime, data$Sub_metering_1, type ="n", xlab="", ylab="Energy Sub Metering")
points(data$NewDateTime, data$Sub_metering_1, type ="l")
points(data$NewDateTime, data$Sub_metering_2, type ="l",col="red")
points(data$NewDateTime, data$Sub_metering_3, type ="l",col="blue")
legend("topright",lwd=1, col=c("black","red","blue"), legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()