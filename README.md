# SeedsClustering
To group different kernels of  varieties of wheat using different clustering methods

https://archive.ics.uci.edu/ml/datasets/seeds

Dataset – Seeds Data Set
Method – 
Hierarchical Clustering – Complete Linkage using Euclidean distance
K-Means – Clustering
Gap Statistics – Choosing K
Rand Index and Adjusted Rand Index – Cluster performance

Seeds data set contains attributes as below:

Attribute Information:
To construct the data, seven geometric parameters of wheat kernels were measured:
1. area A,
2. perimeter P,
3. compactness C = 4*pi*A/P^2,
4. length of kernel,
5. width of kernel,
6. asymmetry coefficient
7. length of kernel groove.

All of these parameters were real-valued continuous.

These attributes help to group different kernels of varieties of wheat. Let’s use clustering to see the
grouping done is appropriate based on field seed group.


Conclusion:

K means clustering had better performance when compared to hierarchical -average linkage clustering.
Clustering does not overlap much with observations.

K means clustering is better as data is less and finding number of centroids using GAP stats is efficient
and applying k means on top of this data resulted in nearly a perfect cluster with Rand index of 0.88
which is better than other hierarchical methods.

I would suggest K-means algorithm for this data set which is efficient in terms of performance and
cluster stability.
