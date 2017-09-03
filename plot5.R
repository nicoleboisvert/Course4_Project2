## load packages
library(ggplot2)

## read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##aggregate and sum emmissions by year for Baltimore City only
NEIBaltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", c("Emissions", "year", "type")]
aggTotalsBaltimore <- aggregate(Emissions ~ year,NEIBaltimore, sum)

##create and export plot as png
g <- ggplot(aggTotalsBaltimore, aes(year, Emissions))+geom_line()+geom_point(size=2)+labs(y="PM2.5 Emissions",x="Year") + ggtitle("Total PM2.5 Emissions for Motor Vehicle Sources by Year for Baltimore City")
ggsave(file="plot5.png")