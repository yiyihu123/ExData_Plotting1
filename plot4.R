




data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)
head(data)
library(dplyr)
data <- tbl_df(data)
data
data$new <- paste(data$Date, data$Time)
library(lubridate)
data$Date <- dmy(data$Date)
data$new <- dmy_hms(data$new)
epc <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")

dev.set(6)
tiff("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(epc$new, epc$Global_active_power, type = "l", ylab="Global Active Power(kilowatts)", xlab="")

plot(epc$new, epc$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(epc$new,epc$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(epc$new,epc$Sub_metering_2, col="red")
lines(epc$new,epc$Sub_metering_3, col="blue")
legend("topright", lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))

plot(epc$new, epc$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()