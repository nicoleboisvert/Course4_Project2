## read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##aggregate and sum emmissions by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

##create and export plot as png
png(filename = "./plot1.png")
barplot(aggTotals$Emissions, names=aggTotals$year, main="Total PM2.5 Emissions by Year", xlab="Year", ylab="PM2.5 Emissions")
dev.off()