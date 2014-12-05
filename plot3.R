
## read all the data in
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

## Date column is in Factor type, adding another column to hold the Date in Date type
data$CDate <- as.Date(data$Date, format = "%d/%m/%Y")

## select only the data for feb 1st and 2nd of 2007
sData <- data[data$CDate >= "2007-02-01" & data$CDate <= "2007-02-02",]

## Date and Time column are in Factor type, adding another column to hold the Date and time in POSIXlt type
## not doing this column right from the beginning because of performance
sData$DateTime <- strptime(paste(as.character(sData$Date), as.character(sData$Time), sep=" "), format="%d/%m/%Y %H:%M:%S")

## make sure the rows are in increasing order of date and time
sData<-sData[order(sData$DateTime),]

## open a png device with the right width and height (those are the defaults, do it anyway)
png(filename = "plot3.png", width = 480, height = 480)

## plot the Energy Sub Meterings 
with(sData, plot(sData$DateTime,  as.numeric(as.character(sData$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = ""))
points(sData$DateTime,  as.numeric(as.character(sData$Sub_metering_2)), type = "l", col = "red")
points(sData$DateTime,  sData$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

## close the png device
dev.off()

