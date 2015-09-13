plot3 <- function()
{
  setwd("C:/Users/Lenovo/Documents/CourseProject1")
  
  png ("plot3.png", width = 480, height = 480)
  data <- read.table ("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
  data <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  x <- paste (data$Date, data$Time)
  x <- strptime (x, format = "%Y-%m-%d %H:%M:%S")
  plot (x, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  par (new = TRUE)
  plot (x, data$Sub_metering_2, type = "l", xlab= "", ylab = "Energy sub metering", col = "blue", axes = FALSE, ylim = range (c(data$Sub_metering_1,data$Sub_metering_2)))
  par (new = TRUE)
  plot (x, data$Sub_metering_3, type = "l", xlab= "", ylab = "Energy sub metering", col = "red", axes = FALSE, ylim = range (c(data$Sub_metering_1,data$Sub_metering_3)))
  legend ("topright", lwd = 2,col = c("black", "red", "blue"), legend = c ("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
  dev.off()
}
