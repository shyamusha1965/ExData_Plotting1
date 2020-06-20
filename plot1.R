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

hist(fildata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(Kilowatt)",ylab="Frequency")




png("plot1.png", width=480, height=480)
dev.off()




