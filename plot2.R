# ==============================================================================
#  Question 02:
# ==============================================================================
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.

# 0. Setup: Load libraries, unzip file, and load data.

library(ggplot2)
library(dplyr)

unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Find the total emissions in Baltimore

total_baltimore <- aggregate(Emissions ~ year, 
                             subset(NEI, NEI$fips=="24510"), 
                             sum)

# 2. Plot the result and save as a png

png(filename="plot2.png", width=480, height=480)

plot(total_baltimore$year, total_baltimore$Emissions,
     type="l", col="blue",
     main="Total PM2.5 Emissions per Year in Baltimore",
     xlab="Year", ylab="Total PM2.5 Emissions")

dev.off()