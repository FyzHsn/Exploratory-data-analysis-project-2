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

## Plot 3a
library(ggplot2)
library(reshape2)
nei_melt <- melt(nei[, 3:5], id.vars = c("type", "year"))
head(nei_melt)
pollutiontype <- dcast(nei_melt, type + year ~ variable, fun.aggregate = sum)
head(pollutiontype)
ggplot(pollutiontype, aes(year, emissions)) + geom_line(aes(color = type))

## Plot 3b
ggplot(pollutiontype, aes(type)) + geom_bar(aes(weight = emissions)) + facet_grid(. ~ year)
