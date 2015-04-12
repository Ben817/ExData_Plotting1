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

#do plot
png(file = "plot3.png")
with(df, plot(Time2,Sub_metering_1,ylab="Energy Sub Metering", xlab=" ", type = "n"))
with(df, lines(Time2, Sub_metering_1,))
with(df, lines(Time2, Sub_metering_2, col = "red"))
with(df, lines(Time2, Sub_metering_3, col = "blue"))
legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#dev.copy(png, file = "plot3.png")
dev.off()
