##############################################################################
## Project      : Seed Clustering
## Modified by  : Anand
## Created     : March 17 2020
## Edited     : March 17 2020
##############################################################################

#Below command removes all the objects from the workspace
rm(list = ls())
#Below command to turn off the graphics
graphics.off()

library("BiocManager")
library("factoextra")
library("fpc")
library("cluster")
library("bootcluster")
library("fossil")

#Loading data
data<-read.delim("seeds_dataset.txt",header=TRUE,sep="\t")
dim(data)
head(data)

#Excluding the variable seed group which should be used for comparison 
data_final<-data[c(1,2,3,4,5,6,7)]
dim(data_final)
head(data_final)

#normalize data as variables are of different metrics
datascaled<-scale(data_final)
summary(datascaled)
round(sd(datascaled),0)
head(datascaled)

####################################################################################
#Calculate distance matrix using Euclidean distance
distdata<-dist(datascaled,method = "euclidean")
distmat<-as.matrix(distdata)
dim(distmat)
head(distmat)

#hierarchical clustering - Complete,average and single 
wheatclust_comp<-hclust(distdata,method="complete")
wheatclust_avg<-hclust(distdata,method="average")
wheatclust_single<-hclust(distdata,method="single")

#Validate different clustering method
#complete linkage
plot(wheatclust_comp,hang=-1,cex=0.5)
wheatclust_comp<-cutree(wheatclust_comp,k=3)
table(wheatclust_comp, data$Seed.Group)
rand.index(wheatclust_comp, as.numeric(data$Seed.Group))
adj.rand.index(wheatclust_comp, as.numeric(data$Seed.Group))

#average linkage
plot(wheatclust_avg,hang=-1,cex=0.5)
wheatclust_avg<-cutree(wheatclust_avg,k=3)
table(wheatclust_avg, data$Seed.Group)
rand.index(wheatclust_avg, as.numeric(data$Seed.Group))
adj.rand.index(wheatclust_avg, as.numeric(data$Seed.Group))

#single linkage
plot(wheatclust_single,hang=-1,cex=0.5)
wheatclust_single<-cutree(wheatclust_single,k=3)
table(wheatclust_single, data$Seed.Group)
rand.index(wheatclust_single, as.numeric(data$Seed.Group))
adj.rand.index(wheatclust_single, as.numeric(data$Seed.Group))

####################################################################################
#Gap Statistics - kmeans to identify number of clusters - k
gap_kmeans <- clusGap(data_final, kmeans, nstart = 20, K.max = 10, B = 100)

plot(gap_kmeans, main = "Gap Statistic: kmeans")

#cluster using k means for k obtained from gap-stat
km3 <- kmeans(data_final, centers = 3, nstart = 10)

#validate the cluster performance using rand.index and adjusted rand index
table(km3$cluster, data$Seed.Group)
rand.index(km3$cluster, as.numeric(data$Seed.Group))
adj.rand.index(km3$cluster, as.numeric(data$Seed.Group))

# plot the k-means clusters 
plot(data_final, col = km3$cluster, main = "Example k-means")
points(km3$centers, col = 1:3, pch = 8, cex= 2)

####################################################################################




