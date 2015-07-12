install.packages("lubridate")
install.packages("Rcpp")
library(lubridate)
hpc <- read.table( "./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")  # dataframe with data of power consumption
selhpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007") # select specific dates
selhpc$daymin <- dmy(selhpc$Date) + hms(selhpc$Time)  # build independent variable for plot
Sys.setlocale("LC_TIME", "English")  # make labels in english (programmer native languaje is spanish)
png('plot2.png', width = 480, height = 480)  # select graphic device
plot(selhpc$daymin,selhpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" ) #print scatterplot
dev.off() # close graphic device
