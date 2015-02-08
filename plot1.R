# NOTE: script assumes data file exists in current working directory

alldata <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                      na.strings=c('?'))
data <- subset(alldata, Date == '1/2/2007' | Date == '2/2/2007')

png(file='plot1.png', width=480, height=480)

plot(hist(data$Global_active_power),
     col='red',
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()