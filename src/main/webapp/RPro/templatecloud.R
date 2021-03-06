library('wordcloud')
library('RColorBrewer')
conventions <- read.csv('[filename]', header = FALSE,sep = ',', encoding='UTF-8')
png('[img]', width=450,height=450)
wordcloud(conventions[,1], conventions[,2],scale = c(10,1), min.freq=1, max.words=Inf, colors = brewer.pal(8,'Dark2'), rot.per = 0.25)
dev.off()