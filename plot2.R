#PLOT 2 
#Download file if does not exist and unzip 
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#Read data of interest, from 1/2/2007 to 2/2/2007 and rename variables
dataPC <- "./data/household_power_consumption.txt"
HPC <- read.table(dataPC, header = TRUE, skip = grep("1/2/2007", readLines(dataPC)), nrows = 2878, sep = ";")
names(HPC) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Transforming the date and time variables from characters into objects of type Date and POSIXlt, respectively
HPC$Date <- as.Date(HPC$Date, format="%d/%m/%Y")
HPC$Time <- strptime(HPC$Time, format="%H:%M:%S")
HPC[1:1438,"Time"] <- format(HPC[1:1438,"Time"],"2007-02-01 %H:%M:%S")
HPC[1439:2878,"Time"] <- format(HPC[1439:2878,"Time"],"2007-02-02 %H:%M:%S")
#Creating plot and saving to device PNG 
png("plot2.png", width = 480, height = 480)
plot(HPC$Time,as.numeric(as.character(HPC$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()