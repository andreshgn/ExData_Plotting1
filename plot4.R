#Read data saved in working directory
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Subset data to get only data from the dates 2007-02-01 and 2007-02-02
dataFeb <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Create a variable datetime formatted as object of class POSTXlt to represent date and time
dataFeb$datetime <- strptime(paste(dataFeb$Date, dataFeb$Time), "%d/%m/%Y %H:%M:%S")

#Builds and saves a two by two set of plots - plot4
par(mfrow=c(2,2))
with(dataFeb,{
    #Plot1
    plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    #Plot2
    plot(datetime, Voltage, type="l")
    #Plot3
    plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, type="l", col="red")
    lines(datetime, Sub_metering_3, type="l", col="blue")
    legend ("topright", lty="solid", col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    #Plot4
    plot(datetime, Global_reactive_power, type="l", xlab="datetime")
})
dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()