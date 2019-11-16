# loading the dataset takes a while

dataset <- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)

# Extract the days we care about
validDates <- c("1/2/2007","2/2/2007")
dataset <- dataset[dataset$Date %in% validDates,]

# Turn the data into numerics
dataset[,3:9] <- sapply(dataset[,3:9], as.numeric)

# Merge date and time into field $timestamp
# I know this isn't how the instructions suggested, but maybe you learned something
dataset$timestamp <- as.POSIXct(paste(dataset$Date,dataset$Time),format = "%d/%m/%Y %H:%M:%S")

#draw the picture
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

#plot 1   Global Active Power
plot(dataset$Global_active_power ~ dataset$timestamp,
     xlab = "",
     ylab = "Global Active Power", 
     type="l"
     )


#plot 2 Voltage
plot(dataset$Voltage ~ dataset$timestamp,
     type = "l",
     xlab = "datetime",
     ylab = "Volatage",
     main="")

#plot 3 Sub metering

plot(dataset$Sub_metering_1 ~ dataset$timestamp, 
     type = "l",
     xlab="", 
     ylab = "Energy sub meetering",
     col="black"
     )
   
lines(dataset$Sub_metering_2 ~ dataset$timestamp , col="red")
lines(dataset$Sub_metering_3 ~ dataset$timestamp , col="blue")

legend("topright",
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       fill = c("black","red","blue"),
       pch="-",
       bty="n",
       xpd=TRUE
)

#plot4  Reactive power
plot(dataset$Global_reactive_power, 
     ylab = "Global_rective_power",
     xlab = "datetime",
     type = "l",
     main=""
     )
dev.off()