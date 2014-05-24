# Question: Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system
# to make a plot answering this question.

# Load data
source('load-data.R')

# Subset baltimore data
nei.baltimore <- nei[nei$fips==24510,]

# Sum emissions by year
nei.baltimore.table <- tapply(nei.baltimore$Emissions,
                              nei.baltimore$year,sum)

# Plot histogram
barplot(nei.baltimore.table,
        main='Baltimore PM25 Emissions',
        ylab='Tons',xlab='Year')

# Save png
dev.copy(png,'plots/plot2.png',height=504,width=504)

# Release screen
dev.off()

# Answer: Emissions decreased in Baltimore City between 1999 and 2008.