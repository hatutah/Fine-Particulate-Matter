# Question: Of the four types of sources indicated by the type (point,
# nonpoint, onroad, nonroad) variable, which of these four sources have seen
# decreases in emissions from 1999–2008 for Baltimore City? Which have seen
# increases in emissions from 1999–2008? Use the ggplot2 plotting system to
# make a plot answer this question.

# Load data
source('load-data.R')

# Load libraries
library(ggplot2)
library(reshape2)

# Subset baltimore data
nei.baltimore <- nei[nei$fips==24510,]

# Split data into two column frame
nei.baltimore.melt <- melt(nei.baltimore,id = c('year','type'),
                       measure.vars='Emissions')

# Summarize data by year and type
nei.baltimore.table <- dcast(nei.baltimore.melt,year + type ~ variable, sum)

# Plot with facets
p <- qplot(year,Emissions,
      facets=.~type,
      data=nei.baltimore.table,
      geom=c('point','smooth'), method='lm',
      main='PM25 Emissions - Baltimore',
      xlab='year', color=type)

# Print to screen
print(p)

# Save as png
dev.copy(png,'plots/plot3.png',height=504,width=504)

# Release screen
dev.off()

# Answer: Nonpoint, On-Road, Non-Road have all seen decreases in emissions from
# 1999 to 2008.

