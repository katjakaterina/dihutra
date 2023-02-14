
#with this command you can start the script from the shell
#source("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/barplots.R")

data.news = read.table("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/upos-news.csv", header =TRUE)
data.news.contentpos<-data.news[c("ADJ","ADV","NOUN","PROPN","VERB"),]
data.news.otherpos<-data.news[c("DET","PRON","CCONJ","SCONJ"),]

data.reviews = read.table("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/upos-reviews.csv", header=TRUE)
data.reviews.contentpos<-data.reviews[c("ADJ","ADV","NOUN","PROPN","VERB"),]
data.reviews.otherpos<-data.reviews[c("DET","PRON","CCONJ","SCONJ"),]

data.reviews.enruhr = data.reviews[,c(1:6)]
data.reviews.contentpos.enruhr<-data.reviews[c("ADJ","ADV","NOUN","PROPN","VERB"),c(1:6)]
data.reviews.otherpos.enruhr<-data.reviews[c("DET","PRON","CCONJ","SCONJ"),c(1:6)]

data.news.turned<-t(data.news)
data.reviews.turned<-t(data.reviews)

pdf("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/barplots-pos-vertical.pdf",width = 63, height = 30, pointsize = 45)
#news
barplot.data.news<-barplot(t(data.news),col = c("forestgreen","antiquewhite2","antiquewhite4","cadetblue","cadetblue4"), legend=colnames(data.news),beside=TRUE,ylab="POS distribution in News")
#text(barplot.data.news,t(data.news),labels=as.character(t(data.news)))

#pdf("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/barplots-contentpos-vertical.pdf",width = 63, height = 30, pointsize = 45)
#content pos in news
barplot.data.news.contentpos<-barplot(t(data.news.contentpos),col = c("forestgreen","antiquewhite2","antiquewhite4","cadetblue","cadetblue4"), legend=colnames(data.news.contentpos),beside=TRUE,ylab="content POS distribution in News")

barplot.data.news.otherpos<-barplot(t(data.news.otherpos),col = c("forestgreen","antiquewhite2","antiquewhite4","cadetblue","cadetblue4"), legend=colnames(data.news.otherpos),beside=TRUE,ylab="other POS distribution in News")


#reviews
barplot.data.reviews<-barplot(t(data.reviews),col = c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4","dodgerblue","dodgerblue3"), legend=colnames(data.reviews),beside=TRUE,ylab="POS distribution in Reviews")
#text(barplot.data.reviews,t(data.reviews),labels=as.character(t(data.reviews)))

barplot.data.reviews.contentpos<-barplot(t(data.reviews.contentpos),col = c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4","dodgerblue","dodgerblue3"), legend=colnames(data.reviews.contentpos),beside=TRUE,ylab="content POS distribution in Reviews")

barplot.data.reviews.otherpos<-barplot(t(data.reviews.otherpos),col = c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4","dodgerblue","dodgerblue3"), legend=colnames(data.reviews.otherpos),beside=TRUE,ylab="other POS distribution in Reviews")

barplot.data.reviews.enruhr<-barplot(t(data.reviews.enruhr),col = c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4"), legend=colnames(data.reviews.enruhr),beside=TRUE,ylab="POS distribution in Reviews")

barplot.data.reviews.contentpos.enruhr<-barplot(t(data.reviews.contentpos.enruhr),col = c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4"), legend=colnames(data.reviews.contentpos.enruhr),beside=TRUE,ylab="content POS distribution in Reviews")

barplot.data.reviews.otherpos.enruhr<-barplot(t(data.reviews.otherpos.enruhr),col = c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4"), legend=colnames(data.reviews.otherpos.enruhr),beside=TRUE,ylab="other POS distribution in Reviews")

dev.off()

pdf("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/barplots-pos-horizontal.pdf",width = 43, height = 65, pointsize = 45)

barplot.data.news.t<-barplot(t(data.news),horiz=TRUE,col = c("forestgreen","antiquewhite2","antiquewhite4","cadetblue","cadetblue4"), beside=TRUE,xlab="POS distribution")
legend("right", legend=colnames(data.news), pch=15, col=c("forestgreen","antiquewhite2","antiquewhite4","cadetblue","cadetblue4"))
#text(barplot.data,t(data),labels=as.character(t(data)))
barplot.data.reviews.t<-barplot(t(data.reviews),horiz=TRUE,col = c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4","dodgerblue","dodgerblue3"), beside=TRUE,xlab="POS distribution",xaxp=c(0,15,10),xlim=range(pretty(c(0, t(data.reviews)))))
legend("right", legend=colnames(data.reviews), pch=15, col=c("forestgreen","antiquewhite2","antiquewhite3","antiquewhite4","cadetblue","cadetblue4","dodgerblue","dodgerblue3"))

dev.off()

pdf("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/barplots-pos-turned.pdf",width = 43, height = 50, pointsize = 55)

barplot.data.news.turned<-barplot(t(data.news.turned),col=heat.colors(17), legend=colnames(data.news.turned),beside=TRUE,ylab="POS distribution")
barplot.data.reviews.turned<-barplot(t(data.reviews.turned),col=heat.colors(17), legend=colnames(data.reviews.turned),beside=TRUE,ylab="POS distribution")

dev.off()


