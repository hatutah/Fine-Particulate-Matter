# Question: Across the United States, how have emissions from coal combustion-
# related sources changed from 1999–2008?

# Load data
source('load-data.R')

# Load libraries
library(ggplot2)
library(reshape2)

# Subset coal sources
scc.coal <- scc[grepl('coal', scc$SCC.Level.Three, ignore.case=T),]

# Subset emissions data by coal sources
nei.coal <- subset(nei, SCC %in% scc.coal$SCC)

# Split data into two column frame
nei.coal.melt <- melt(nei.coal,id = c('year','type'),
                      measure.vars='Emissions')

# Summarize data by year and type
nei.coal.table <- dcast(nei.coal.melt,year ~ variable, sum)

# Plot with facets
p <- qplot(year,Emissions,
           data=nei.coal.table,
           geom=c('point','smooth'), method='lm',
           main='US Coal Emissions',
           ylab='Tons PM25',
           xlab='Year')

# Print to screen
print(p)

# Save as png
dev.copy(png,'plots/plot4.png',height=504,width=504)

# Release screen
dev.off()

# Answer: Emissions from coal combustion related sources have decreased from
# 1999-2008.
