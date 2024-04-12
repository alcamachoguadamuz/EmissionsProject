
# ==============================================================================
#  Question 01:
# ==============================================================================
# Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# ==============================================================================

# 0. Setup: Load libraries, unzip file, and load data.

library(ggplot2)
library(dplyr)

unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Find the total emissions
total_emissions <- aggregate(Emissions ~ year, NEI, sum)

# 2. Plot the result and save as a png

png(filename="plot1.png", width=480, height=480)

plot(total_emissions$year, total_emissions$Emissions,
     type="l", col="blue",
     main="Total PM2.5 Emissions per Year",
     xlab="Year", ylab="Total PM2.5 Emissions")

dev.off()
