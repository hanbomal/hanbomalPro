setwd("c:/rsave")
data1 <- read.csv("[filename]" , header=F)
data1
data2 <- data1[order(-data1$V2),]
top10<-head(data2, 10)
top10
head <-top10$V1
v1 <- top10$V2
png('[img]', width=450,height=450)
pie(v1, labels = head, col=rainbow(8))
dev.off()

