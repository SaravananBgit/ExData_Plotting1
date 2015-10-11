plot4 <- function(){
  ## Function to create graph for "Global Active Power over datetime for dates 1/2/2007 and 2/2/2007
  ## and store the graph in 'plot4.png' file 
  
  InputDF <- data.frame()
  filename <- "./data/household_power_consumption.txt"
  
  InputDF <- read.csv2(filename)
  RequiredData <- data.frame()
  RequiredData <- subset(InputDF, Date == "1/2/2007"  | Date == "2/2/2007")
  
  datetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  RequiredData$Global_active_power <- as.numeric(as.character(RequiredData$Global_active_power))
  RequiredData$Voltage <- as.numeric(as.character(RequiredData$Voltage))
  RequiredData$Sub_metering_1 <- as.numeric(as.character(RequiredData$Sub_metering_1))
  RequiredData$Sub_metering_2 <- as.numeric(as.character(RequiredData$Sub_metering_2))
  RequiredData$Sub_metering_3 <- as.numeric(as.character(RequiredData$Sub_metering_3))
  RequiredData$Global_reactive_power <- as.numeric(as.character(RequiredData$Global_reactive_power))
  
  png(filename = "plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  ## Graph 1
  plot(datetime,RequiredData$Global_active_power,type="l",xlab="",ylab="Global Active Power")
    ##Graph 2
  plot(datetime,RequiredData$Voltage,type="l",xlab="datetime",ylab="Voltage")
    ##Graph 3
  plot(datetime,RequiredData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(datetime,RequiredData$Sub_metering_2,col="red",type="l")
  lines(datetime,RequiredData$Sub_metering_3,col="blue",type="l")
  
  ##Graph 4
 
  plot(datetime,RequiredData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  dev.off()
  ## Graph saved in 'plot4.png' file 
}