#  plot4.R
#  Coursera_Data_Science
#
#  Created by Chad Junkermeier on 9/7/15.
#  Copyright (c) 2015 Chad Junkermeier. All rights reserved.


#read in the data
data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), na.strings="?", header=TRUE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", colClasses=c("character", "character", "numeric", "numeric" , "numeric", "numeric", "numeric", "numeric", "numeric"))


# The next three lines are used to create values used for the x-axis
d <- paste(data$Date, data$Time)
t <- strptime(d, format="%d/%m/%Y %H:%M:%S")
x <- unlist(c(0,cumsum(as.numeric(diff(t)))))



# This line opens a png graphics device with a file name of plot4.png
png(file="plot4.png")

#this is used to create four plot windows within the graphics device.
#The par(mfrow=c(2,2)) command must come after the opening of the graphics device.
par(mfrow=c(2,2),mar=c(4,4,4,1))






#################
## First plot
#################

plot(x, data$Global_active_power, type='l',ann=FALSE,axes=FALSE) 
box()
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,24*60,48*60),cex.axis=1,padj=-0.3)
axis(side=2,labels=TRUE,cex.axis=1.1, padj=0.3)
mtext("Global Active Power", side = 2, line =2 , outer = FALSE,cex =1)




#################
## Second plot
#################

plot(x, data$Voltage, type='l',ann=FALSE,axes=FALSE) 
box()
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,24*60,48*60),cex.axis=1,padj=-0.3)
axis(side=2,labels=TRUE,cex.axis=1.1, padj=0.3)
mtext("Voltage", side = 2, line =2 , outer = FALSE,cex =1)





#################
## Third plot
#################
plot(x, data$Sub_metering_1,type='l',ann=FALSE,axes=FALSE,col="black") 
points(x, data$Sub_metering_2,type='l',col="red") 
points(x, data$Sub_metering_3,type='l',col="blue") 

box()

legend("topright",col=c("black", "red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c("solid"))

axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,24*60,48*60),cex.axis=1,padj=-0.3)


axis(side=2,labels=TRUE,cex.axis=1.1, padj=0.3)
mtext("Energy Sub metering", side = 2, line =2 , outer = FALSE,cex =1)




#################
## Fourth plot
#################

plot(x, data$Global_reactive_power, type='l',ann=FALSE,axes=FALSE) 
box()
axis(side=1,labels=c("Thu","Fri","Sat"),at=c(0,24*60,48*60),cex.axis=1,padj=-0.3)
axis(side=2,labels=TRUE,cex.axis=1.1, padj=0.3)
mtext("Global_reactive_power", side = 2, line =2 , outer = FALSE,cex =1)













dev.off()








