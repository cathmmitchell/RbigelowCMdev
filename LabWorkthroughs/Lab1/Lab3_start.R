DATA <- read.csv('C:/Users/Catherine/Documents/REUColbyCoding/CMdev/RbigelowCMdev/Lab02_2018/Colby_cruise_data_2012-2017.csv', header = TRUE)

dates <- unique(DATA[['Date']])

cruiseList <- list()

for (dd in dates){
  cruiseData <- DATA[DATA[['Date']] == dd,]
  ddchar <- as.character(dd)
  id <- paste("colby",dd,sep="")
  cruiseList[[id]] <- cruiseData
}