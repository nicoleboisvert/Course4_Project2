## load packages
library(ggplot2)

## read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC_Working <- subset(SCC, select = c("SCC", "Short.Name"), drop=FALSE)
NEI_SCC <- merge(NEI, SCC_Working, by.x="SCC", by.y="SCC", all=TRUE)

##aggregate and sum emmissions by year
SCC_Coal <- subset(NEI_SCC, grepl('Coal', NEI_SCC$Short.Name, fixed=TRUE), c("Emissions", "year", "type","Short.Name"))
aggTotals <- aggregate(Emissions ~ year,SCC_Coal, sum)

##create and export plot as png
g <- ggplot(aggTotals, aes(year, Emissions))+geom_point(size=2)+geom_line()+labs(y="PM2.5 Emissions",x="Year") + ggtitle("Total PM2.5 Emissions from Coal Combustion-Related Sources for the US")
ggsave(file="plot4.png")