
# ==============================================================================
#  Question 06:
# ==============================================================================
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?


# 0. Setup: Load libraries, unzip file, and load data.

library(ggplot2)
library(dplyr)

unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Find LA and Baltimore motor vehicle emissions

total_baltimore_la_motor <- aggregate(Emissions ~ year + fips,
                                      subset(NEI, 
                                             NEI$fips %in% c("24510", "06037") 
                                             & NEI$type=="ON-ROAD"),
                                      sum)

# 2. Plot the result and save as a png

png(filename="plot6.png", width=480, height=480)

ggplot(total_baltimore_la_motor, aes(x=year, y=Emissions, col=fips)) + 
  geom_line() +
  ggtitle("Total PM2.5 Motor Vehicle Emissions per Year in Baltimore and LA") +
  xlab("Year") +
  ylab("Total PM2.5 Motor Vehicle Emissions") +
  guides(color=guide_legend("US City"))

dev.off()
