plot4 <- function()
{
  ##--------------------Initialize
  setwd("C:/Users/Lenovo/Documents/CourseProject1")
  png ("plot4.png", width = 480, height = 480)
  data <- read.table ("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
  data <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  x <- paste (data$Date, data$Time)
  x <- strptime (x, format = "%Y-%m-%d %H:%M:%S")
  par(mfcol = c(2,2))
  
  
  ##--------------------Graph 1
  plot (x, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

  ##--------------------Graph 2
  plot (x, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  par (new = TRUE)
  plot (x, data$Sub_metering_2, type = "l", xlab= "", ylab = "Energy sub metering", col = "blue", axes = FALSE, ylim = range (c(data$Sub_metering_1,data$Sub_metering_2)))
  par (new = TRUE)
  plot (x, data$Sub_metering_3, type = "l", xlab= "", ylab = "Energy sub metering", col = "red", axes = FALSE, ylim = range (c(data$Sub_metering_1,data$Sub_metering_3)))
  legend ("topright", lwd = 2,col = c("black", "red", "blue"), legend = c ("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
  
  
  ##--------------------------Graph 3
  
  plot (x, data$Voltage, type = "l", xlab = "datetime", ylab= "Voltage")
  
  ##--------------------------Graph 4
  plot (x, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  
  
  dev.off()
  
}
