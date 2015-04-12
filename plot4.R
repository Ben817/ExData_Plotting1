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
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)




#do plot
png(file = "plot4.png")
par(mfrow = c(2, 2))

with(df,plot(Time2,Global_active_power,type="line",ylab="Global Active Power (kilowatts)",xlab=" "))

with(df,plot(Time2,Voltage,type="line",ylab="Voltage",xlab="datetime"))

with(df, plot(Time2,Sub_metering_1,ylab="Energy Sub Metering", xlab=" ", type = "n"))
with(df, lines(Time2, Sub_metering_1,))
with(df, lines(Time2, Sub_metering_2, col = "red"))
with(df, lines(Time2, Sub_metering_3, col = "blue"))
legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


with(df,plot(Time2,Global_reactive_power,type="line",ylab="Global Reactive Power",xlab="datetime"))

dev.off()




