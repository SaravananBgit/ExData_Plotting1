plot1 <- function(){
  ## Function to create graph for "Frequency of Global Active Power" for dates 1/2/2007 and 2/2/2007
  ## and store the graph in 'plot1.png' file 
  
  InputDF <- data.frame()
  filename <- "./data/household_power_consumption.txt"
  InputDF <- read.csv2(filename)
  RequiredData <- data.frame()
  RequiredData <- subset(InputDF, Date == "1/2/2007"  | Date == "2/2/2007")
  png(filename = "plot1.png", width=480, height=480)
  hist(as.numeric(as.character(RequiredData$Global_active_power)), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  dev.off()
  ## Graph saved in 'plot1.png' file 
}