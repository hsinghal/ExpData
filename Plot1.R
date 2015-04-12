# Loading data set
household_power_consumption <- read.csv("~/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?")

# Filter the data set
filtered.set <- household_power_consumption[(household_power_consumption$Date == '1/2/2007' | household_power_consumption$Date == '2/2/2007'), ]

# Plot histogram required?
hist(filtered.set$Global_active_power,
     col='red',
     main = "Global Active Power",
     xlab = "Global Active power (kilowatts)",
     )

dev.copy(png, "Plot1.png")
dev.off()