Exploratory-data-analysis-project-2
===================================
This is project 2 of the exploratory data analysis course on Coursera.

Instructions
------------
Fine particulate matter (PM2.5) is an ambient air pollutant that is harmful to human health. The Environmental Protection Agency (EPA) releases data on PM2.5 emissions every 3 years in a database known as the National Emissions Inventory (NEI). More information is available on: https://www.epa.gov/air-emissions-inventories

In this assignment, we use data from the years 1999, 2002, 2005, and 2008.

Data
----
The data is available at: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
The zip file contains two files:
PM2.5 Emissions Data (summarySCC_PM25.rds) - Contains data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008 with the following columns.
* fips - a five digit number (represented as a string) indicating the US county
* SCC - the name of the source as indicated by a digit string
* Pollutant - a string indicating the pollutant
* Emissions - Amount of PM2.5 emitted in tons
* type - the type of source (point, non-point, on-road, or non-road)
* year - the year of the emissions recorded

Source Classification Code Table (Source_Classification_Code.rds) - This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific. Example: "10100101" is "Ext Comb/Electric Gen/Anthracite Coal/Pulverized Coal".

Assignment
----------
The goal is to explore the NEI database and see what it says about fine particulate matter pollution in the United States over the 10-year period 1999-2008. Answer the following questions:
1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing total PM2.5 emission from all sources for each of the years 1999 - 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 - 2008? Use the base plotting system to make a plot answering the question.
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) which of these sources hace seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases? Use ggplot2 plotting system to make a plot answering the question.
4. Across the United States, how have emissions from coal combustion-relates sources changed from 1999-2008?
5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
7. 

Plot names
----------
The plots are named plot1.png, plot2.png etc. 
The code to generate the plots are denoted plot1.R, plot2.R etc.
