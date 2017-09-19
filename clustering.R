# This mini-project is based on the K-Means exercise from 'R in Action'
# Go here for the original blog post and solutions
# http://www.r-bloggers.com/k-means-clustering-from-r-in-action/

# Exercise 0: Install these packages if you don't have them already

# install.packages(c("cluster", "rattle.data","NbClust"))

# Now load the data and look at the first few rows
data(wine, package="rattle.data")
head(wine)

# Exercise 1: Remove the first column from the data and scale
# it using the scale() function
type_vector <- wine$Type
wine$Type = NULL
wine_scale <- scale(wine)

# Now we'd like to cluster the data using K-Means. 
# How do we decide how many clusters to use if you don't know that already?
# We'll try two methods.

# Method 1: A plot of the total within-groups sums of squares against the 
# number of clusters in a K-means solution can be helpful. A bend in the 
# graph can suggest the appropriate number of clusters. 

wssplot <- function(data, nc=15, seed=1234){
	              wss <- (nrow(data)-1)*sum(apply(data,2,var))
               	      for (i in 2:nc){
		        set.seed(seed)
	                wss[i] <- sum(kmeans(data, centers=i)$withinss)}
	                
		      plot(1:nc, wss, type="b", xlab="Number of Clusters",
	                        ylab="Within groups sum of squares")
	   }

wssplot(wine_scale)

# Exercise 2:
#   * How many clusters does this method suggest?
# 		This method suggests 3-5 clusters.

#   * Why does this method work? What's the intuition behind it?
#   * Look at the code for wssplot() and figure out how it works
#		wssplot() is iterating from 1 to 15 clusters and finding the sum of squares of variance within them. 
#		The lower this number is, the more closely grouped the clusters are. 
#		The biggest improvement for this number is at 3 clusters. 
#		Going further would increase computation but does not improve the SS by much per cluster introduced.

# Method 2: Use the NbClust library, which runs many experiments
# and gives a distribution of potential number of clusters.

library(NbClust)
set.seed(1234)
nc <- NbClust(wine_scale, min.nc=2, max.nc=15, method="kmeans")
barplot(table(nc$Best.n[1,]),
	          xlab="Numer of Clusters", ylab="Number of Criteria",
		            main="Number of Clusters Chosen by 26 Criteria")


# Exercise 3: How many clusters does this method suggest?
#		This method suggests 3 clusters.

# Exercise 4: Once you've picked the number of clusters, run k-means 
# using this number of clusters. Output the result of calling kmeans()
# into a variable fit.km

fit.km <- kmeans(wine_scale, 3)
str(fit.km)

List of 9
 $ cluster     : int [1:178] 3 3 3 3 3 3 3 3 3 3 ...
 $ centers     : num [1:3, 1:13] 0.164 -0.923 0.833 0.869 -0.393 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:3] "1" "2" "3"
  .. ..$ : chr [1:13] "Alcohol" "Malic" "Ash" "Alcalinity" ...
 $ totss       : num 2301
 $ withinss    : num [1:3] 326 559 386
 $ tot.withinss: num 1271
 $ betweenss   : num 1030
 $ size        : int [1:3] 51 65 62
 $ iter        : int 3
 $ ifault      : int 0
 - attr(*, "class")= chr "kmeans"
 
 
# Now we want to evaluate how well this clustering does.

# Exercise 5: using the table() function, show how the clusters in fit.km$clusters
# compares to the actual wine types in wine$Type. Would you consider this a good
# clustering?
table(fit.km$cluster)

 1  2  3 
51 65 62 

table(type_vector)
type_vector
 1  2  3 
59 71 48 

#		Seems like a fairly good clustering. 
#		The number of predicted types from the k-means clustering algorithm come pretty close to the number of actual types.

# Exercise 6:
# * Visualize these clusters using  function clusplot() from the cluster library
# * Would you consider this a good clustering?

clusplot(pam(wine_scale, 3))

#		This clustering seems like the best we can get from the available data. 
#		Trying k=2 and k=4 gives us too widely distributed clusters or too overlapped clusters, respectively, 
#		and k=3 is the best middle ground.
#		There is still some overlap, but it is the best case since other k values don't have as much clarity.
