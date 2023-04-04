
#with this command you can start the script from the shell
#source("./dihutra/analyses/R-scripts/chisquare.R")

#pos
data.news = read.table("./dihutra/analyses/tables/upos-news.csv", header =TRUE)
data.reviews = read.table("./dihutra/analyses/tables/upos-reviews.csv", header=TRUE)
data.news.turned<-t(data.news)
data.reviews.turned<-t(data.reviews)

#relations
data.rel.news = read.table("./dihutra/analyses/tables/dep-rel-news.csv", header =TRUE)
data.rel.reviews = read.table("./dihutra/analyses/tables/dep-rel-reviews.csv", header=TRUE)
data.rel.news.turned<-t(data.rel.news)
data.rel.reviews.turned<-t(data.rel.reviews)

#Chi-square for POS
#news
#all subcorpora
chisq.data.news.turned.all<-chisq.test(data.news.turned)
print(chisq.data.news.turned.all)
#EN+RU
data.news.turned.enru<-data.news.turned[c(1:3),]
chisq.data.news.turned.enru<-chisq.test(data.news.turned.enru)
print(chisq.data.news.turned.enru)
#EN+RUprof
data.news.turned.enru.prof<-data.news.turned[c(1:2),]
chisq.data.news.turned.enru.prof<-chisq.test(data.news.turned.enru.prof)
print(chisq.data.news.turned.enru.prof)
#EN+RUstud
data.news.turned.enru.stud<-data.news.turned[c(1,3),]
chisq.data.news.turned.enru.stud<-chisq.test(data.news.turned.enru.stud)
print(chisq.data.news.turned.enru.stud)
#RU
data.news.turned.ru<-data.news.turned[c(2:3),]
chisq.data.news.turned.ru<-chisq.test(data.news.turned.ru)
print(chisq.data.news.turned.ru)
#EN+HR
data.news.turned.enhr<-data.news.turned[c(1,4:5),]
chisq.data.news.turned.enhr<-chisq.test(data.news.turned.enhr)
print(chisq.data.news.turned.enhr)
#EN+HRprof
data.news.turned.enhr.prof<-data.news.turned[c(1,4),]
chisq.data.news.turned.enhr.prof<-chisq.test(data.news.turned.enhr.prof)
print(chisq.data.news.turned.enhr.prof)
#EN+HRstud
data.news.turned.enhr.stud<-data.news.turned[c(1,5),]
chisq.data.news.turned.enhr.stud<-chisq.test(data.news.turned.enhr.stud)
print(chisq.data.news.turned.enhr.stud)
#HR
data.news.turned.hr<-data.news.turned[c(4:5),]
chisq.data.news.turned.hr<-chisq.test(data.news.turned.hr)
print(chisq.data.news.turned.hr)

capture.output(chisq.data.news.turned.all, 
               chisq.data.news.turned.enru, 
               chisq.data.news.turned.enru.prof, 
               chisq.data.news.turned.enru.stud, 
               chisq.data.news.turned.ru, 
               chisq.data.news.turned.enhr, 
               chisq.data.news.turned.enhr.prof, 
               chisq.data.news.turned.enhr.stud, 
               chisq.data.news.turned.hr, file="./dihutra/analyses/chisq_res/chisq.pos.news.txt", append=TRUE)


#reviews
#all subcorpora
chisq.data.reviews.turned.all<-chisq.test(data.reviews.turned)
print(chisq.data.reviews.turned.all)
#EN+RU
data.reviews.turned.enru<-data.reviews.turned[c(1:3),]
chisq.data.reviews.turned.enru<-chisq.test(data.reviews.turned.enru)
print(chisq.data.reviews.turned.enru)
#EN+RUprof
data.reviews.turned.enru.prof<-data.reviews.turned[c(1:2),]
chisq.data.reviews.turned.enru.prof<-chisq.test(data.reviews.turned.enru.prof)
print(chisq.data.reviews.turned.enru.prof)
#EN+RUstud
data.reviews.turned.enru.stud<-data.reviews.turned[c(1,3),]
chisq.data.reviews.turned.enru.stud<-chisq.test(data.reviews.turned.enru.stud)
print(chisq.data.reviews.turned.enru.stud)
#RU
data.reviews.turned.ru<-data.reviews.turned[c(2:3),]
chisq.data.reviews.turned.ru<-chisq.test(data.reviews.turned.ru)
print(chisq.data.reviews.turned.ru)
#EN+HR
data.reviews.turned.enhr<-data.reviews.turned[c(1,4:5),]
chisq.data.reviews.turned.enhr<-chisq.test(data.reviews.turned.enhr)
print(chisq.data.reviews.turned.enhr)
#EN+HRprof
data.reviews.turned.enhr.prof<-data.reviews.turned[c(1,4),]
chisq.data.reviews.turned.enhr.prof<-chisq.test(data.reviews.turned.enhr.prof)
print(chisq.data.reviews.turned.enhr.prof)
#EN+HRstud
data.reviews.turned.enhr.stud<-data.reviews.turned[c(1,5),]
chisq.data.reviews.turned.enhr.stud<-chisq.test(data.reviews.turned.enhr.stud)
print(chisq.data.reviews.turned.enhr.stud)
#HR
data.reviews.turned.hr<-data.reviews.turned[c(4:5),]
chisq.data.reviews.turned.hr<-chisq.test(data.reviews.turned.hr)
print(chisq.data.reviews.turned.hr)

#EN+FI
data.reviews.turned.enfi<-data.reviews.turned[c(1,6:7),]
chisq.data.reviews.turned.enfi<-chisq.test(data.reviews.turned.enfi)
print(chisq.data.reviews.turned.enfi)
#EN+FIprof
data.reviews.turned.enfi.prof<-data.reviews.turned[c(1,6),]
chisq.data.reviews.turned.enfi.prof<-chisq.test(data.reviews.turned.enfi.prof)
print(chisq.data.reviews.turned.enfi.prof)
#EN+FIstud
data.reviews.turned.enfi.stud<-data.reviews.turned[c(1,7),]
chisq.data.reviews.turned.enfi.stud<-chisq.test(data.reviews.turned.enfi.stud)
print(chisq.data.reviews.turned.enfi.stud)
#FI
data.reviews.turned.fi<-data.reviews.turned[c(6:7),c(1:5,7:9,11:15)]
chisq.data.reviews.turned.fi<-chisq.test(data.reviews.turned.fi)
print(chisq.data.reviews.turned.fi)

capture.output(chisq.data.reviews.turned.all, 
               chisq.data.reviews.turned.enru, 
               chisq.data.reviews.turned.enru.prof, 
               chisq.data.reviews.turned.enru.stud, 
               chisq.data.reviews.turned.ru, 
               chisq.data.reviews.turned.enhr, 
               chisq.data.reviews.turned.enhr.prof, 
               chisq.data.reviews.turned.enhr.stud, 
               chisq.data.reviews.turned.hr, 
               chisq.data.reviews.turned.enfi, 
               chisq.data.reviews.turned.enfi.prof, 
               chisq.data.reviews.turned.enfi.stud, 
               chisq.data.reviews.turned.fi, 
               file="./dihutra/analyses/chisq_res/chisq.pos.reviews.txt", append=TRUE)

#Chi-square for POS
#news
#all subcorpora
chisq.data.rel.news.turned.all<-chisq.test(data.rel.news.turned)
print(chisq.data.rel.news.turned.all)
#EN+RU
data.rel.news.turned.enru<-data.rel.news.turned[c(1:3),]
chisq.data.rel.news.turned.enru<-chisq.test(data.rel.news.turned.enru)
print(chisq.data.rel.news.turned.enru)
#EN+RUprof
data.rel.news.turned.enru.prof<-data.rel.news.turned[c(1:2),]
chisq.data.rel.news.turned.enru.prof<-chisq.test(data.rel.news.turned.enru.prof)
print(chisq.data.rel.news.turned.enru.prof)
#EN+RUstud
data.rel.news.turned.enru.stud<-data.rel.news.turned[c(1,3),]
chisq.data.rel.news.turned.enru.stud<-chisq.test(data.rel.news.turned.enru.stud)
print(chisq.data.rel.news.turned.enru.stud)
#RU
data.rel.news.turned.ru<-data.rel.news.turned[c(2:3),]
chisq.data.rel.news.turned.ru<-chisq.test(data.rel.news.turned.ru)
print(chisq.data.rel.news.turned.ru)
#EN+HR
data.rel.news.turned.enhr<-data.rel.news.turned[c(1,4:5),]
chisq.data.rel.news.turned.enhr<-chisq.test(data.rel.news.turned.enhr)
print(chisq.data.rel.news.turned.enhr)
#EN+HRprof
data.rel.news.turned.enhr.prof<-data.rel.news.turned[c(1,4),]
chisq.data.rel.news.turned.enhr.prof<-chisq.test(data.rel.news.turned.enhr.prof)
print(chisq.data.rel.news.turned.enhr.prof)
#EN+HRstud
data.rel.news.turned.enhr.stud<-data.rel.news.turned[c(1,5),]
chisq.data.rel.news.turned.enhr.stud<-chisq.test(data.rel.news.turned.enhr.stud)
print(chisq.data.rel.news.turned.enhr.stud)
#HR
data.rel.news.turned.hr<-data.rel.news.turned[c(4:5),]
chisq.data.rel.news.turned.hr<-chisq.test(data.rel.news.turned.hr)
print(chisq.data.rel.news.turned.hr)

capture.output(chisq.data.rel.news.turned.all, 
               chisq.data.rel.news.turned.enru, 
               chisq.data.rel.news.turned.enru.prof, 
               chisq.data.rel.news.turned.enru.stud, 
               chisq.data.rel.news.turned.ru, 
               chisq.data.rel.news.turned.enhr, 
               chisq.data.rel.news.turned.enhr.prof, 
               chisq.data.rel.news.turned.enhr.stud, 
               chisq.data.rel.news.turned.hr, file="./dihutra/analyses/chisq_res/chisq.rel.news.txt", append=TRUE)


#reviews
#all subcorpora
chisq.data.rel.reviews.turned.all<-chisq.test(data.rel.reviews.turned)
print(chisq.data.rel.reviews.turned.all)
#EN+RU
data.rel.reviews.turned.enru<-data.rel.reviews.turned[c(1:3),]
chisq.data.rel.reviews.turned.enru<-chisq.test(data.rel.reviews.turned.enru)
print(chisq.data.rel.reviews.turned.enru)
#EN+RUprof
data.rel.reviews.turned.enru.prof<-data.rel.reviews.turned[c(1:2),]
chisq.data.rel.reviews.turned.enru.prof<-chisq.test(data.rel.reviews.turned.enru.prof)
print(chisq.data.rel.reviews.turned.enru.prof)
#EN+RUstud
data.rel.reviews.turned.enru.stud<-data.rel.reviews.turned[c(1,3),]
chisq.data.rel.reviews.turned.enru.stud<-chisq.test(data.rel.reviews.turned.enru.stud)
print(chisq.data.rel.reviews.turned.enru.stud)
#RU
data.rel.reviews.turned.ru<-data.rel.reviews.turned[c(2:3),]
chisq.data.rel.reviews.turned.ru<-chisq.test(data.rel.reviews.turned.ru)
print(chisq.data.rel.reviews.turned.ru)
#EN+HR
data.rel.reviews.turned.enhr<-data.rel.reviews.turned[c(1,4:5),]
chisq.data.rel.reviews.turned.enhr<-chisq.test(data.rel.reviews.turned.enhr)
print(chisq.data.rel.reviews.turned.enhr)
#EN+HRprof
data.rel.reviews.turned.enhr.prof<-data.rel.reviews.turned[c(1,4),]
chisq.data.rel.reviews.turned.enhr.prof<-chisq.test(data.rel.reviews.turned.enhr.prof)
print(chisq.data.rel.reviews.turned.enhr.prof)
#EN+HRstud
data.rel.reviews.turned.enhr.stud<-data.rel.reviews.turned[c(1,5),]
chisq.data.rel.reviews.turned.enhr.stud<-chisq.test(data.rel.reviews.turned.enhr.stud)
print(chisq.data.rel.reviews.turned.enhr.stud)
#HR
data.rel.reviews.turned.hr<-data.rel.reviews.turned[c(4:5),]
chisq.data.rel.reviews.turned.hr<-chisq.test(data.rel.reviews.turned.hr)
print(chisq.data.rel.reviews.turned.hr)

#EN+FI
data.rel.reviews.turned.enfi<-data.rel.reviews.turned[c(1,6:7),]
chisq.data.rel.reviews.turned.enfi<-chisq.test(data.rel.reviews.turned.enfi)
print(chisq.data.rel.reviews.turned.enfi)
#EN+FIprof
data.rel.reviews.turned.enfi.prof<-data.rel.reviews.turned[c(1,6),]
chisq.data.rel.reviews.turned.enfi.prof<-chisq.test(data.rel.reviews.turned.enfi.prof)
print(chisq.data.rel.reviews.turned.enfi.prof)
#EN+FIstud
data.rel.reviews.turned.enfi.stud<-data.rel.reviews.turned[c(1,7),]
chisq.data.rel.reviews.turned.enfi.stud<-chisq.test(data.rel.reviews.turned.enfi.stud)
print(chisq.data.rel.reviews.turned.enfi.stud)
#FI
data.rel.reviews.turned.fi<-data.rel.reviews.turned[c(6:7),c(1:5,7:9,11:15)]
chisq.data.rel.reviews.turned.fi<-chisq.test(data.rel.reviews.turned.fi)
print(chisq.data.rel.reviews.turned.fi)

capture.output(chisq.data.rel.reviews.turned.all, 
               chisq.data.rel.reviews.turned.enru, 
               chisq.data.rel.reviews.turned.enru.prof, 
               chisq.data.rel.reviews.turned.enru.stud, 
               chisq.data.rel.reviews.turned.ru, 
               chisq.data.rel.reviews.turned.enhr, 
               chisq.data.rel.reviews.turned.enhr.prof, 
               chisq.data.rel.reviews.turned.enhr.stud, 
               chisq.data.rel.reviews.turned.hr, 
               chisq.data.rel.reviews.turned.enfi, 
               chisq.data.rel.reviews.turned.enfi.prof, 
               chisq.data.rel.reviews.turned.enfi.stud, 
               chisq.data.rel.reviews.turned.fi, 
               file="./dihutra/analyses/chisq_res/chisq.rel.reviews.txt", append=TRUE)

