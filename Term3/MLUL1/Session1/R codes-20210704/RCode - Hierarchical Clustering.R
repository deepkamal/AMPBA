## Set the working directory to where the Excel file is
## Session > Set Working Directory > Choose Directory > Select the directory where the Excel file is

getwd()
dir()

input <- read.csv("../Datasets-20210704/Universities (1).csv",header=TRUE)
dim(input)

mydata <- input[1:25,3:8] ## exclude the columns with university and state names
standardized_data <- scale(mydata) ## standardize the columns

## Hierarchical Clustering

?dist ## computes the distance matrix
?hclust ## runs hierarchical clustering

## Aproach 1: Euclidean distance, Single linkage
d <- dist(standardized_data, method = "euclidean") 
fit <- hclust(d, method="single")
plot(fit) # display dendrogram
rect.hclust(fit, k=2, border="red")
input[3,]
rect.hclust(fit, k=3, border="green")
input[18,]
rect.hclust(fit, k=4, border="blue")
input[c(2,10),]

plot(fit) # display dendrogram
rect.hclust(fit, k=10, border="red")
groups <- cutree(fit, k=10) # cut tree into 10 clusters
groups
membership<-as.matrix(groups)
membership
?subset
cluster1 <- subset(input,membership[,1]==1)
cluster1

## Aproach 2: Euclidean distance, Complete linkage 
d <- dist(standardized_data, method = "euclidean")
fit <- hclust(d, method="complete")
plot(fit) # display dendrogram
rect.hclust(fit, k=3, border="red")
groups <- cutree(fit, k=3) # cut tree into 3 clusters
membership<-as.matrix(groups)
membership
cluster1 <- subset(input,membership[,1]==1)
cluster1 ## what sort of universities are these?
cluster2 <- subset(input,membership[,1]==2)
cluster2 ## what sort of universities are these?
cluster3 <- subset(input,membership[,1]==3)
cluster3 ## what sort of universities are these?

## Preparing the cluster membership data to analyze cluster characteristics in Tableau
colnames(membership)[1] <- "Cluster ID"
UnivsWithClusterMembership <- cbind(input,membership)
UnivsWithClusterMembership
write.csv(UnivsWithClusterMembership,file="../Datasets-20210704/UniversitiesWithClusterMembership.csv")

## Now launch Tableau, upload UniversitiesWithClusterMembership.csv, andalyze the cluster characteristics




## Other APIs for calculating distance matrix
library(cluster)
?daisy  ## "euclidean", "manhattan", "gower" are available in this API
library(ade4)
?dist.binary ## Jaccard index, Simple matching coefficient, etc., are availble in this API
## There are several other APIs in some other packages (e.g., sm {nomclusT}, vegdist {vegan}) to compute distance matrix. Please pay attention to the definition of the distance metrics in those APIs before using them.