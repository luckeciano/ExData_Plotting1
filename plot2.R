plot2 <- function()
{
  setwd("C:/Users/Lenovo/Documents/CourseProject1")
  
  png ("plot2.png", width = 480, height = 480)
  data <- read.table ("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = "?")
  data <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  x <- paste (data$Date, data$Time)
  x <- strptime (x, format = "%Y-%m-%d %H:%M:%S")
  plot (x, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  dev.off()
}

