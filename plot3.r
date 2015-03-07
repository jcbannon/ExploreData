#Plot3 - JCBannon 03/07/2015

power <- read.table("household_power_consumption.txt", header = T, sep=";",na.strings='?', stringsAsFactors = F)

# convert the Date and Time to Date/Time using the strptime() and as.Date() functions
power$Date <- as.Date(power$Date,"%d/%m/%Y")

# subset for 02/01/2007 - 02/02/2007
power2 <- subset(power, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
                 

power2$Time2 <- strptime(paste(as.character(power2$Date),power2$Time),
                         "%Y-%m-%d %H:%M:%S")


png("plot3.png")
plot(power2$Time2, power2$Sub_metering_1, type = "l",
     xlab = "",ylab = "Energy sub metering")
lines(power2$Time2, power2$Sub_metering_2, type = "l",col="red")
lines(power2$Time2, power2$Sub_metering_3, type = "l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty=1)
dev.off()
