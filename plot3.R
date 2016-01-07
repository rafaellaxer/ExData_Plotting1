## First of all you need to load the file
## For that, you must've downloaded and unzipped the files into the working directory
## The data can be downloaded at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
## Create a new variable to store the date in Date format
data$DateNew <- as.Date(data$Date,format="%d/%m/%Y")
## Subset the data so that you only get 2007 February 1st and 2nd (according to instructions)
data <- subset(data,data$DateNew <= as.Date("2007-02-02") & data$DateNew >= as.Date("2007-02-01"))
## Create a new variable in POSIXlt format with both Date and Time
data$DateTime <- strptime(paste(data$DateNew,data$Time),format="%Y-%m-%d %H:%M:%S")
## Open the png file with height 480 and width 480
png(file="plot3.png",height=480,width=480)
## This is here just because my language is Portuguese and the axis in the Graphic must be in English
Sys.setlocale("LC_TIME", "English")
## Plot the Sub_metering_1 line without a x label
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
## Plot sub metering 2 and 3 with respective colors
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
## Add legend on the top right corner
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),lwd=c(2.5,2.5))
## Close png file
dev.off()