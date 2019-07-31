health_analysis <- function(total = FALSE){
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
      
      # Create a new data frame containing the average number of fatalities and average number of injuries for each
      # event type, as well as the total number of fatalities and injuries for each event type
      damage <- summarize(grouped, AvgFatalities = mean(FATALITIES), AvgInjuries = mean(INJURIES), 
                          totFatalities = sum(FATALITIES), totInjuries = sum(INJURIES))
      
      # Create a new data frame by extracting the top 5 event types that cause the most average fatalities
      topFiveAvgFat <- arrange(damage, desc(AvgFatalities))[1:5,]
      
      # Create a new data frame by extracting the top 5 event types that cause the most average injuries
      topFiveAvgInj <- arrange(damage, desc(AvgInjuries))[1:5,]
      
      # Create a new data frame by extracting the top 5 event types that cause the most total combined injuries and fatalities
      topFiveTot <- arrange(damage, desc(totFatalities + totInjuries))[1:5,]
      
      
      if(!total){
            # Create a bar plot of the average fatalities for the top 5 events that cause the most fatalities on average
            plot1 <- ggplot(topFiveAvgFat, aes(Event_Type, AvgFatalities)) + geom_bar(stat = "identity") +
                  xlab("Event Type") + ylab("Average Fatalities") + 
                  ggtitle("Average Fatalities by Weather Events") + 
                  theme(plot.title = element_text(hjust = 0.5))
            
            # Create a bar plot of the averge injuries for the top 5 events that cause the most injuries on average
            plot2 <- ggplot(topFiveAvgInj, aes(Event_Type, AvgInjuries)) + geom_bar(stat = "identity") +
                  xlab("Event Type") + ylab("Average Injuries") + 
                  ggtitle("Average Injuries by Weather Events") + 
                  theme(plot.title = element_text(hjust = 0.5))
            
            # Print a panel plot comprised of the two plots created above
            grid.arrange(plot1, plot2, nrow = 2)
      }else{
            # Create a data frame that will allow us to create a bar plot of the total combined fatalities and injuries
            # for the top 5 events that cause the most total combined fatalities of injuries, with the bars colored to
            # indicate how many total fatalities and injuries occurred for each event type
            values <- c(topFiveTot$totFatalities, topFiveTot$totInjuries)
            events <- rep(topFiveTot$Event_Type, 2)
            type <- c(rep("Fatalities", 5), rep("Injuries", 5))
            plotData <- data.frame(events, values)
            
            # Create the bar plot
            plot1 <- ggplot(plotData, aes(events, values)) + geom_bar(stat = "identity", aes(fill = type)) +
                  xlab("Event Type") + ylab("Total Fatalities and Injuries") +
                  ggtitle("Total Fatalities and Injuries by Weather Events") +
                  theme(plot.title = element_text(hjust = 0.5))
            
            print(plot1)
      }
}