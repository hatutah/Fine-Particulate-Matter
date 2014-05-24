nei.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
nei.file <- 'NEI_data.zip'
nei.dir <- 'National Emissions Inventory'

# Downlaod Helper
curlMe <- function(url, filename) {
     if(!file.exists(filename)) {
          download.file(url, destfile=filename, method="curl")
     }
     filename
}

# Download and Unzip Data
curlMe(nei.url,nei.file)
unzip(nei.file,overwrite=FALSE)