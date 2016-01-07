## First of all you need to load the file
## For that, you must've downloaded and unzipped the files into the working directory
## The data can be downloaded at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
## Create a new variable to store the date in Date format
data$DateNew <- as.Date(data$Date,format="%d/%m/%Y")
## Subset the data so that you only get 2007 February 1st and 2nd (according to instructions)
data <- subset(data,data$DateNew <= as.Date("2007-02-02") & data$DateNew >= as.Date("2007-02-01"))
## Open the png file with height 480 and width 480
png(file="plot1.png",height=480,width=480)
## Create the histogram in the png file
hist(as.numeric(data$Global_active_power),xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
## Close png file
dev.off()