




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
tiff("plot2.png", width = 480, height = 480)

plot(epc$new, epc$Global_active_power, type = "l", ylab="Global Active Power(kilowatts)", xlab="")
dev.off()