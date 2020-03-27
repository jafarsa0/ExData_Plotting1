#4th plot
#4 Plots 

#reading data only for 1st and 2nd feb of 2007
power<- read.table("./Data/household_power_consumption.txt" , sep = ";" , header = FALSE , nrows =2880 , skip = 66637 , na.strings = "?",)


#reading column names from the file
Nn <- read.table("./Data/household_power_consumption.txt" , sep =";" , nrows = 1  , colClasses = "character" )




#assiging column names for our power dataset
names(power) <- as.character(Nn[1,])


#adding day column for more ease dealing with plots
library(lubridate)
power$date_time <- paste(power$Date , power$Time)
power$date_time <- dmy_hms(power$date_time)



#building our plots
png("plot4.png")
par(mfrow =  c(2,2))

plot (x = power$date_time , y = power$Global_active_power , type = "l" , ylab = "Global Active Power (kilowatts)" , xlab = "")

plot (x = power$date_time , y = power$Voltage , type = "l" , ylab = "Voltage" , xlab = "datetime")


plot(power$date_time , power$Sub_metering_1 , ylab = "Energy Sub Metering" , xlab = "" , type = "n")
lines(power$date_time , power$Sub_metering_1 )
lines(power$date_time , power$Sub_metering_2 , col = "red")
lines(power$date_time , power$Sub_metering_3 , col = "blue")
legend("topright" , legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3") , col = c("black" , "red" , "blue") , lty = 1)

plot(power$date_time , power$Global_reactive_power , type = "l" , xlab = "datetime" , ylab = "Global Reactive Power")

dev.off()