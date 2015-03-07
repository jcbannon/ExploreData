#Plot2 - JCBannon 03/07/2015

power <- read.table("household_power_consumption.txt", header = T, sep=";",na.strings='?', stringsAsFactors = F)

# convert the Date and Time to Date/Time using the strptime() and as.Date() functions
power$Date <- as.Date(power$Date,"%d/%m/%Y")

# subset for 02/01/2007 - 02/02/2007
power2 <- subset(power, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
                 

power2$Time2 <- strptime(paste(as.character(power2$Date),power2$Time),
                         "%Y-%m-%d %H:%M:%S")


png("plot2.png")
plot(power2$Time2, power2$Global_active_power, type = "l",
     xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
