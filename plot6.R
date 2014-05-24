# Question: Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County, California
# (fips == "06037"). Which city has seen greater changes over time in motor
# vehicle emissions?

# Load data
source('load-data.R')

# Load libraries
library(ggplot2)
library(reshape2)

sumByFipAndType <- function(fip,type) {
     
     # Subset data by fip
     nei.byFip <- nei[nei$fips==fip,]
     
     # Subset by type
     scc.type <- scc[grepl(type, scc$SCC.Level.Two, ignore.case=T),]
     
     # Subset by both fip and type
     nei.filt <- subset(nei.byFip, SCC %in% scc.type$SCC)
     
     # Split data into two column frame
     nei.filt.melt <- melt(nei.filt,id = c('year','type'),
                           measure.vars='Emissions')
     
     # Summarize data by year and type
     nei.filt.table <- dcast(nei.filt.melt,year ~ variable, sum)
     
}


# Subset data
nei.baltimore <- sumByFipAndType('24510','vehicle')
nei.losangeles <- sumByFipAndType('06037','vehicle')

# Label cities
nei.baltimore$City <- 'Baltimore'
nei.losangeles$City <- 'Los Angeles'

# Combine tables
nei.both <- rbind(nei.baltimore,nei.losangeles)

# Plot with facets
p <- qplot(year,Emissions,
           data=nei.both,
           facets=.~City,
           geom=c('point','smooth'), method='lm',
           main='Vehicle Emissions',
           ylab='Tons PM25',
           xlab='Year')

# Print to screen
print(p)

# Save as png
dev.copy(png,'plots/plot6.png',height=504,width=504)

# Release screen
dev.off()

# Answer: Los Angeles saw more variance in motor vehicle emissions over time.

