
#with this command you can start the script from the shell
#source("./dihutra/analyses/R-scripts/barplots.R")

data.news = read.table("./dihutra/analyses/tables/upos-news.csv", header =TRUE)
data.reviews = read.table("./dihutra/analyses/tables/upos-reviews.csv", header=TRUE)
data.news.turned<-t(data.news)
data.reviews.turned<-t(data.reviews)

pdf("./dihutra/analyses/graphs/barplots-pos-vertical.pdf",width = 63, height = 30, pointsize = 45)
#news
barplot.data.news<-barplot(t(data.news),col = c("forestgreen","antiquewhite2","antiquewhite4","cadetblue","cadetblue4"), legend=colnames(data.news),beside=TRUE,ylab="POS distribution in News")
#text(barplot.data.news,t(data.news),labels=as.character(t(data.news)))

#reviews
barplot.data.reviews<-barplot(t(data.reviews),col = c("forestgreen","antiquewhite2","antiquewhite4","cadetblue","cadetblue4","dodgerblue","dodgerblue3"), legend=colnames(data.reviews),beside=TRUE,ylab="POS distribution in Reviews")
#text(barplot.data.reviews,t(data.reviews),labels=as.character(t(data.reviews)))

dev.off()

