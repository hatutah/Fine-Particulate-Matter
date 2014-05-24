# Question: How have emissions from motor vehicle sources changed from
# 1999–2008 in Baltimore City?

# Load data
source('load-data.R')

# Load libraries
library(ggplot2)
library(reshape2)

# Subset Baltimore data
nei.baltimore <- nei[nei$fips=='24510',]

# Subset vehicle Sources
scc.vehicles <- scc[grepl('vehicle', scc$SCC.Level.Two, ignore.case=T),]

# Subset emissions data by vehicle sources
nei.baltimore.vehicles <- subset(nei.baltimore, SCC %in% scc.vehicles$SCC)

# Split data into two column frame
nei.baltimore.vehicles.melt <- melt(nei.baltimore.vehicles,id = c('year','type'),
                                    measure.vars='Emissions')

# Summarize data by year and type
nei.baltimore.vehicles.table <- dcast(nei.baltimore.vehicles.melt,year ~ variable, sum)

# Plot with facets
p <- qplot(year,Emissions,
           data=nei.baltimore.vehicles.table,
           geom=c('point','smooth'), method='lm',
           main='Baltimore Vehicle Emissions',
           ylab='Tons PM25',
           xlab='Year')

# Print to screen
print(p)

# Save as png
dev.copy(png,'plots/plot5.png',height=504,width=504)

# Release screen
dev.off()

# Answer: Emissions from motor vehicles  decreased in Baltimore city between
# 1999 and 2008.