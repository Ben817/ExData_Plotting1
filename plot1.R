#Set working directory
setwd("~/Documents/Diverse/Coursera Exploratory Data Analysis/Course Project 1/ExData_Plotting1/")

#Read data
df <-read.csv2(file ="../household_power_consumption.txt",sep = ";",dec = ".",header=T,colClasses=c(rep("character",9)))

#Format Date column and fiter out correct dates
df$Date <- strptime(df$Date,format = "%d/%m/%Y")
startdate <- strptime("1/2/2007",format = "%d/%m/%Y")
enddate <- strptime("2/2/2007",format = "%d/%m/%Y")
df<-df[df$Date==startdate|df$Date==enddate,]

#Remove large dataset and collect garbage
gc()

#Change from character to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)

# Create plots
png(file = "plot1.png")
with(df,hist(Global_active_power,col = "red",xlab = c("Global Active Power (kilowatts)"),main = "Global Active Power"))

dev.off()
