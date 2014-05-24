if ( !exists('nei') && !exists('scc') ) {
     nei <- readRDS(file="data/summarySCC_PM25.rds")
     scc <- readRDS(file="data/Source_Classification_Code.rds")
}