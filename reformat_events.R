reformat_events <- function(){
      # Install dplyr package if necessary
      if(!require(dplyr)){
            install.packages("dplyr")
      }
      
      # Load dplyr package
      library(dplyr)
      
      # Load the function that reads in the data. The script must be in working directory.
      source('./read_data.R')
      
      # Read in the data
      data <- read_data()
      
      # Add a new variable, Event_Type, which condenses the factor variable EVTYPE
      # into a smaller number of event types (i.e. multiple event types present in EVTYPE represent similar types of events
      # or the same type of event, so we group all such events into a single event for the Event_Type variable)
      data <- mutate(data, Event_Type = as.character(EVTYPE))
      
      
      # Replace similar/same types of events in EVTYPE with a single event for the Event_Type variable
      drought <- grepl("drought|dry|driest|record low rainfall", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[drought] <- "Drought"

      lowtide <- grepl("astronomical low tide", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[lowtide] <- "Astronomical Low Tide"

      avalanche <- grepl("avalanche|avalance", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[avalanche] <- "Avalanche"

      blizzard <- grepl("blizzard", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[blizzard] <- "Blizzard"

      coastal.flood <- grepl("coastal flood", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[coastal.flood] <- "Coastal Flood"

      debris.flow <- grepl("debris flow", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[debris.flow] <- "Debris Flow"

      fog <- grepl("fog", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[fog] <- "Fog"

      dense.smoke <- grepl("dense smoke", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[dense.smoke] <- "Dense Smoke"

      dust.devil <- grepl("dust devil|dustdevil|dust devel", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[dust.devil] <- "Dust Devil"

      dust.storm <- grepl("dust storm|duststorm|blowing dust", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[dust.storm] <- "Dust Storm"

      flash.flood <- grepl("flash flood|flash floood", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[flash.flood] <- "Flash Flood"

      lakeshore.flood <- grepl("lakeshore flood", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[lakeshore.flood] <- "Lakeshore Flood"

      flood <- grepl("flood", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[flood] <- "Flood"

      funnel.cloud <- grepl("funnel cloud", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[funnel.cloud] <- "Funnel Cloud"

      marine.hail <- grepl("marine hail", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[marine.hail] <- "Marine Hail"

      hail <- grepl("hail", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[hail] <- "Hail"

      rain <- grepl("rain", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[rain] <- "Rain"

      heavy.snow <- grepl("heavy snow", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[heavy.snow] <- "Heavy Snow"

      high.surf <- grepl("high surf", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[high.surf] <- "High Surf"

      marine.high.wind <- grepl("marine high wind", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[marine.high.wind] <- "Marine High Wind"

      high.wind <- grepl("high wind", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[high.wind] <- "High Wind"

      hurricane <- grepl("hurricane|typhoon", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[hurricane] <- "Hurricane (Typhoon)"

      ice.storm <- grepl("ice storm", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[ice.storm] <- "Ice Storm"

      lake.effect.snow <- grepl("lake-effect snow|lake effect snow", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[lake.effect.snow] <- "Lake-Effect Snow"

      lightning <- grepl("lightning|lighting", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[lightning] <- "Lightning"

      marine.strong.wind <- grepl("marine strong wind", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[marine.strong.wind] <- "Marine Strong Wind"

      marine.thunderstorm.wind <- grepl("marine thunderstorm wind", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[marine.thunderstorm.wind] <- "Marine Thunderstorm Wind"

      rip.current <- grepl("rip current", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[rip.current] <- "Rip Current"

      seiche <- grepl("seiche", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[seiche] <- "Seiche"

      sleet <- grepl("sleet", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[sleet] <- "Sleet"

      storm.surge.tide <- grepl("storm surge|tide", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[storm.surge.tide] <- "Storm Surge/Tide"

      strong.wind <- grepl("strong wind", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[strong.wind] <- "Strong Wind"

      thunderstorm.wind <- grepl("thunderstorm wind|thundestorm|thunderstorm|thunderstrom|thundeerstorm|thundertsorm|
                                 thunderestorm|tunderstorm",data$Event_Type, ignore.case = TRUE)
      data$Event_Type[thunderstorm.wind] <- "Thunderstorm"

      tornado <- grepl("tornado|torndao", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[tornado] <- "Tornado"

      tropical.depression <- grepl("tropical depression", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[tropical.depression] <- "Tropical Depression"

      tropical.storm <- grepl("tropical storm", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[tropical.storm] <- "Tropical Storm"

      tsunami <- grepl("tsunami", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[tsunami] <- "Tsunami"

      volcanic <- grepl("volcanic", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[volcanic] <- "Volcanic Activity"

      waterspout <- grepl("waterspout|water spout", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[waterspout] <- "Waterspout"

      wildfire <- grepl("wildfire|wild fire|fire", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[wildfire] <- "Wildfire"

      winter.storm <- grepl("winter storm|ice storm", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[winter.storm] <- "Winter Storm"

      winter.weather <- grepl("winter weather|snow|freezing drizzle|freezing rain|wintry mix|ice pellets|winter mix|wintery mix",
                              data$Event_Type, ignore.case = TRUE)
      data$Event_Type[winter.weather] <- "Winter Weather"

      heat <- grepl("heat|record high|warm|hot|high temperature", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[heat] <- "Heat"

      cold.windchill <- grepl("cold|windchill|low temperature|wind chill", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[cold.windchill] <- "Cold/Wind Chill"

      frost.freeze <- grepl("frost|freeze|ice|icy", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[frost.freeze] <- "Frost/Freeze"

      wind <- grepl("wind", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[wind] <- "Wind"

      mudslide.landslide <- grepl("mudslide|mud slide|landslide|land slide|mud/rock slide", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[mudslide.landslide] <- "Mudslide/Landslide"

      wetness <- grepl("wet", data$Event_Type, ignore.case = TRUE)
      data$Event_Type[wetness] <- "Wetness"
      
      
      #Extract and return only the observations that represent events from these new, condensed event types
      events <- c("Drought", "Astronomical Low Tide", "Avalanche", "Blizzard", "Coastal Flood", "Debris Flow", "Fog",
                  "Dense Smoke", "Dust Devil", "Dust Storm", "Flash Flood", "Lakeshore Flood", "Flood", "Funnel Cloud",
                  "Marine Hail", "Hail", "Rain", "Heavy Snow", "High Surf", "Marine High Wind", "High Wind",
                  "Hurricane (Typhoon)", "Ice Storm", "Lake-Effect Snow", "Lightning", "Marine Strong Wind",
                  "Marine Thunderstorm Wind", "Rip Current", "Seiche", "Sleet", "Storm Surge/Tide", "Strong Wind",
                  "Thunderstorm", "Tornado", "Tropical Depression", "Tropical Storm", "Tsunami", "Volcanic Activity",
                  "Waterspout", "Wildfire", "Winter Storm", "Winter Weather", "Heat", "Cold/Wind Chill", "Frost/Freeze",
                  "Wind", "Mudslide/Landslide", "Wetness")
      data2 <- filter(data, Event_Type %in% events)
}