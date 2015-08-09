#Read data saved in working directory
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Subset data to get only data from the dates 2007-02-01 and 2007-02-02
dataFeb <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Create a variable datetime formatted as object of class POSTXlt to represent date and time
dataFeb$datetime <- strptime(paste(dataFeb$Date, dataFeb$Time), "%d/%m/%Y %H:%M:%S")

#Builds and saves an histogram
hist(dataFeb$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()