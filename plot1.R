#go to current directory and create new folder for downloaded file
getwd()
list.files()
dir.create("Exploratory Data Analysis")
#manually copy downloaded data "exdata%2Fdata%2Fhousehold_power_consumption.zip" into directory
#unzip datafile into new file
unzip(exdata%2Fdata%2Fhousehold_power_consumption.zip, exdir="Household power consumption")
setwd("/Users/tonychour/Exploratory Data Analysis/Household power consumption")
#read table
hpc_table<-read.table("household_power_consumption.txt", sep=";" header=T)
#specificy date and table to sort by
hpc_table$DateTime<-paste(hpc_table$Date,hpc$Time)
#convert date adn time to year-month-day format
hpc_table$DateTime<-strptime(hpc_table$DateTime, "%d/%m/%Y %H:%M:%S")
#start of the index
start<-which(hpc_table$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
#end of the index
end<-which(hpc_table$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
hpc_table<-hpc_table[start:end,]
hist(as.numeric(as.character(hpc_table$Global_active_power)), main="Global Active Power",
                xlab="Global Active Power (kilowatts)", col="red")
                
