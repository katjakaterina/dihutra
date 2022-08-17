library("gplots")
library("vcd")
library("graphics")
library("corrplot")
library("ca")
library(ape)
library(cluster)
library(pvclust)
library(fpc)

data.multiv <- read.table("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/stat-all-label.csv", header=TRUE)
data.multiv.matr <- as.table(as.matrix(data.multiv))

data.multiv.review <-data.multiv[c(2,5:6,9:12),]
data.multiv.matr.review <- as.table(as.matrix(data.multiv.review))
data.multiv.review.trans <-data.multiv[c(5:6,9:12),]
data.multiv.matr.review.trans <- as.table(as.matrix(data.multiv.review.trans))
data.multiv.review.pos <-data.multiv[c(2,5:6,9:12),c(1:17)]
data.multiv.matr.review.pos <- as.table(as.matrix(data.multiv.review.pos))
data.multiv.review.deprel <-data.multiv[c(2,5:6,9:12),c(18:42)]
data.multiv.matr.review.deprel <- as.table(as.matrix(data.multiv.review.deprel))
data.multiv.review.deprel.core <-data.multiv[c(2,5:6,9:12),c("ccomp","csubj","xcomp","nsubj","obj","obl")]
data.multiv.matr.review.deprel.core <- as.table(as.matrix(data.multiv.review.deprel.core))
#Note that, while Chi-square test can help to establish dependence between rows and the columns, the nature of the dependency is unknown.
#chisq$observed
#round(chisq$expected,2)
#chisq.test for the data:

chisq.res.data.multiv<-chisq.test(data.multiv.matr)
print(chisq.res.data.multiv)

chisq.res.data.multiv.review<-chisq.test(data.multiv.matr.review)
print(chisq.res.data.multiv.review)

chisq.res.data.multiv.review.trans<-chisq.test(data.multiv.matr.review.trans)
print(chisq.res.data.multiv.review.trans)

chisq.res.data.multiv.review.pos<-chisq.test(data.multiv.matr.review.pos)
print(chisq.res.data.multiv.review.pos)

chisq.res.data.multiv.review.deprel<-chisq.test(data.multiv.matr.review.deprel)
print(chisq.res.data.multiv.review.deprel)

chisq.res.data.multiv.review.deprel.core<-chisq.test(data.multiv.matr.review.deprel.core)
print(chisq.res.data.multiv.review.deprel.core)
#Pearson's Chi-squared test
#data:  data.multiv.matr
#X-squared = 44851, df = 451, p-value < 2.2e-16
#In our data, the row and the column variables are statistically significantly associated (p-value >/= 0).

chisq.data.multiv<-chisq.test(data.multiv)
ratio.data.multiv <- chisq.data.multiv$observed/chisq.data.multiv$expected
round(ratio.data.multiv,3)

pdf("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/multivariate-review.pdf",width = 63, height = 30, pointsize = 45)
res.ca.review <- ca(data.multiv.review, graph = FALSE)
plot(res.ca.review)
write.csv(print(res.ca.review),file=paste("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/CA.datamultiv.review.csv",sep="\t"))

res.ca.review.trans <- ca(data.multiv.review.trans, graph = FALSE)
plot(res.ca.review.trans)
write.csv(print(res.ca.review.trans),file=paste("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/CA.datamultiv.review.trans.csv",sep="\t"))

res.ca.review.pos <- ca(data.multiv.review.pos, graph = FALSE)
plot(res.ca.review.pos)
write.csv(print(res.ca.review.pos),file=paste("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/CA.datamultiv.review.pos.csv",sep="\t"))

res.ca.review.deprel <- ca(data.multiv.review.deprel, graph = FALSE)
plot(res.ca.review.deprel)
write.csv(print(res.ca.review.deprel),file=paste("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/CA.datamultiv.review.deprel.csv",sep="\t"))

res.ca.review.deprel.core <- ca(data.multiv.review.deprel.core, graph = FALSE)
plot(res.ca.review.deprel.core)
write.csv(print(res.ca.review.deprel.core),file=paste("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/CA.datamultiv.review.deprel.core.csv",sep="\t"))

dev.off()

pdf("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/multivariate.pdf",width = 63, height = 30, pointsize = 45)
#First, we draw a baloon plot: visualize a contingency table using the function balloonplot(). This function draws a graphical matrix where each cell
#contains a dot whose size reflects the relative magnitude of the corresponding component. In statistics, quantitative measures of the relationship 
#between two indexes that are being compared. Relative magnitudes are obtained by dividing one of the indexes by the others, which is taken as the basis of comparison.
#The forms in which relative magnitudes are expressed include coefficients (multiple ratios), percentages, and pro mille ratios, while concrete numbers 
#(for example, number of inhabitants per sq km) are used in some cases. 

balloonplot(t(data.multiv.matr), main ="all feat", xlab ="", ylab="", label = FALSE, show.margins = FALSE)

#mosaic graphs
#Mosaic plot is used to visualize a contingency table in order to examine the association between categorical variables.

#The blue plot, is the mosaic plot of the observed values:
mosaicplot(data.multiv,  las=2, col="steelblue", main = "all features - observed counts")

#The gray one is the mosaic plot of the expected values under null hypothesis.
mosaicplot(chisq.data.multiv$expected,  las=2, col = "gray", main = "all feat - expected counts")

#If row and column variables were completely independent the mosaic bars for the observed values (blue graph) would be aligned
#as the mosaic bars for the expected values (gray graph).
#which is mostly not the case
#We colour the mosaic plot according to the value of the standardized residuals
#A standardized residual is a ratio: The difference between the observed count and the expected count and the standard deviation of the expected count in chi-square testing. 
#The standardized residual is a measure of the strength of the difference between observed and expected values. It's a measure of how significant your cells are to the chi-square value. When you compare the cells, the standardized residual makes it easy to see which cells are contributing the most to the value, and which are contributing the least.
#Blue color indicates that the observed value is higher than the expected value if the data were random
#Red color specifies that the observed value is lower than the expected value if the data were random
mosaicplot(data.multiv, shade = TRUE, las=2, main = "all features: standardized residuals")

#Correlation plots of various designs:
#In the graph, the size of the circle/square is proportional to the magnitude of the distance between row profiles.
#visualise likelihood ratio
#We take the log(ratio) to see the attraction and the repulsion in different colors:
#If ratio < 1 => log(ratio) < 0 (negative values) => red color
#If ratio > 1 = > log(ratio) > 0 (positive values) => blue color
#We’ll also add a small value (0.5) to all cells to avoid log(0):
corrplot(log2(ratio.data.multiv + 0.5), is.cor = FALSE, method="square")
corrplot(log2(ratio.data.multiv + 0.5), is.cor = FALSE, method="square", col = c("white","black"), )
corrplot(log2(ratio.data.multiv + 0.5), is.cor = FALSE, method = "number")
corrplot(log2(ratio.data.multiv + 0.5), is.cor = FALSE, method = "shade")
corrplot(log2(ratio.data.multiv + 0.5), is.cor = FALSE, col = c("white","black"), bg = "lightgrey")
corrplot(log2(ratio.data.multiv + 0.5), is.cor = FALSE, col = gray.colors(100))
corrplot(ratio.data.multiv, is.cor = FALSE,  method="square")

#Correspondence analysis (CA) is required for large contingency table.
#It used to graphically visualize row points and column points in a low dimensional space.
#CA is a dimensional reduction method applied to a contingency table. The information retained by each dimension is called eigenvalue.
#Correspondence analysis (CA) is used to represent graphically the table of distances between row variables or between column variables.
#CA approach includes the following steps:
#STEP 1. Compute the standardized residuals
#STEP II. Compute the singular value decomposition (SVD) of the standardized residuals.

res.ca <- ca(data.multiv, graph = FALSE)
plot(res.ca, invisible ="col")
plot(res.ca, invisible ="row")
plot(res.ca)
write.csv(print(res.ca),file=paste("/home/katja/saar/vartra/eamt-dihutra/dihutra/analyses-pos/CA.datamultiv.csv",sep="\t"))
#We could also analyse the contribution of rows and columns (which we did not do)
#The contributions of a rows/columns to the definition of a principal axis are :
#cc <- apply(row.coord^2, 2, "*", row.mass)
#row.contrib <- t(apply(cc, 1, "/", eig[1:nb.axes,1])) *100
#round(row.contrib, 2)
#corrplot(row.contrib, is.cor = FALSE)
#cc <- apply(col.coord^2, 2, "*", col.mass)
#col.contrib <- t(apply(cc, 1, "/", eig[1:nb.axes,1])) *100
#round(col.contrib, 2)
#corrplot(col.contrib, is.cor = FALSE)
#corrplot(row.contrib, is.cor = FALSE)

#now we cluster the data to observe groupings of features
cluster.data.multiv<-pvclust(data.multiv, method.hclust="ward.D", method.dist="euclidean")
plot(cluster.data.multiv, main="CL for grouping features")
pvrect(cluster.data.multiv, alpha=.85) 

#now we cluster the data to observe groupings of subcorpora
cluster.data.multiv<-pvclust(t(data.multiv), method.hclust="ward.D", method.dist="euclidean")
plot(cluster.data.multiv, main="CL using  all features")
pvrect(cluster.data.multiv, alpha=.85) 
#close the graphs
dev.off()

