library(dslabs)
library(dplyr)

data=read.table("household_power_consumption.txt",sep=";",header=T, na.strings="?")


fildata=filter(data,data$Date %in% c("1/2/2007","2/2/2007"))

fildata$Global_active_power=as.numeric(fildata$Global_active_power)
fildata$Date=as.Date(fildata$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(fildata$Date), fildata$Time)
fildata$Datetime <- as.POSIXct(datetime)

fildata$weekdays=weekdays(fildata$Datetime)




par(mfrow=c(2,2))



plot(fildata$Global_active_power~fildata$Datetime,type="l",xlab="",ylab="Global Active Power(Kilowatt)")



plot(fildata$Voltage~fildata$Datetime,type="l",xlab="",ylab="Voltage(Volt)")


plot(fildata$Sub_metering_1~fildata$Datetime,type="l",xlab="",ylab="Energy sub metering")
points(fildata$Sub_metering_2~fildata$Datetime,col="red",type="l")
points(fildata$Sub_metering_3~fildata$Datetime,col="blue",type="l")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



plot(fildata$Global_reactive_power~fildata$Datetime,type="l",xlab="",ylab="Global Reactive Power(Kilowatt)")



dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
