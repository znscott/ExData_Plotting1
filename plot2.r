

initial <- read.table("household_power_consumption.txt",nrows=100)
classes<-sapply(initial,class)
colN <- c("Data","Time","Global_Active_Power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
tabAll <-read.table("household_power_consumption.txt",colClasses = classes,nrows = 2880,skip=66637,sep = ";",col.names = colN)

tabAll$Data <- strptime(paste(tabAll$Data,tabAll$Time),"%e/%m/%Y%T")

yl <- "Global Active Power(killowatts)"
xl <- ""

plot(tabAll$Data,tabAll$Global_Active_Power,"l",xlab = xl,ylab = yl)
