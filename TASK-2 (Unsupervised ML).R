#INVOKING LIBRARIES
library(factoextra)
library(NbClust)

#IMPORTING DATASET
df = iris
my_data = df[, 1:4]
head(my_data)

#FINDING OUT OPTIMAL NUMBER OF CLUSTER
set.seed(123)
factoextra::fviz_nbclust(x = my_data, 
                         FUNcluster = kmeans, 
                         method = "wss")
#K-MEAN CLUSTERING
iriscluster = kmeans(my_data, centers =3 , nstart = 25)
print(iriscluster)

table(iriscluster$cluster, iris$Species)

# VIDUALIZATION
p1 = factoextra::fviz_cluster(object = iriscluster, data = my_data, geom = "point")
plot(p1)
