econ_analysis <- function(){
      # Load the function that reads in the data. The script must be in working directory.
      source('./process_data.R')
      
      # Install ggplot2 package if necessary
      if(!require(ggplot2)){
            install.packages("ggplot2")
      }
      
      # Install gridExtra package if necessary
      if(!require(gridExtra)){
            install.packages("gridExtra")
      }
      
      # Load ggplot2 and gridExtra packages into R
      library(ggplot2)
      library(gridExtra)
      
      # Read in the processed data
      data <- process_data()
      
      # Group the data by Event_Type
      grouped <- group_by(data, Event_Type)
      
      # Create a new data frame containing the average of the sum of the crop and property damage for each event type and
      # the total combined crop and property damage for each event
      damage <- summarize(grouped, AvgDamage = mean(CropDamage + PropDamage), totalDamage = sum(CropDamage+PropDamage))
      
      # Create a new data frame by extracting the top 5 event types that cause the most average damage
      topFiveAvgDmg <- arrange(damage, desc(AvgDamage))[1:5,]
      
      # Create a bar plot of the average damage caused by the extracted 5 event types
      plot1 <- ggplot(topFiveAvgDmg, aes(Event_Type, AvgDamage)) + geom_bar(stat = "identity") +
            xlab("Event Type") + ylab("Average Damage") + 
            ggtitle("Average Crop and Property Damage by Weather Events") + 
            theme(plot.title = element_text(hjust = 0.5))
      
      # Create a new data frame by extracting the top 5 event types that cause the most total damage
      topFiveDmg <- arrange(damage, desc(totalDamage))[1:5,]
      
      # Create a bar plot of the total damage caused by the extracted 5 event types
      plot2 <- ggplot(topFiveDmg, aes(Event_Type, totalDamage)) + geom_bar(stat = "identity") +
            xlab("Event Type") + ylab("Total Damage") + 
            ggtitle("Total Crop and Property Damage by Weather Events") + 
            theme(plot.title = element_text(hjust = 0.5))
      
      grid.arrange(plot1, plot2, nrow=2)
      
}