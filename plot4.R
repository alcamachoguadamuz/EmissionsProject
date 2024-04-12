# ==============================================================================
#  Question 04:
# ==============================================================================
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?


# 0. Setup: Load libraries, unzip file, and load data.

library(ggplot2)
library(dplyr)

unzip("exdata_data_NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 1. Find the total coal emissions in the US from 1999-2008

SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC,]

total_us_coal <- aggregate(Emissions ~ year, NEI_coal, sum)

# 2. Plot the result and save as a png

png(filename="plot4.png", width=480, height=480)

ggplot(total_us_coal, aes(x=year, y=Emissions)) + 
  geom_line() +
  ggtitle("Total PM2.5 Coal Emissions per Year in US") +
  xlab("Year") +
  ylab("Total PM2.5 Coal Emissions")

dev.off()
  