#set column classes
cc <- c(NA, NA, rep("numeric", 7))

#read data from file
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = '.', colClasses = cc, na.strings = "?")

#subset data for given period of time
hpc <- subset(hpc, Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png", height = 480, width = 480)
hist(hpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
