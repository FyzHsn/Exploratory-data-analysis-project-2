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

## Extract emissions data for Baltimore city motor vehicles
motscc <- grep("[Vv]ehicle", scc$short.name) # scc row values for motor vehicle sources
motsccid <- scc$scc[motscc] # corresponding scc id's of motor vehicle related rows
neimotrows <- which((nei$scc %in% motsccid) & (nei$fips == "24510")) # rows of nei data that represent motor vehicle data in Baltimore city
bcmotdata <- nei[neimotrows, ] # Emissions data from Baltimore City, Maryland for motor vehicles only
row.names(bcmotdata) <- NULL

## Sum emissions for each year and then plot it
library(reshape2)
bcmotdata_melt <- melt(usmotdata[, c(3, 5)], id.vars = c("year"))
head(bcmotdata_melt)
motpollutiontrend <- dcast(bcmotdata_melt, year ~ variable, fun.aggregate = sum)
library(ggplot2)

png("C:\\Users\\Windows\\Documents\\JHU_Data_Science\\Course_4\\Exploratory-data-analysis-project-2\\plot5.png")
ggplot(motpollutiontrend, aes(year)) + geom_bar(aes(weight = emissions)) + ylab("motor vehicle emissions in Baltimore city")
dev.off()
