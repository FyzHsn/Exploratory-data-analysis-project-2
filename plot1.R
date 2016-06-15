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

library(reshape2)
nei_melt <- melt(nei[, c(3, 5)], id.vars = c("year"))
head(nei_melt)
uspollution <- dcast(nei_melt, year ~ variable, fun.aggregate = sum)
head(uspollution)

## Send png plot to file
png("C:\\Users\\Windows\\Documents\\JHU_Data_Science\\Course_4\\Exploratory-data-analysis-project-2\\plot1.png")
barplot(uspollution$emissions, names.arg = uspollution$year, xlab = "year", ylab = "emissions (tons)")
dev.off()