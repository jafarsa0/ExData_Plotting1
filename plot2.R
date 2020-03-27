#2nd plot
#Line Plot 

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



#build our line plot
png(filename = "plot2.png")
plot (x = power$date_time , y = power$Global_active_power , type = "l" , ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off()