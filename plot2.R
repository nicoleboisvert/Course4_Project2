## read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##aggregate and sum emmissions by year for Baltimore City only
NEIBaltimore <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions ~ year,NEIBaltimore, sum)

##create and export plot as png
png(filename = "./plot2.png")
barplot(aggTotalsBaltimore$Emissions, names=aggTotalsBaltimore$year, main="Total PM2.5 Emissions by Year for Baltimore", xlab="Year", ylab="PM2.5 Emissions")
dev.off()