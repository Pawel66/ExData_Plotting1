#set column classes
cc <- c(NA, NA, rep("numeric", 7))

#read data from file
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = '.', colClasses = cc, na.strings = "?")

#subset data for given period of time
hpc <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

#ATTENTION
#because of my system setting abbreviations of weekdays' names are in Polish
#"Thu" = "czw", "Fri" = "ptk", "Sat" = "sob"
datetime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", height = 480, width = 480)
plot(datetime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, hpc$Sub_metering_2, type = "l", col= "red")
lines(datetime, hpc$Sub_metering_3, type = "l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
dev.off()

