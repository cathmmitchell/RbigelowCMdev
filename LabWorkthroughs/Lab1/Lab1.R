# importing data from csv
DATA <- read.csv('Lab01example.csv')

summary(DATA)

# plotting both upcast and downcast
plot(DATA[,2],-DATA[,1])
plot(DATA[['Temp..deg.C.']],-DATA[['Depth..M.']])

# plotting single profile
par(bg = 'grey')
plot(DATA[1:322,'Temp..deg.C.'],-DATA[1:322,'Depth..M.'],
     xlab = 'Temperature (deg C)', ylab = 'Depth (m)',
     xlim = c(10,11.5), ylim = c(-100,0), family = 'serif')

dev.copy(png,'tempProfile.png')
dev.off()