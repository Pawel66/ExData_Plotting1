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

png("plot2.png", height = 480, width = 480)
plot(datetime, as.numeric(hpc$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

