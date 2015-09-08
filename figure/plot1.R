#  plot1.R
#  Coursera_Data_Science
#
#  Created by Chad Junkermeier on 9/7/15.
#  Copyright (c) 2015 Chad Junkermeier. All rights reserved.





#This will read in every column, but I don't really want that.
#x = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), na.strings="?", header=TRUE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))



# "In a comment, Michael pointed out that if you don't need all the columns in your dataset, providing their colClass as NULL will exclude them from being loaded." -- http://blog.mollietaylor.com/2013/09/using-colclasses-to-load-data-more.html


#This will read in only the columns that I am looking for. 


x = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), na.strings="?", header=TRUE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", colClasses=c("NULL", "NULL", "numeric", "NULL" , "NULL", "NULL", "NULL", "NULL", "NULL"))

png(file="plot1.png")


hist(x$Global_active_power, breaks=16, col="red", xlab="Global Active Power (kilowatts)", 
  	main="Global Active Power") 


dev.off()










