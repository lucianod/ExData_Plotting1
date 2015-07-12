install.packages("lubridate")
install.packages("Rcpp")
library(lubridate)
hpc <- read.table( "./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")  # dataframe with data of power consumption
selhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007") # select specific dates
selhpc$daymin <- dmy(selhpc$Date) + hms(selhpc$Time)  # build independent variable for plot
Sys.setlocale("LC_TIME", "English")  # make labels in english (programmer native languaje is spanish)
png('plot4.png', width = 480, height = 480) # select graphic device
par(mfrow = c (2,2)) # set graphic area for 4 plots in a square array
plot(selhpc$daymin,selhpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" ) # first plot
plot(selhpc$daymin,selhpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage" )  # second plot
plot(selhpc$daymin,selhpc$Sub_metering_1, type = "l", col = "black", ylim=c(0, 40), xlab = "", ylab = "Energy sub metering") # start third plot
par(new=T)
plot(selhpc$daymin,selhpc$Sub_metering_2, type = "l", col = "red", ylim=c(0, 40), xlab = "", ylab = "Energy sub metering")
par(new=T)
plot(selhpc$daymin,selhpc$Sub_metering_3, type = "l", col = "blue", ylim=c(0, 40), xlab = "", ylab = "Energy sub metering")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd = c(.1,.1,.1), col=c("black", "red", "blue" ), cex=.85, bty = "n") #finish third plot
plot(selhpc$daymin,selhpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" ) #fourth plot
dev.off() # close graphic device