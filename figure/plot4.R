# plot4.R - Global Active Power
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


## 6. Create the 4 Plots for Plot #4.

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

### 6.a. Plot 1.
plot(data_Set_Feb_1_To_2$Global_active_power~data_Set_Feb_1_To_2$Datetime, type="l", ylab="Global Active Power", xlab="")

### 6.b. Plot 2.
plot(data_Set_Feb_1_To_2$Voltage~data_Set_Feb_1_To_2$Datetime, type="l", ylab="Voltage", xlab="datetime")

### 6.c. Plot 3.
plot(data_Set_Feb_1_To_2$Sub_metering_1~data_Set_Feb_1_To_2$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(data_Set_Feb_1_To_2$Sub_metering_2~data_Set_Feb_1_To_2$Datetime,col='Red')
lines(data_Set_Feb_1_To_2$Sub_metering_3~data_Set_Feb_1_To_2$Datetime,col='Blue')

### 6.d. Legend for Plot 3.
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

### 6.e. Plot 4.
plot(data_Set_Feb_1_To_2$Global_reactive_power~data_Set_Feb_1_To_2$Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")

## 7. Save the plot to a PNG file.
dev.copy(png, file="plot4.png", height=480, width=480)

## 8. Unload the graphic device.
dev.off()