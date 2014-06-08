## reading the file
x<-read.csv.sql("household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'", header=TRUE, sep=";")

## create the graph
png(filename="plot1.png", width=480, height=480, units="px")
with(y,hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()
