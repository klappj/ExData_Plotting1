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
png(file="plot1.png",width=480,height=480)

plot(dataset$Global_active_power ~ dataset$timestamp, 
     type = "l",
     xlab="", 
     ylab = "Global Active Power (kilowatts)")


dev.off()