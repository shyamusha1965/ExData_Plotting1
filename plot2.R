library(dslabs)
library(dplyr)

data=read.table("household_power_consumption.txt",sep=";",header=T, na.strings="?")


fildata=filter(data,data$Date %in% c("1/2/2007","2/2/2007"))

fildata$Global_active_power=as.numeric(fildata$Global_active_power)
fildata$Date=as.Date(fildata$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(fildata$Date), fildata$Time)
fildata$Datetime <- as.POSIXct(datetime)

fildata$weekdays=weekdays(fildata$Datetime)



par(mfrow=c(1,1))


plot(fildata$Global_active_power~fildata$Datetime,type="l",xlab="",ylab="Global Active Power(Kilowatt)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
