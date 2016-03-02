##plot2

#0. Loading data : You can choose one as bellow(#0.1 or #0.2)

#0.1 from RData
load("PowerConsumption.RData")

#0.2 from initial txt file
    #reading data between 2007-02-01 and 2007-02-02 and setting the character that represents a missing value
    PowerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
    
    #Converting string to date of the variable Date for subsetting
    PowerConsumption$Date <- strptime(PowerConsumption$Date, "%d/%m/%Y")
    
    #subsetting the data for specific Date and adding new variable Datetime
    PC2<- subset(PowerConsumption, Date %in% c("2007-02-01", "2007-02-02")|(Date == "2007-02-03" & Time == "00:00:00") )
    PC2<- mutate(PC2, Datetime = as.POSIXct(paste(PC2$Date, PC2$Time)))
    
    #reset rownames
    rownames(PC2) <- NULL

#1. Open PNG device; create png file in my working directory
png("plot2.png", width = 480, height = 480)

#2. Creating plot(histogram)
plot(Global_active_power~Datetime, data=PC2, type="l", col = "black",xaxt = "n", ylab = "Global Active Power(kilowatts)", xlab = "")

#3. changing x-axis label
v1 <- c("2007-02-01 00:00:00","2007-02-02 00:00:00", "2007-02-03 00:00:00")
v2 <- c("Thu","Fri", "Sat")
axis(side = 1, at= as.POSIXct(v1), labels = v2)

#4. Closing the PNG file device
dev.off()
