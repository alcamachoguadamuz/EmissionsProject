
# ==============================================================================
#  Question 05:
# ==============================================================================
# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

# 0. Setup: Load libraries, unzip file, and load data.

library(ggplot2)
library(dplyr)

unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Find Baltimore motor vehicle emissions

total_blatimore_motor <- aggregate(Emissions ~ year,
                                   subset(NEI, NEI$fips=="24510" & NEI$type=="ON-ROAD"),
                                   sum)

# 2. Plot the result and save as a png

png(filename="plot5.png", width=480, height=480)

ggplot(total_blatimore_motor, aes(x=year, y=Emissions)) + 
  geom_line() +
  ggtitle("Total PM2.5 Motor Vehicle Emissions per Year in Baltimore") +
  xlab("Year") +
  ylab("Total PM2.5 Motor Vehicle Emissions")

dev.off()