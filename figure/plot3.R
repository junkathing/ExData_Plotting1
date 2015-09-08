#  plot3.R
#  Coursera_Data_Science
#
#  Created by Chad Junkermeier on 9/7/15.
#  Copyright (c) 2015 Chad Junkermeier. All rights reserved.




#This will read in every column, but I don't really want that.
#x = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), na.strings="?", header=TRUE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", colClasses=c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))



# "In a comment, Michael pointed out that if you don't need all the columns in your dataset, providing their colClass as NULL will exclude them from being loaded." -- http://blog.mollietaylor.com/2013/09/using-colclasses-to-load-data-more.html


#This will read in only the columns that I am looking for. 


data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), na.strings="?", header=TRUE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", colClasses=c("character", "character", "NULL", "NULL" , "NULL", "NULL", "numeric", "numeric", "numeric"))


# The next three lines are used to create values used for the x-axis
d <- paste(data$Date, data$Time)
t <- strptime(d, format="%d/%m/%Y %H:%M:%S")
x <- unlist(c(0,cumsum(as.numeric(diff(t)))))


# This line opens a png graphics device with a file name of plot3.png
png(file="plot3.png")


#the next eight lines make the plot, titles, and axes
plot(x, data$Sub_metering_1,type='l',ann=FALSE,axes=FALSE,col="black") 
points(x, data$Sub_metering_2,type='l',col="red") 
points(x, data$Sub_metering_3,type='l',col="blue") 
box()
legend("topright",col=c("black", "red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c("solid"))
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,24*60,48*60),cex.axis=1,padj=-0.3)
axis(side=2,labels=TRUE,cex.axis=1.1, padj=0.3)
mtext("Energy Sub metering", side = 2, line =2 , outer = FALSE,cex =1)

#turns the png device off

dev.off()







