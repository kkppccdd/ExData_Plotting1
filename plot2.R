data<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
sample<-data[data$Date > as.Date("2007-01-31",format="%Y-%m-%d") & data$Date < as.Date("2007-02-03",format="%Y-%m-%d"),]
sample$DateTime <-as.POSIXct(paste(sample$Date,sample$Time),format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png",width=480,height=480)
plot(x=sample$DateTime,y=sample$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()