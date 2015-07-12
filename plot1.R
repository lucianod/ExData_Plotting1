hpc <- read.table( "./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")  # dataframe with data of power consumption
selhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007") # select specific dates
png('plot1.png', width = 480, height = 480)   # select graphic device
hist(selhpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" ) # plot histogram
dev.off() # close graphic device
