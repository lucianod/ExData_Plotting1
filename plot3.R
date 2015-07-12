install.packages("lubridate")
install.packages("Rcpp")
library(lubridate)
hpc <- read.table( "./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")  # dataframe with data of power consumption
selhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007") # select specific dates
selhpc$daymin <- dmy(selhpc$Date) + hms(selhpc$Time)  # build independent variable for plot
Sys.setlocale("LC_TIME", "English")  # make labels in english (programmer native languaje is spanish)
png('plot3.png', width = 480, height = 480) # select graphic device
plot(selhpc$daymin,selhpc$Sub_metering_1, type = "l", col = "black", ylim=c(0, 40), xlab = "", ylab = "Energy sub metering") #plot first dependent variable
par(new=T)  # next plot in same graph
plot(selhpc$daymin,selhpc$Sub_metering_2, type = "l", col = "red", ylim=c(0, 40), xlab = "", ylab = "Energy sub metering") #plot second dependent variable
par(new=T)  # next plot in same graph
plot(selhpc$daymin,selhpc$Sub_metering_3, type = "l", col = "blue", ylim=c(0, 40), xlab = "", ylab = "Energy sub metering")  #plot third dependent variable
par(new=T)  # next element in same graph
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1), col=c("black", "red", "blue" ))  # print legend
dev.off() # close graphic device
