process_data <- function(){
      # Load in the function that adds a new, condensed event type variable to the data and extracts relevant observations
      source("./reformat_events.R")
      
      # Load in the extracted data
      data <- reformat_events()
      
      # Add a new variable, PropExp, which represents the coefficient for the variable PROPDMG, indicated by
      # the factor variable, PROPDMGEXP.
      PropExp = c(1000, 1000000, 0, 1000000000, 1000000, 1, 10, 10, 10, 0, 10, 10, 10, 100, 10, 100, 0, 10, 10)
      propmatch <- data.frame(PROPDMGEXP = unique(data$PROPDMGEXP), PropExp = PropExp)
      data <- merge(data, propmatch)
      
      # Add a new variable, CropExp, which represents the coefficient for the variable, CROPDMG, indicated by
      # the factor variable, CROPDMGEXP
      CropExp <- c(0, 1000, 1000000, 10, 1000000000, 0, 10, 1000, 1000000)
      cropmatch <- data.frame(CROPDMGEXP = unique(data$CROPDMGEXP), CropExp = CropExp)
      data <- merge(data, cropmatch)
      
      data <- mutate(data, CropDamage = CROPDMG*CropExp, PropDamage = PROPDMG*PropExp)
}