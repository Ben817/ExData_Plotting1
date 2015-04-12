#Set working directory
setwd("~/Documents/Diverse/Coursera Exploratory Data Analysis/Course Project 1/ExData_Plotting1/")

#Read data
df <-read.csv2(file ="../household_power_consumption.txt",sep = ";",dec = ".",header=T,colClasses=c(rep("character",9)))

#Format Date column and fiter out correct dates
df$Date <- strptime(df$Date,format = "%d/%m/%Y")
df$Time <- strptime(df$Time,format = "%H:%M:%S")
startdate <- strptime("1/2/2007",format = "%d/%m/%Y")
enddate <- strptime("2/2/2007",format = "%d/%m/%Y")
df<-df[df$Date==startdate|df$Date==enddate,]

#Collect garbage
gc()

#Change from character to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)

# Do plot
with(df,plot(Global_active_power,type="line"))
line()
title(main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

