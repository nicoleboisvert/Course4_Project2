## load packages
library(ggplot2)

## read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##aggregate and sum emmissions by year
NEIBaltimore <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(NEIBaltimore$Emissions, list(NEIBaltimore$type, NEIBaltimore$year),sum)

##create and export plot as png
g <- ggplot(aggTotalsBaltimore, aes(Group.2, x, color=Group.1))+geom_line()+labs(y="PM2.5 Emissions",x="Year") + ggtitle("Total PM2.5 Emissions by Year and Type for Baltimore City")
ggsave(file="plot3.png")