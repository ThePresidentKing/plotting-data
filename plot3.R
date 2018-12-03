#go to current directory and create new folder for downloaded file
getwd()
list.files()
dir.create("Exploratory Data Analysis")
#manually copy downloaded data "exdata%2Fdata%2Fhousehold_power_consumption.zip" into directory
#unzip datafile into new file
setwd("/Users/tonychour/Exploratory Data Analysis/Household power consumption")
#read table
hpc_table<-read.table("household_power_consumption.txt", sep=";", header=T)
#specificy date and table to sort by
hpc_table$DateTime<-paste(hpc_table$Date,hpc$Time)
#convert date adn time to year-month-day format
hpc_table$DateTime<-strptime(hpc_table$DateTime, "%d/%m/%Y %H:%M:%S")
#start of the index
start<-which(hpc_table$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
#end of the index
end<-which(hpc_table$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
hpc_table<-hpc_table[start:end,]
plot(hpc_table$DateTime, as.numeric(as.character(hpc_table$Sub_metering_1)),type='l', ylab="Energy sub metering", xlab="")
lines(hpc_table$DateTime, as.numeric(as.character(hpc_table$Sub_metering_2)),type='l', col='red')
lines(hpc_table$DateTime, hpc_table$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),     lty=c(1,1,1),col=c("black","red","blue"))