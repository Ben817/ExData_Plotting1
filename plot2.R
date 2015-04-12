#Set working directory
setwd("~/Documents/Diverse/Coursera Exploratory Data Analysis/Course Project 1/ExData_Plotting1/")

#Read data
df <-read.csv2(file ="../household_power_consumption.txt",sep = ";",dec = ".",header=T,colClasses=c(rep("character",9)))

#Format Date column and fiter out correct dates
startdate <- as.Date("1/2/2007",format = "%d/%m/%Y")
enddate <- as.Date("2/2/2007",format = "%d/%m/%Y")
df$Time2 <-as.Date(df$Date,format = "%d/%m/%Y") 
df<-df[df$Time2==startdate|df$Time2==enddate,]

df$Time2 <-strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %H:%M:%S ") 


#Collect garbage
gc()

#Change from character to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)

# Do plot
png(file = "plot2.png")
with(df,plot(Time2,Global_active_power,type="line",ylab="Global Active Power (kilowatts)",xlab=" "))
title(main = "Global Active Power")
dev.off()

