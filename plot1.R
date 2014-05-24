# Question: Have total emissions from PM2.5 decreased in the United States from
# 1999 to 2008? Using the base plotting system, make a plot showing the total
# PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and
# 2008.

# Load data
source('load-data.R')

# Sum emissions by year
nei.table <- tapply(nei$Emissions,nei$year,sum)

# Plot histogram
barplot(nei.table,main='US PM25 Emissions',ylab='Tons',xlab='Year')

# Save png
dev.copy(png,'plots/plot1.png',height=500,width=500)

# Release screen
dev.off()

# Answer: Emissions decreased in the United States between 1999 and 2008.