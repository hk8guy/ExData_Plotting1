## 'plot2.R' constructs the line chart for Global Active Power
## and generates 'plot2.png'

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

# open png device; create 'plot2.png'
png(file = "plot2.png")

# create plot
plot(mydata$Time, mydata$Global_active_power, 
     type = 'l',
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()