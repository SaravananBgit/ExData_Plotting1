plot2 <- function(){
  ## Function to create graph for "Global Active Power over datetime for dates 1/2/2007 and 2/2/2007
  ## and store the graph in 'plot2.png' file 
  
  InputDF <- data.frame()
  filename <- "./data/household_power_consumption.txt"
  
  InputDF <- read.csv2(filename)
  RequiredData <- data.frame()
  RequiredData <- subset(InputDF, Date == "1/2/2007"  | Date == "2/2/2007")
  png(filename = "plot2.png", width=480, height=480)
  datetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  RequiredData$Global_active_power <- as.numeric(as.character(RequiredData$Global_active_power))
  
  plot(datetime,RequiredData$Global_active_power,type="l",xlab="",ylab="Global Active Power (killowats)")
  
  dev.off()
  ## Graph saved in 'plot2.png' file 
}