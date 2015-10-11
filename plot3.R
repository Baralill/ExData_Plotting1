#################################################################################
#                                                                               #
#  Assignment 1: Exploratory Data Analysis                                      #
#                                                                               #
#  Date : 10/10/2015                                                            #
#                                                                               #
#################################################################################
#                                                                               #
#  Dataset : Electric Power Consumption                                         #
#                                                                               #
#  Source  : UC Irvine Machine Learning Repository                              #
#                                                                               #
#  Website : http://archive.ics.uci.edu/ml/                                     #
#                                                                               #
#################################################################################
#                                                                               #
#  Metrics :                                                                    #
#                                                                               #
#  Rows    : 2,075,259                                                          #
#                                                                               #
#  Columns : 9                                                                  #
#                                                                               #
###############################################################################################################
#                                                                                                             #
# Subset : Dates between 2007-02-01 and 2007-02-02 inclusive                                                  #
#                                                                                                             #
# Column Descriptions :                                                                                       #
#         1. Date:                  Date in format dd/mm/yyyy                                                 #
#         2. Time:                  time in format hh:mm:ss                                                   #  
#         3. Global_active_power:   household global minute-averaged active power (in kilowatt)               #
#         4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)             #
#         5. Voltage:               minute-averaged voltage (in volt)                                         #
#         6. Global_intensity:      household global minute-averaged current intensity (in ampere)            #
#         7. Sub_metering_1:        energy sub-metering No. 1 (in watt-hour of active energy).                #
#                                   It corresponds to the kitchen, containing mainly a dishwasher,            #
#                                   an oven and a microwave (hot plates are not electric but gas powered).    #
#         8. Sub_metering_2:        energy sub-metering No. 2 (in watt-hour of active energy).                #
#                                   It corresponds to the laundry room, containing a washing-machine,         #
#                                   a tumble-drier, a refrigerator and a light.                               #
#         9. Sub_metering_3:        energy sub-metering No. 3 (in watt-hour of active energy).                #
#                                   It corresponds to an electric water-heater and an air-conditioner.        #
#                                                                                                             #
#                                                                                                             #
# Other  : Missing values coded as '?'                                                                        #
#                                                                                                             #
#                                                                                                             #
###############################################################################################################


# Set working directory #

setwd("~./Assignment1")

# import the data #

# read in 1st 5 rows to get the class of each variable #
tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5)
classes <- sapply(tab5rows, class)

# apply these classes to the data
EP_Consump <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = classes, na.strings = '?')

# convert the Date and Time variables to Date/Time classes 
EP_Consump$DateTime <- as.POSIXct(strptime(paste(EP_Consump$Date, EP_Consump$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

# check the 1st 6 rows of the data
head(EP_Consump)

# check the classes for the variables are correct
str(EP_Consump)

# subset the data to the dates requested
plotdata <- subset(EP_Consump, EP_Consump$Date == "1/2/2007" | EP_Consump$Date == "2/2/2007")

########## PLOT3 : Submeter 

png(file="plot3.png", bg="transparent", width = 480, height = 480)

plot(plotdata$DateTime, plotdata$Sub_metering_1, type = "n", ylab = 'Energy sub metering', xlab="")
points(plotdata$DateTime, plotdata$Sub_metering_1, type="l", col='black')
points(plotdata$DateTime, plotdata$Sub_metering_2, type="l", col='red')
points(plotdata$DateTime, plotdata$Sub_metering_3, type="l", col='blue')
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = c(1,1,1))

dev.off()




