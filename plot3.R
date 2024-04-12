# ==============================================================================
#  Question 03:
# ==============================================================================
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? Which have seen increases in 
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
# answer this question.


# 0. Setup: Load libraries, unzip file, and load data.

library(ggplot2)
library(dplyr)

unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Find the total emissions in Baltimore for each type

total_baltimore <- aggregate(Emissions ~ year + type, 
                             subset(NEI, NEI$fips=="24510"), 
                             sum)

# 2. Plot the result and save as a png

png(filename="plot3.png", width=480, height=480)

ggplot(total_baltimore, aes(x=year, y=Emissions, col=type)) + 
  geom_line() +
  ggtitle("Total PM2.5 Emissions per Year in Baltimore by Type") +
  xlab("Year") +
  ylab("Total PM2.5 Emissions") +
  guides(color=guide_legend("Type of Emission Source"))

dev.off()