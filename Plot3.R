## reading the file
x<-read.csv.sql("household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'", header=TRUE, sep=";")

## Convert Date & Time and Append
DateTime <- strptime(paste(x[,1],x[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")
y <-cbind(x,DateTime)

## create the graph
png(filename="plot3.png", width=480, height=480, units="px")
with(y,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(y$DateTime,y$Sub_metering_2, type="l",col="red")
lines(y$DateTime,y$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","red","blue"))
dev.off()