## Download data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
destfile <- "C:\\Users\\Windows\\Documents\\JHU_Data_Science\\Course_4\\Exploratory-data-analysis-project-2\\data.zip"
download.file(url, destfile)

## Read in data
nei <- readRDS("~/JHU_Data_Science/Course_4/Exploratory-data-analysis-project-2/data/summarySCC_PM25.rds")
scc <- readRDS("~/JHU_Data_Science/Course_4/Exploratory-data-analysis-project-2/data/Source_Classification_Code.rds")
library(dplyr)
nei <- select(nei, -Pollutant)

## Change names to lowercase
names(nei) <- tolower(names(nei))
names(scc) <- tolower(names(scc))

motscc <- grep("[Vv]ehicle", scc$short.name)
motsccid <- scc$scc[motscc]
neimotrows <- which((nei$scc %in% motsccid) & (nei$fips %in% c("06037", "24510")))
BCLAmotdata <- nei[neimotrows, ] # Baltimore city and Los Angeles County motor vehicle data
row.names(BCLAmotdata) <- NULL
BCLAmotdata_melt <- melt(BCLAmotdata[, c(1, 3, 5)], id.vars = c("year", "fips"))
motpollutiontrend <- dcast(BCLAmotdata_melt, year + fips ~ variable, fun.aggregate = sum)

png("C:\\Users\\Windows\\Documents\\JHU_Data_Science\\Course_4\\Exploratory-data-analysis-project-2\\plot6.png")
ggplot(motpollutiontrend, aes(year, emissions)) + geom_line() + facet_grid(. ~ fips) + ylab("Baltimore City & LA county vehicle emissions")
dev.off()

