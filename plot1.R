# plot1.R

# clear workspace
rm(list = ls())
# read in data file to a dataframe.
datfl <- "household_power_consumption.txt"
hpc <- read.table(datfl, header = FALSE, sep = ";", na.strings = "?", 
                  skip = 66637, 
                  nrows = 2880)
# assign variable names from header
names(hpc) <- names(read.table(datfl, header = TRUE, sep = ";", nrows = 1))
# convert Date and Time values to xlt values for plotting.
datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
# set par background to 'white' or 'transparent'.
par(bg = "white")

# plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, breaks = seq(0, 7.5, by = 0.5), col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()


