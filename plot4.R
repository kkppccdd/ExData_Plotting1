data<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
sample<-data[data$Date > as.Date("2007-01-31",format="%Y-%m-%d") & data$Date < as.Date("2007-02-03",format="%Y-%m-%d"),]
sample$DateTime <-as.POSIXct(paste(sample$Date,sample$Time),format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(x=sample$DateTime,y=sample$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(x=sample$DateTime,y=sample$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(x=sample$DateTime,y=sample$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",ylim=c(0,40),col="black")
lines(x=sample$DateTime,y=sample$Sub_metering_2,col="red")
lines(x=sample$DateTime,y=sample$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),plot = TRUE,lty=c(1,1,1),box.lwd=0)

plot(x=sample$DateTime,y=sample$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()

