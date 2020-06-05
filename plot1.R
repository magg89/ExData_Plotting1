#PLOT 1 
#Download file if does not exist and unzip 
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#Read data of interest, from 1/2/2007 to 2/2/2007 and rename variables
dataPC <- "./data/household_power_consumption.txt"
HPC <- read.table(dataPC, header = TRUE, skip = grep("1/2/2007", readLines(dataPC)), nrows = 2878, sep = ";")
names(HPC) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Histogram of Global Active Power & save to device PNG
png("plot1.png", width = 480, height = 480)
hist(HPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()