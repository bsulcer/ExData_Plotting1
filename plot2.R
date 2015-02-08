# NOTE: script assumes data file exists in current working directory

alldata <- read.table('household_power_consumption.txt', header=TRUE, sep=';',
                      na.strings=c('?'))
data <- subset(alldata, Date == '1/2/2007' | Date == '2/2/2007')
data$datetime <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

png(file='plot2.png', width=480, height=480)

with(data, plot(datetime, Global_active_power,
                type='l',
                xlab='',
                ylab="Global Active Power (kilowatts)"))

dev.off()