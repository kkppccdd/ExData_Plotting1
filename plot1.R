data<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
sample<-data[data$Date > as.Date("2007-01-31",format="%Y-%m-%d") & data$Date < as.Date("2007-02-03",format="%Y-%m-%d"),]
h<-hist(sample$Global_active_power)

png(filename="plot1.png",width=480,height=480)
plot(h,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")

dev.off()