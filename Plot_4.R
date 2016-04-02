## Made by Julio F C Santos 

rm(list=ls())
library(dplyr)

household_power_consumption <- read.csv(
  "./Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

## Managing the data, organizing the time vector and reclassing
Filter_Data<-filter(household_power_consumption, Date %in% c("1/2/2007","2/2/2007"))
rm(household_power_consumption)
Filter_Data$New_Date<-paste(Filter_Data$Date,Filter_Data$Time, sep = " ")
Filter_Data$New_Date<-strptime(Filter_Data$New_Date, "%d/%m/%Y %H:%M:%S")
Filter_Data$Global_active_power<-as.numeric(as.character(Filter_Data$Global_active_power))
Filter_Data$Global_reactive_power<-as.numeric(as.character(Filter_Data$Global_reactive_power))
Filter_Data$Sub_metering_1<-as.numeric(as.character(Filter_Data$Sub_metering_1))
Filter_Data$Sub_metering_2<-as.numeric(as.character(Filter_Data$Sub_metering_2))
Filter_Data$Sub_metering_3<-as.numeric(as.character(Filter_Data$Sub_metering_3))
Filter_Data$Voltage<-as.numeric(as.character(Filter_Data$Voltage))

## Plot 4
par(mfrow = c(2,2))
# Quadrant 1
with(Filter_Data, plot(New_Date,Global_active_power,
                       type = "l", main = "Global Active Power x Time",
                       ylab = "Global Active Power (Kilowatts)",
                       xlab = "Time"))
# Quadrant 2
with(Filter_Data, plot(New_Date,Voltage,
                       type = "l", main = "Voltage x Time",
                       ylab = "Voltage",
                       xlab = "Time"))
# Quadrant 3
with(Filter_Data, plot(New_Date,Sub_metering_1, type = "l",
                       main = "Energy Sub Metering",
                       ylab ="Energy Sub Metering", xlab = "Time"))
with(Filter_Data, lines(New_Date,Sub_metering_2, col = "red"))
with(Filter_Data, lines(New_Date,Sub_metering_3, col = "blue"))
# Quadrant 4
with(Filter_Data, plot(New_Date,Global_reactive_power,
                       type = "l", main = "Global Reactive Power x Time",
                       ylab = "Global Reactive Power",
                       xlab = "Time"))