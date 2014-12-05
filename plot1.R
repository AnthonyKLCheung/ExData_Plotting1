
## read all the data in
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

## Date column is in Factor type, adding another column to hold the Date in Date type
data$CDate <- as.Date(data$Date, format = "%d/%m/%Y")

## select only the data for feb 1st and 2nd of 2007
sData <- data[data$CDate >= "2007-02-01" & data$CDate <= "2007-02-02",]

## open a png device with the right width and height (those are the defaults, do it anyway)
png(filename = "plot1.png", width = 480, height = 480)

## plot the histogram with red bars, the right title, and x axis label
hist(as.numeric(as.character(sData$Global_active_power)), col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

## close the png device
dev.off()