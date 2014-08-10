#read data
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
data <- household_power_consumption
#create new column with Date/Time class and subset to rows with Dates 2/2/2007 or 1/2/2007
data$NewDateTime <- paste(data$Date, data$Time, sep=',')
data$NewDateTime <- strptime(data$NewDateTime, format="%d/%m/%Y,%H:%M:%S")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]


#plot 2. Create a line plot with the column Global Active Power and change the labels
png("plot2.png", width =480, height=480, units="px")
plot(data$NewDateTime, data$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()