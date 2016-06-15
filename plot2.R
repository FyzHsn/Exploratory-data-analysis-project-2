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

## Subset to Baltimore City, Maryland data
library(dplyr)
bcmdata <- filter(nei, nei$fips == "24510") # [b]altimore [c]ity, [m]aryland data
library(reshape2)
bcmpollution <- aggregate(bcmdata$emissions, list(year = bcmdata$year), sum)
png("C:\\Users\\Windows\\Documents\\JHU_Data_Science\\Course_4\\Exploratory-data-analysis-project-2\\plot2.png")
plot(bcmpollution$year, bcmpollution$x, type = "l", xlab = "year", ylab = "emissions (in tons)")
dev.off()