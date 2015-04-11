setwd("~/Documents/Diverse/Coursera Exploratory Data Analysis/Course Project 1/ExData_Plotting1/")
df <- read.csv2(df <-read.csv(file ="../household_power_consumption.txt",sep = ";",dec = "."))
df$Date <- strptime(df$Date,format = "%d/%m/%Y")
startdate <- strptime("1/2/2007",format = "%d/%m/%Y")
enddate <- strptime("2/2/2007",format = "%d/%m/%Y")
df2<-df[df$Date==startdate|df$Date==enddate,]
rm(df)
gc()