## load packages
library(ggplot2)

## read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##aggregate and sum emmissions by year for Baltimore City only
NEIBaltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
aggTotalsBaltimore <- aggregate(Emissions ~ year,NEIBaltimore, sum)

##aggregate and sum emmissions by year for LA only
NEILA <- NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",]
aggTotalsLA <- aggregate(Emissions ~ year,NEILA, sum)

##combine the two and assign city name
aggTotalsBaltimore$City <- "Baltimore City, MD"
aggTotalsLA$City <- "Los Angeles County, CA"
NEI_both <- rbind(aggTotalsBaltimore, aggTotalsLA)

##create and save plot as png
g <- ggplot(NEI_both, aes(year, Emissions, color=City))+geom_line()+geom_point(size=2)+labs(y="PM2.5 Emissions",x="Year") + ggtitle("Total PM2.5 Emissions for Motor Vehicle Sources by Year for Baltimore City and LA County")
ggsave(file="plot6.png")