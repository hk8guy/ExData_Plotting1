## 'plot3.R' constructs the line chart for Sub_metering
## and generates 'plot3.png'

# read the source text file
mydata <- read.csv(file = "household_power_consumption.txt", header = T, sep = ";")

# convert the Date
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

# subset the data for dates
dates <- as.Date(c("2007-02-01", "2007-02-02"))
mydata <- subset(mydata, mydata$Date %in% dates)

# convert the Time
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

# convert the data to numeric
mydata[,3:9] <- as.data.frame(sapply(mydata[,3:9], function(X){as.numeric(as.character(X))}))

# open png device; create 'plot3.png'
png(file = "plot3.png")

# create plot
plot(mydata$Time, mydata$Sub_metering_1, 
     type = 'n',
     xlab = "", 
     ylab = "Energy sub metering")
lines(mydata$Time, mydata$Sub_metering_1, col ="black")
lines(mydata$Time, mydata$Sub_metering_2, col ="red")
lines(mydata$Time, mydata$Sub_metering_3, col ="blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=c(1,1,1))
dev.off()