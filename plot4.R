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

coalscc <- grep("[Cc]oal", scc$short.name) # scc row values for coal combustion
length(coalscc)
head(coalscc, 100)
coalsccid <- scc$scc[coalscc] # corresponding scc id's of coal combustion related rows
head(factor(coalsccid))
neicoalrows <- which(nei$scc %in% coalsccid) # rows of nei data that represent coal combustion
uscoaldata <- nei[neicoalrows, ]# Emissions data across the entire us for coal combustion only
row.names(uscoaldata) <- NULL
head(uscoaldata)
library(reshape2)
uscoaldata_melt <- melt(uscoaldata[, c(3, 5)], id.vars = c("year"))
head(uscoaldata_melt)
coalpollutiontrend <- dcast(uscoaldata_melt, year ~ variable, fun.aggregate = sum)

## Make the plot in a png file
library(ggplot2)
png("C:\\Users\\Windows\\Documents\\JHU_Data_Science\\Course_4\\Exploratory-data-analysis-project-2\\plot4.png")
ggplot(coalpollutiontrend, aes(year, emissions)) + geom_line(aes(color = year)) + ylab("US emissions from coal")
dev.off()