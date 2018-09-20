discreteDATA <- read.csv('Colby_discrete_data_2016.csv')

library("plotly")

surface <- discreteDATA[discreteDATA$Depth == 2,]

p = plot_ly(x = surface$ID, y = surface$Station, z = surface$NO3.2, type = "contour")

layout(p, xaxis = list(title = 'Cruise number'), yaxis = list(title = 'Station Number'),
       title = "NO3.2 (uM)")


CTDdata <- read.csv('Colby_cruise_data_2012-2017.csv')

dates <- unique(CTDdata[['Date']])

index <- CTDdata$Date == dates[17]

cruiseData <- CTDdata[index,]

p <- plot_ly(x =cruiseData$Station, y = cruiseData$Depth, z = cruiseData$Temperature,
             type = "contour", contours = list(showlines = FALSE))

layout(p, yaxis = list(autorange = "reversed", title = "Depth (m)"),
       xaxis = list(title = 'Station number'),title = "Temperature (deg C)")

stationLat <- c(43+54.130/60, 43+51.8/60, 43 + 48.56/60, 43+44.87/60)

TEM <- matrix(NA, ncol = 4, nrow=100)
for (st in 1:4){
  for (j in 1:100){
    stationData <- cruiseData[cruiseData$Station == st,]
    
    temp = mean(stationData[ceiling(stationData$Depth) == j,'Temperature'])
    
    
    TEM[j,st] <- temp
  }
}

image.plot(x = stationLat[4:1], y = -100:-1, t(TEM[100:1,4:1]),
           zlim = c(8,20),
           col = tim.colors(60),
           xlab = 'Latitude (deg N)',
           ylab = 'Depth (m)',
           main = 'Cruise 20160908',
           legend.lab = 'Temperature (deg C)',
           legend.line = 2.5)


col2matrix <- function(cruiseData,columnName){
  TEM <- matrix(NA, ncol = 4, nrow=100)
  for (st in 1:4){
    for (j in 1:100){
      stationData <- cruiseData[cruiseData$Station == st,]
      
      temp = mean(stationData[ceiling(stationData$Depth) == j,columnName])
      
      
      TEM[j,st] <- temp
    }
  }
  return(TEM)
}

fl <- col2matrix(cruiseData,'Fluorescence')

image.plot(x = stationLat[4:1], y = -100:-1, t(fl[100:1,4:1]),
           zlim = c(0,11),
           col = tim.colors(60),
           xlab = 'Latitude (deg N)',
           ylab = 'Depth (m)',
           main = 'Cruise 20160908',
           legend.lab = 'Fluorescence (mg/m3)',
           legend.line = 2.5)













