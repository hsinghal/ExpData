# Loading data set
household_power_consumption <- read.csv("~/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?")

# Filter the data set
filtered.set <- household_power_consumption[(household_power_consumption$Date == '1/2/2007' | household_power_consumption$Date == '2/2/2007'), ]
filtered.set$combined <- paste(filtered.set$Date, filtered.set$Time)
#filtered.set$result <- strptime(filtered.set$combined, format="%Y-%m-%d %H:%M:%S")
#filtered.set$combined <- strptime(filtered.set$combined, format="%Y-%m-%d %H:%M:%S")
filtered.set$combined <- strptime(filtered.set$combined, format="%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2), mar = c(5,4,2,1))
with(filtered.set, plot(combined, Global_active_power, type='l',
                        main = " ",
                        xlab = "",
                        ylab = "Global Active Power (kilowatts)"))
with(filtered.set, plot(combined, Voltage, type='l',
                        xlab="datetime"))
with(filtered.set, plot(combined, Sub_metering_1, 
                        type='n',
                        xlab="",
                        ylab="Energy sub metering"))
lines(filtered.set$combined, filtered.set$Sub_metering_1, col='black')
lines(filtered.set$combined, filtered.set$Sub_metering_2, col='red')
lines(filtered.set$combined, filtered.set$Sub_metering_3, col='blue')
legend("topright", pch="-", col=c("black",
                                  "red",
                                  "blue"), 
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))
with(filtered.set, plot(combined, Global_reactive_power, type='l',
                        xlab="datetime"))


dev.copy(png, "Plot4.png", width=480, height=480)
dev.off()