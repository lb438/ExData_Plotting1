## reading the file
x<-read.csv.sql("household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'", header=TRUE, sep=";")

## Convert Date & Time and Append
DateTime <- strptime(paste(x[,1],x[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")
y <-cbind(x,DateTime)

## create the graph
png(filename="plot2.png", width=480, height=480, units="px")
with(y,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
