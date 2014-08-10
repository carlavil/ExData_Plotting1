#read data
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
data <- household_power_consumption

#create new column with Date/Time class and subset to rows with Dates 2/2/2007 or 1/2/2007
data$NewDateTime <- paste(data$Date, data$Time, sep=',')
data$NewDateTime <- strptime(data$NewDateTime, format="%d/%m/%Y,%H:%M:%S")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007" ,]

#plot 1. make Global Active Power column numeric and create histogram
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
png("plot1.png", width =480, height=480, units="px")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
