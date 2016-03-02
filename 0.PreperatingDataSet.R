#0.1 loading library
library(lattice)
library(ggplot2)
library(dplyr)

#0.2 setting working directory
setwd("C:/Users/GilbertHan/Documents/6.Study/6.3 Data Science/Coursera_DataScience/4.Exploratory Data Analysis/week 1/assignment")

#0.3 reading data between 2007-02-01 and 2007-02-02 and setting the character that represents a missing value
PowerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#0.4 Converting string to date of the variable Date for subsetting
PowerConsumption$Date <- strptime(PowerConsumption$Date, "%d/%m/%Y")

#0.5 subsetting the data for specific Date and adding new variable Datetime
PC2<- subset(PowerConsumption, Date %in% c("2007-02-01", "2007-02-02")|(Date == "2007-02-03" & Time == "00:00:00") )
PC2<- mutate(PC2, Datetime = as.POSIXct(paste(PC2$Date, PC2$Time)))

#0.6 reset rownames
rownames(PC2) <- NULL

save(PC2, file = "PowerConsumption.RData")


