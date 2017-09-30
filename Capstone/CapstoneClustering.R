# load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)
library(cluster)

# load subdata (prepared previously for regression) 
subdata_US <- read_csv("data/subdata_US.csv")

## -- Data Prep -- ##
-----------------------------------------------------------------------
clust_fields <- c("OPEID6", "INSTNM", "STABBR", "DATAYEAR", "CONTROL", "LOCALE", "UGDS", "COSTT4_A", "COSTT4_P", "FAMINC", "AGE_ENTRY") 
clustdata <- subdata_US[clust_fields]

# change labeling of years
clustdata$DATAYEAR <- factor(clustdata$DATAYEAR, labels = c("1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014"))

# just do clustering on most recent school data
clustdata <- filter(clustdata, DATAYEAR == "2014")

# remove unneeded columns
clustdata$OPEID6 = NULL
clustdata$DATAYEAR = NULL 

# make a copy for use later (do this before transforming data)
schoolCluster2014 <- clustdata

## -- Transform categorical data into binary columns -- ##
# create binary columns for STABBR
clustdata$state_AK <- ifelse(clustdata$STABBR == "AK", 1, 0) 
clustdata$state_AL <- ifelse(clustdata$STABBR == "AL", 1, 0) 
clustdata$state_AR <- ifelse(clustdata$STABBR == "AR", 1, 0)
clustdata$state_AZ <- ifelse(clustdata$STABBR == "AZ", 1, 0)
clustdata$state_CA <- ifelse(clustdata$STABBR == "CA", 1, 0) 
clustdata$state_CO <- ifelse(clustdata$STABBR == "CO", 1, 0)
clustdata$state_CT <- ifelse(clustdata$STABBR == "CT", 1, 0) 
clustdata$state_DC <- ifelse(clustdata$STABBR == "DC", 1, 0) 
clustdata$state_DE <- ifelse(clustdata$STABBR == "DE", 1, 0) 
clustdata$state_FL <- ifelse(clustdata$STABBR == "FL", 1, 0) 
clustdata$state_GA <- ifelse(clustdata$STABBR == "GA", 1, 0) 
clustdata$state_HI <- ifelse(clustdata$STABBR == "HI", 1, 0) 
clustdata$state_IA <- ifelse(clustdata$STABBR == "IA", 1, 0) 
clustdata$state_ID <- ifelse(clustdata$STABBR == "ID", 1, 0) 
clustdata$state_IL <- ifelse(clustdata$STABBR == "IL", 1, 0) 
clustdata$state_IN <- ifelse(clustdata$STABBR == "IN", 1, 0) 
clustdata$state_KS <- ifelse(clustdata$STABBR == "KS", 1, 0) 
clustdata$state_KY <- ifelse(clustdata$STABBR == "KY", 1, 0) 
clustdata$state_LA <- ifelse(clustdata$STABBR == "LA", 1, 0) 
clustdata$state_MA <- ifelse(clustdata$STABBR == "MA", 1, 0) 
clustdata$state_MD <- ifelse(clustdata$STABBR == "MD", 1, 0) 
clustdata$state_ME <- ifelse(clustdata$STABBR == "ME", 1, 0) 
clustdata$state_MI <- ifelse(clustdata$STABBR == "MI", 1, 0) 
clustdata$state_MN <- ifelse(clustdata$STABBR == "MN", 1, 0) 
clustdata$state_MO <- ifelse(clustdata$STABBR == "MO", 1, 0) 
clustdata$state_MS <- ifelse(clustdata$STABBR == "MS", 1, 0) 
clustdata$state_MT <- ifelse(clustdata$STABBR == "MT", 1, 0) 
clustdata$state_NC <- ifelse(clustdata$STABBR == "NC", 1, 0) 
clustdata$state_ND <- ifelse(clustdata$STABBR == "ND", 1, 0) 
clustdata$state_NE <- ifelse(clustdata$STABBR == "NE", 1, 0) 
clustdata$state_NH <- ifelse(clustdata$STABBR == "NH", 1, 0) 
clustdata$state_NJ <- ifelse(clustdata$STABBR == "NJ", 1, 0) 
clustdata$state_NM <- ifelse(clustdata$STABBR == "NM", 1, 0) 
clustdata$state_NV <- ifelse(clustdata$STABBR == "NV", 1, 0) 
clustdata$state_NY <- ifelse(clustdata$STABBR == "NY", 1, 0) 
clustdata$state_OH <- ifelse(clustdata$STABBR == "OH", 1, 0) 
clustdata$state_OK <- ifelse(clustdata$STABBR == "OK", 1, 0) 
clustdata$state_OR <- ifelse(clustdata$STABBR == "OR", 1, 0) 
clustdata$state_PA <- ifelse(clustdata$STABBR == "PA", 1, 0) 
clustdata$state_RI <- ifelse(clustdata$STABBR == "RI", 1, 0) 
clustdata$state_SC <- ifelse(clustdata$STABBR == "SC", 1, 0) 
clustdata$state_SD <- ifelse(clustdata$STABBR == "SD", 1, 0) 
clustdata$state_TN <- ifelse(clustdata$STABBR == "TN", 1, 0) 
clustdata$state_TX <- ifelse(clustdata$STABBR == "TX", 1, 0) 
clustdata$state_UT <- ifelse(clustdata$STABBR == "UT", 1, 0) 
clustdata$state_VA <- ifelse(clustdata$STABBR == "VA", 1, 0) 
clustdata$state_VT <- ifelse(clustdata$STABBR == "VT", 1, 0) 
clustdata$state_WA <- ifelse(clustdata$STABBR == "WA", 1, 0) 
clustdata$state_WI <- ifelse(clustdata$STABBR == "WI", 1, 0) 
clustdata$state_WV <- ifelse(clustdata$STABBR == "WV", 1, 0) 
clustdata$state_WY <- ifelse(clustdata$STABBR == "WY", 1, 0)

# remove original column
clustdata$STABBR = NULL 

# binary columns for CONTROL 
clustdata$public <- ifelse(clustdata$CONTROL == 1, 1, 0)
clustdata$private_nonprof <- ifelse(clustdata$CONTROL == 2, 1, 0)
clustdata$private_forprof <- ifelse(clustdata$CONTROL == 3, 1, 0)

# remove original column
clustdata$CONTROL = NULL

# binary columns for LOCALE
clustdata$city_large <- ifelse(clustdata$LOCALE == "11", 1, 0)
clustdata$city_mid <- ifelse(clustdata$LOCALE == "12", 1, 0)
clustdata$city_small <- ifelse(clustdata$LOCALE == "13", 1, 0)
clustdata$suburb_large <- ifelse(clustdata$LOCALE == "21", 1, 0)
clustdata$suburb_mid <- ifelse(clustdata$LOCALE == "22", 1, 0)
clustdata$suburb_small <- ifelse(clustdata$LOCALE == "23", 1, 0)
clustdata$town_fringe <- ifelse(clustdata$LOCALE == "31", 1, 0)
clustdata$town_distant <- ifelse(clustdata$LOCALE == "32", 1, 0)
clustdata$town_remote <- ifelse(clustdata$LOCALE == "33", 1, 0)
clustdata$rural_fringe <- ifelse(clustdata$LOCALE == "41", 1, 0)
clustdata$rural_distant <- ifelse(clustdata$LOCALE == "42", 1, 0)
clustdata$rural_remote <- ifelse(clustdata$LOCALE == "43", 1, 0)

# remove original column
clustdata$LOCALE = NULL

# fix data type to numeric
clustdata$UGDS <- as.numeric(clustdata$UGDS)
clustdata$COSTT4_A <- as.numeric(clustdata$COSTT4_A)
clustdata$COSTT4_P <- as.numeric(clustdata$COSTT4_P)
clustdata$FAMINC <- as.numeric(clustdata$FAMINC)
clustdata$AGE_ENTRY <- as.numeric(clustdata$AGE_ENTRY)

# plot these numerical data to see where outliers are 
# try to find a value to set as a cap 
plot(clustdata$UGDS)
# seems like 50,000 is good to set as a cap
clustdata$UGDS <- ifelse(clustdata$UGDS > 50000, 50000, clustdata$UGDS)

# do this for others
# COSTT4_A
plot(clustdata$COSTT4_A)
# set cap to 65,000
clustdata$COSTT4_A <- ifelse(clustdata$COSTT4_A > 65000, 65000, clustdata$COSTT4_A)

# COSTT4_P
plot(clustdata$COSTT4_P)
# set cap to 50,000
clustdata$COSTT4_P <- ifelse(clustdata$COSTT4_P > 50000, 50000, clustdata$COSTT4_P)

# FAMILY INCOME
plot(clustdata$FAMINC)
# don't need to change 

# AGE OF ENTRY
plot(clustdata$AGE_ENTRY)
# set cap to 45
clustdata$AGE_ENTRY <- ifelse(clustdata$AGE_ENTRY > 45, 45, clustdata$AGE_ENTRY)

# need to handle NAs
# UGDS: 706, COSTT4_A: 3619, COSTT4_P: 5016, FAMINC: 314, AGE_ENTRY: 314

# for UGDS, FAMINC, AGE_ENTRY we can try to replace NAs with the mean 
clustdata[c("UGDS")][is.na(clustdata[c("UGDS")])] <- mean(clustdata$UGDS, na.rm = TRUE)
clustdata[c("FAMINC")][is.na(clustdata[c("FAMINC")])] <- mean(clustdata$FAMINC, na.rm = TRUE)
clustdata[c("AGE_ENTRY")][is.na(clustdata[c("AGE_ENTRY")])] <- mean(clustdata$AGE_ENTRY, na.rm = TRUE)

# for COSTs, replacing with the mean will not work
# in general, if COSTT4_A has a value, it means COSTT4_P will be NA (so applying mean would not make sense)
# instead, make them 0
clustdata[c("COSTT4_A")][is.na(clustdata[c("COSTT4_A")])] <- 0
clustdata[c("COSTT4_P")][is.na(clustdata[c("COSTT4_P")])] <- 0

# save this for future use
write_csv(clustdata, "data/clustdata.csv")

# note these down for later use in Google doc spreadsheet
# mean and sd of the numeric variables (needed later to convert normalized data back to raw)
c(mean(clustdata$UGDS, na.rm = TRUE), sd(clustdata$UGDS, na.rm = TRUE))
c(mean(clustdata$COSTT4_A, na.rm = TRUE), sd(clustdata$COSTT4_A, na.rm = TRUE))
c(mean(clustdata$COSTT4_P, na.rm = TRUE), sd(clustdata$COSTT4_P, na.rm = TRUE))
c(mean(clustdata$FAMINC, na.rm = TRUE), sd(clustdata$FAMINC, na.rm = TRUE))
c(mean(clustdata$AGE_ENTRY, na.rm = TRUE), sd(clustdata$AGE_ENTRY, na.rm = TRUE))

## -- Clustering -- ##
-----------------------------------------------------------------------
## -- Scale the numerical columns -- ##
clustdata[2:6] <- scale(clustdata[2:6])

# calculate euclidean distances for only 2:72 (not the name)
distances <- dist(clustdata[2:72], method = "euclidean")

# make cluster object 
clusterSchools <- hclust(distances, method = "ward.D")

# create dendrogram
plot(clusterSchools)
# there is a spot where horizontal line rule gives us 8 clusters
rect.hclust(clusterSchools, k = 8)

# make 8 clusters using clusterSchools
clusterGroups <- cutree(clusterSchools, k = 8)

# view vector of these means, note them down, will be used to create a .csv 
as.vector(tapply(clustdata$UGDS, clusterGroups, mean))
as.vector(tapply(clustdata$COSTT4_A, clusterGroups, mean))
as.vector(tapply(clustdata$COSTT4_P, clusterGroups, mean))
as.vector(tapply(clustdata$FAMINC, clusterGroups, mean))
as.vector(tapply(clustdata$AGE_ENTRY, clusterGroups, mean))

# CONTROL
as.vector(tapply(clustdata$public, clusterGroups, mean))
as.vector(tapply(clustdata$private_nonprof, clusterGroups, mean))
as.vector(tapply(clustdata$private_forprof, clusterGroups, mean))

# LOCALE
as.vector(tapply(clustdata$city_large, clusterGroups, mean))
as.vector(tapply(clustdata$city_mid, clusterGroups, mean))
as.vector(tapply(clustdata$city_small, clusterGroups, mean))
as.vector(tapply(clustdata$suburb_large, clusterGroups, mean))
as.vector(tapply(clustdata$suburb_mid, clusterGroups, mean))
as.vector(tapply(clustdata$suburb_small, clusterGroups, mean))
as.vector(tapply(clustdata$town_fringe, clusterGroups, mean))
as.vector(tapply(clustdata$town_distant, clusterGroups, mean))
as.vector(tapply(clustdata$town_remote, clusterGroups, mean))
as.vector(tapply(clustdata$rural_fringe, clusterGroups, mean))
as.vector(tapply(clustdata$rural_distant, clusterGroups, mean))
as.vector(tapply(clustdata$rural_remote, clusterGroups, mean))

## -- Some work done here outside of R -- ##
# copy paste the values from the above vectors into notepad, create a .csv
# in Google docs spreadsheet, convert normalized values back to raw values with sd and mean from before -> x = sd*z + m
# classify the clusters (ex: above, near, or below average for numeric variables, public or private, type of local)

# my rough cluster definitions
# 1 (1285) - Pub, Mid Pop, Mid Cost (A), Mid Fam Inc, Mid 20s, Varying Locales				
# 2 (596)  - Non Prof, Low Pop, Mid Cost (A), Mid Fam Inc, Mid 20s, Large City / Suburb				
# 3 (297)  - Pub, High Pop, Mid Cost (A), High Fam Inc, Low 20s, Large City / Suburb				
# 4 (374)  - Non Prof, Mid Pop, High Cost (A), High Fam Inc, Low 20s, Large City / Suburb				
# 5 (997)  - Non Prof, Low Pop, High Cost (A), High Fam Inc, Low 20s, Large City / Suburb				
# 6 (796)  - For Prof, Low Pop, High Cost (A), Low Fam Inc, Upper 20s, Large City / Suburb				
# 7 (2032) - For Prof, Low Pop, High Cost (P), Low Fam Inc, Mid 20s, Large City / Suburb				
# 8 (1165) - Pub / For Prof, Low Pop, Mid Cost (P), Low Fam Inc, Upper 20s, Large City / Suburb	

# add cluster column to the dataset copy from earlier
schoolCluster2014$CLUSTER <- clusterGroups

# see number of records in each cluster			
table(schoolCluster2014$CLUSTER)
   1    2    3    4    5    6    7    8 
1285  596  297  374  997  796 2032 1165 

# example: I am interested in Drexel University
View(subset(schoolCluster2014, INSTNM == "Drexel University"))
# it is cluster 4 (Non Prof, Mid Pop, High Cost (A), High Fam Inc, Low 20s, Large City / Suburb)

# take a look at all cluster 4
View(subset(schoolCluster2014, CLUSTER == 4))