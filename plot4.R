# NOTE: script assumes data file exists in current working directory

alldata <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                      na.strings=c('?'))
data <- subset(alldata, Date == '1/2/2007' | Date == '2/2/2007')
data$datetime <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

png(file='plot4.png', width=480, height=480)

par(mfcol=c(2, 2))
with(data, {
    plot(datetime, Global_active_power,
         type='l',
         xlab='',
         ylab="Global Active Power (kilowatts)")
    plot(datetime, Sub_metering_1,
         type='l',
         xlab='',
         ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col='red')
    lines(datetime, Sub_metering_3, col='blue')
    legend('topright',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col=c('black', 'red', 'blue'),
           lty=c(1, 1, 1),
           bty='n')
    plot(datetime, Voltage,
         type='l')
    plot(datetime, Global_reactive_power,
         type='l')
})

dev.off()