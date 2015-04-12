# Loading data set
household_power_consumption <- read.csv("~/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?")

# Filter the data set
filtered.set <- household_power_consumption[(household_power_consumption$Date == '1/2/2007' | household_power_consumption$Date == '2/2/2007'), ]
filtered.set$combined <- paste(filtered.set$Date, filtered.set$Time)
#filtered.set$result <- strptime(filtered.set$combined, format="%Y-%m-%d %H:%M:%S")
filtered.set$combined <- strptime(filtered.set$combined, format="%Y-%m-%d %H:%M:%S")

with(filtered.set, plot(combined, Global_active_power, type='l',
                        main = " ",
                        xlab = "",
                        ylab = "Global Active Power (kilowatts)"))

dev.copy(png, "Plot2.png")
dev.off()