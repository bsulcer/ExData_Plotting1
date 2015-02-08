# NOTE: script assumes data file exists in current working directory

alldata <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                      na.strings=c('?'))
data <- subset(alldata, Date == '1/2/2007' | Date == '2/2/2007')
data$datetime <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

png(file='plot3.png', width=480, height=480)

with(data, {
    plot(datetime, Sub_metering_1,
                type='l',
                xlab='',
                ylab="Energy sub metering",
                col='black')
    lines(datetime, Sub_metering_2, col='red')
    lines(datetime, Sub_metering_3, col='blue')
    legend('topright',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col=c('black', 'red', 'blue'),
           lty=c(1, 1, 1))
})
    
dev.off()