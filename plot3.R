# plot3.R - Global Active Power
## Cary Grant Anderson 
## August 8, 2014

## 1. Read in the unzipped data set.
data_Set_Full <- read.csv("./Data/household_power_consumption.txt", header=T, na.strings="?", sep=';') 

## 2. Convert the date string into a true date.
data_Set_Full$Date <- as.Date(data_Set_Full$Date, format="%d/%m/%Y")

## 3. Subset the data to get only the data with dates between 2/1/2007 and 2/2/2007.
data_Set_Feb_1_To_2 <- subset(data_Set_Full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## 4. Remove the full data set from memory.
rm(data_Set_Full)

## 5. Create the DateTime column for the plot.
data_Set_Feb_1_To_2$Datetime <- as.POSIXct(paste(as.Date(data_Set_Feb_1_To_2$Date), data_Set_Feb_1_To_2$Time))

## 6. Create Plot 3 - Energy sub metering

plot(data_Set_Feb_1_To_2$Sub_metering_1~data_Set_Feb_1_To_2$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(data_Set_Feb_1_To_2$Sub_metering_2~data_Set_Feb_1_To_2$Datetime,col='Red')
lines(data_Set_Feb_1_To_2$Sub_metering_3~data_Set_Feb_1_To_2$Datetime,col='Blue')

## 6.b. Create the legend.
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## 7. Save the plot to a PNG file.
dev.copy(png, file="plot3.png", height=480, width=480)

## 8. Unload the graphic device.
dev.off()




