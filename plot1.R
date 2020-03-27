#1st plot
#Histogram 

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




#building histogram for Globel Active Power
png(filename = "plot1.png")
hist(power$Global_active_power , col = "red" , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)" , 
     ylab = "Frequency")
dev.off()