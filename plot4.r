initial <- read.table("household_power_consumption.txt",nrows=100)
classes<-sapply(initial,class)
colN <- c("Data","Time","Global_Active_Power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
tabAll <-read.table("household_power_consumption.txt",colClasses = classes,nrows = 2880,skip=66637,sep = ";",col.names = colN)

tabAll$Data <- strptime(paste(tabAll$Data,tabAll$Time),"%e/%m/%Y%T")

par(mfrow = c(2,2))
#First Plot
yl <- "Global Active Power"
xl <- ""
plot(tabAll$Data,tabAll$Global_Active_Power,"l",xlab = xl,ylab = yl)

#Second Plot
xl <-"datetime"
yl <-"Voltage"
with(tabAll, plot(Data,Voltage,"l",xlab = xl,ylab = yl))

#Third Plot
xl <- ""
yl <-"Energy sub metering"
with(tabAll,{
    plot(Data,Sub_metering_1,"l",xlab = xl,ylab = yl)
    points(Data,Sub_metering_2,"l",col= "red")
    points(Data,Sub_metering_3,"l",col = "blue")
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.4,y.intersp= 0.2,bty = "n",pch = 45,col = c("black","blue","red"))
    
})

#Fourth Plot
xl <-"datetime"
yl <-"Global_reactive_power"
with(tabAll, plot(Data,Global_reactive_power,"l",xlab = xl,ylab = yl))

