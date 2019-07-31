read_data <- function(){
      # Download data to working directory if necessary
      if(!file.exists("StormData.csv.bz2")){
            # Download zip file
            url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
            download.file(url, destfile = "StormData.csv.bz2")
      }
      
      data <- read.csv("StormData.csv.bz2")
      data
}