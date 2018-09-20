col2matrix <- function(cruiseData,columnName){
  
  #creating an empty matrix with 100 rows (i.e. for 100 depths) and 4 columns (i.e. one for each station)
  TEM <- matrix(NA,nrow = 100, ncol = 4)
  
  #looping through each station
  for (st in 1:4){
    #looping through each depth interval (from 1m to 100m)
    for (j in 1:100){
      #extracting the relevant station from the cruiseData data frame
      stationData <- cruiseData[cruiseData$Station == st,]
      
      #binned temperature value for given depth interval
      temp = mean(stationData[ceiling(stationData$Depth)==j,columnName]) 
      
      #assinging the binned temperature to the j-th row and st-th column of the TEM matrix
      TEM[j,st] <- temp
    }
  }
  return(TEM)
}