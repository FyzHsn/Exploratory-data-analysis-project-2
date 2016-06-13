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
