# load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)

# load full data (very big)
fulldata <- read_csv("fulldata.csv")

# vector of US states names  
us_states <- c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY")

# filter out territories, save a copy 
fulldata_US <- subset(fulldata, fulldata$STABBR %in% us_states)
write_csv(fulldata_US, path = "/data/fulldata_US.csv", col_names = TRUE)

## -- Data Prep -- ##
-----------------------------------------------------------------------
# decide important fields (arbitrary, intuition)
fields <- c("UNITID", "OPEID", "OPEID6", "INSTNM", "CITY", "STABBR", "ZIP", "DATAYEAR", "MAIN", "NUMBRANCH", "PREDDEG", "HIGHDEG", "CONTROL", "ST_FIPS", "REGION", "LOCALE", "LOCALE2", "HBCU", "PBI", "ANNHI", "TRIBAL", "AANAPII", "HSI", "NANTI", "MENONLY", "WOMENONLY", "RELAFFIL", "ADM_RATE", "SAT_AVG", "PCIP01", "PCIP03", "PCIP04", "PCIP05", "PCIP09", "PCIP10", "PCIP11", "PCIP12", "PCIP13", "PCIP14", "PCIP15", "PCIP16", "PCIP19", "PCIP22", "PCIP23", "PCIP24", "PCIP25", "PCIP26", "PCIP27", "PCIP29", "PCIP30", "PCIP31", "PCIP38", "PCIP39", "PCIP40", "PCIP41", "PCIP42", "PCIP43", "PCIP44", "PCIP45", "PCIP46", "PCIP47", "PCIP48", "PCIP49", "PCIP50", "PCIP51", "PCIP52", "PCIP54", "UGDS", "UGDS_WHITE", "UGDS_BLACK", "UGDS_HISP", "UGDS_ASIAN", "UGDS_AIAN", "UGDS_NHPI", "UGDS_2MOR", "UGDS_NRA", "UGDS_UNKN", "UGDS_WHITENH", "UGDS_BLACKNH", "UGDS_API", "UGDS_AIANOLD", "UGDS_HISPOLD", "FEMALE", "UGDS_MEN", "UGDS_WOMEN", "NPT4_PUB", "NPT4_PRIV", "NPT4_PROG", "NPT4_OTHER", "NUM4_PUB", "NUM4_PRIV", "NUM4_PROG", "COSTT4_A", "COSTT4_P", "TUITIONFEE_IN", "TUITIONFEE_OUT", "TUITIONFEE_PROG", "TUITFTE", "INEXPFTE", "AVGFACSAL", "PFTFAC", "C150_4", "C150_L4", "PFTFTUG1_EF", "PCTFLOAN", "UG25ABV", "CDR2", "CDR3", "RPY_1YR_RT", "COMPL_RPY_1YR_RT", "NONCOM_RPY_1YR_RT", "RPY_3YR_RT", "COMPL_RPY_3YR_RT", "NONCOM_RPY_3YR_RT", "RPY_5YR_RT", "COMPL_RPY_5YR_RT", "NONCOM_RPY_5YR_RT", "RPY_7YR_RT", "COMPL_RPY_7YR_RT", "NONCOM_RPY_7YR_RT", "DEBT_MDN", "GRAD_DEBT_MDN", "WDRAW_DEBT_MDN", "DEBT_N", "GRAD_DEBT_N", "WDRAW_DEBT_N", "AGE_ENTRY", "AGE_ENTRY_SQ", "AGEGE24", "FEMALE", "MARRIED", "DEPENDENT", "VETERAN", "FIRST_GEN", "FAMINC", "MD_FAMINC", "FAMINC_IND", "COUNT_NWNE_P10", "COUNT_WNE_P10", "MN_EARN_WNE_P10", "MD_EARN_WNE_P10", "COUNT_NWNE_P6", "COUNT_WNE_P6", "MN_EARN_WNE_P6", "MD_EARN_WNE_P6", "COUNT_NWNE_P7", "COUNT_WNE_P7", "MN_EARN_WNE_P7", "COUNT_NWNE_P8", "COUNT_WNE_P8", "MN_EARN_WNE_P8", "COUNT_NWNE_P9", "COUNT_WNE_P9", "MN_EARN_WNE_P9")

# create and save subdata_US: important fields and US only 
# will save loading time by not needing to get fulldata every session
subdata_US <- fulldata_US[fields]
write_csv(subdata_US, "data/subdata_US.csv", col_names = TRUE)

# change labels of DATAYEAR to say only start year (remind user that school year starts in September)
subdata_US$DATAYEAR <- factor(subdata_US$DATAYEAR, labels = c("1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014"))

# create training and test data sets
costdata_train <- filter(subdata_US, subdata_US$DATAYEAR %in% c("1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"))
costdata_test <- filter(subdata_US, subdata_US$DATAYEAR %in% c("2014"))

# save training and test data sets
write_csv(costdata_train, "data/costdata_train.csv", col_names = TRUE)
write_csv(costdata_test, "data/costdata_test.csv", col_names = TRUE)

# create cleaned dataset(choose best ind. variables)
df.train <- select(costdata_train, one_of(c("OPEID6", "INSTNM", "DATAYEAR", "PREDDEG", "HIGHDEG", "CONTROL", "REGION", "ADM_RATE", "SAT_AVG", "UGDS", "COSTT4_A", "TUITFTE", "INEXPFTE", "AVGFACSAL", "PFTFAC", "PCTFLOAN", "DEBT_MDN", "FAMINC")))
df.test <- select(costdata_test, one_of(c("OPEID6", "INSTNM", "DATAYEAR", "PREDDEG", "HIGHDEG", "CONTROL", "REGION", "ADM_RATE", "SAT_AVG", "UGDS", "COSTT4_A", "TUITFTE", "INEXPFTE", "AVGFACSAL", "PFTFAC", "PCTFLOAN", "DEBT_MDN", "FAMINC"))) 

# change columns to numeric in training set 
df.train$ADM_RATE <- as.numeric(df.train$ADM_RATE)
df.train$SAT_AVG <- as.numeric(df.train$SAT_AVG)
df.train$UGDS <- as.numeric(df.train$UGDS)
df.train$COSTT4_A <- as.numeric(df.train$COSTT4_A)
df.train$TUITFTE <- as.numeric(df.train$TUITFTE)
df.train$INEXPFTE <- as.numeric(df.train$INEXPFTE)
df.train$AVGFACSAL <- as.numeric(df.train$AVGFACSAL)
df.train$PFTFAC <- as.numeric(df.train$PFTFAC)
df.train$PCTFLOAN <- as.numeric(df.train$PCTFLOAN)
df.train$DEBT_MDN <- as.numeric(df.train$DEBT_MDN)
df.train$FAMINC <- as.numeric(df.train$FAMINC)

# change columns to numeric in test set
df.test$ADM_RATE <- as.numeric(df.test$ADM_RATE)
df.test$SAT_AVG <- as.numeric(df.test$SAT_AVG)
df.test$UGDS <- as.numeric(df.test$UGDS)
df.test$COSTT4_A <- as.numeric(df.test$COSTT4_A)
df.test$TUITFTE <- as.numeric(df.test$TUITFTE)
df.test$INEXPFTE <- as.numeric(df.test$INEXPFTE)
df.test$AVGFACSAL <- as.numeric(df.test$AVGFACSAL)
df.test$PFTFAC <- as.numeric(df.test$PFTFAC)
df.test$PCTFLOAN <- as.numeric(df.test$PCTFLOAN)
df.test$DEBT_MDN <- as.numeric(df.test$DEBT_MDN)
df.test$FAMINC <- as.numeric(df.test$FAMINC)

# see how many NAs there are for COSTT4_A and others
summary(df.train)
summary(df.test)

# 101,922 NAs for COSTT4_A in train
# after removing NAs, check summary again. how many NAs are remaining overall in the other variables?
df.train <- filter(df.train, !is.na(df.train$COSTT4_A))
summary(df.train)

# 3,619 NAs for COSTT4_A 
# remove and check summary again, are there too many NAs to make good predictions?
df.test <- filter(df.test, !is.na(df.test$COSTT4_A))
summary(df.test)

# the MAX for UGDS is unnaturally high, remove the University of Phoenix Online Campus records
# (optional) if you don't want to remove records, try to apply a neutral value or set a value cap across the dataset
df.train <- filter(df.train, df.train$OPEID6 != 20988) # ID for UoPhoenix Online Campus
df.test <- filter(df.test, df.test$OPEID6 != 20988) # ID for UoPhoenix Online Campus


# -- MAKE BASIC MODELS -- ##
-----------------------------------------------------------------------
# COST based on STUDENT SIZE, FACULTY SALARY, FULL TIME FACULTY
cost.mod <- lm(COSTT4_A ~ UGDS + AVGFACSAL + PFTFAC, data = df.train, na.action = na.omit)
# R2 = 0.2198

# COST based on STUDENT SIZE, FACULTY SALARY
cost.mod <- lm(COSTT4_A ~ UGDS + AVGFACSAL, data = df.train, na.action = na.omit)
# R2 = 0.2038

# COST based on STUDENT SIZE, SAT, ADMISSION RATE, FACULTY SALARY, TUITIONS INCOME, % THAT TAKE LOAN, MEDIAN DEBT 
cost.mod <- lm(COSTT4_A ~ UGDS + SAT_AVG + ADM_RATE + AVGFACSAL + TUITFTE + PCTFLOAN + DEBT_MDN, data = df.train, na.action = na.omit)
# R2 = 0.7801
summary(cost.mod)

# COST based on STUDENT SIZE, SAT, FACULTY SALARY, TUITIONS INCOME, MEDIAN DEBT, DATAYEAR
cost.mod <- lm(COSTT4_A ~ UGDS + SAT_AVG + AVGFACSAL + TUITFTE + DEBT_MDN + DATAYEAR, data = df.train, na.action = na.omit)
# R2 = 0.7787

# COST based on DATAYEAR, PREDOMINANT DEGREE, HIGHEST DEGREE, PUB/PRIV, REGION, ADM RATE, SAT AVG, STUDENT SIZE, FAC SALARY, FULL TIME FACALTY, DEB MEDIAN, FAMILY INCOME
cost.mod <- lm(COSTT4_A ~ DATAYEAR + PREDDEG + HIGHDEG + CONTROL + REGION + ADM_RATE + SAT_AVG + UGDS + AVGFACSAL + PFTFAC + DEBT_MDN + FAMINC, data = df.train, na.action = na.omit)
# R2 = 0.8254
# Indicates PREDDEG and ADM_RATE as not significant

# COST based on DATAYEAR, HIGHEST DEGREE, PUB/PRIV, REGION, SAT AVG, STUDENT SIZE, FAC SALARY, FULL TIME FACALTY, DEB MEDIAN, FAMILY INCOME
cost.mod <- lm(COSTT4_A ~ DATAYEAR + HIGHDEG + CONTROL + REGION + SAT_AVG + UGDS + AVGFACSAL + PFTFAC + DEBT_MDN + FAMINC, data = df.train, na.action = na.omit)
# R2 = 0.8252
# check if REGION is necesary

# COST based on DATAYEAR, HIGHEST DEGREE, PUB/PRIV, SAT AVG, STUDENT SIZE, FAC SALARY, FULL TIME FACALTY, DEB MEDIAN, FAMILY INCOME
cost.mod <- lm(COSTT4_A ~ DATAYEAR + HIGHDEG + CONTROL + SAT_AVG + UGDS + AVGFACSAL + PFTFAC + DEBT_MDN + FAMINC, data = df.train, na.action = na.omit)
# R2 = 0.8251
# REGION does not look necessary, this is the best model so far (all variables significant)

# it seems that the influential data points are: the datayear, the highest degree type offered, whether the school is Pub/Priv, the average SAT accepted, the student population size, the average faculty salary, the percent of faculty that are full time, the median debt for students, and the average family income 
# is there still room for improvement here?
# how can schools better manage their money? are there ways to make schools more affordable now that these are identified?

# now that we know which data fields we want, remove the ones not needed in model
df.train <- select(df.train, one_of(c("OPEID6", "INSTNM", "DATAYEAR", "REGION", "HIGHDEG", "CONTROL", "SAT_AVG", "UGDS", "AVGFACSAL", "PFTFAC", "DEBT_MDN", "FAMINC", "COSTT4_A")))
df.test <- select(df.test, one_of(c("OPEID6", "INSTNM", "DATAYEAR", "REGION", "HIGHDEG", "CONTROL", "SAT_AVG", "UGDS", "AVGFACSAL", "PFTFAC", "DEBT_MDN", "FAMINC", "COSTT4_A", "PREDICT", "DIFF")))

## -- Prediction -- ##
-----------------------------------------------------------------------
# try a prediction on test data
df.test$PREDICT <- predict(cost.mod, df.test)

# pos. DIFF means predict too high, neg. DIFF means predict too low
df.test$DIFF <- df.test$PREDICT - df.test$COSTT4_A

write_csv(df.train, "data/df_train.csv", col_names = TRUE)
write_csv(df.test, "data/df_test.csv", col_names = TRUE)

# plot training set and plot the predictions over it (see how the spread looks)
ggplot(NULL, aes(OPEID6, COSTT4_A)) + 
  geom_point(data = df.train, aes(col = as.factor(REGION))) + 
  geom_point(data = df.test, aes(y = df.test$PREDICT)) +
  labs(x = "OPEID6", y = "COSTT4_A", 
       title = "Prediction (Black) vs. Training (Coloured)") + 
  scale_colour_discrete(name = "Region", 
                        labels = c("US Service Schools", "New England", "Mid East", "Great Lakes", "Plains", "Southeast", "Southwest", "Rocky Mountains", "Far West", "Outlying Areas"))
  
# plot predictions over the actual for 2014
ggplot(NULL) + 
  geom_point(data = df.test, aes(df.test$OPEID6, df.test$COSTT4_A), 
             col = "black") + 
  geom_point(data = df.test, aes(df.test$OPEID6, df.test$PREDICT), 
             col = ifelse(abs(df.test$DIFF) <= 4000, "green", "red")) +
  labs(x = "OPEID6", y = "COSTT4_A",
       title = "Prediction (Red/Green) vs. Actual (Black)")
	   
# can see that success of predictions are fairly mixed in the lower OPEID6 region, but predictions happened consistently.
# in mid and upper OPEID6, there are NAs present, so the model does not predict.
# two possible approaches: remove a variable with too many NAs or replace NAs with something neutral

## -- Adjust and Compare -- ##
-----------------------------------------------------------------------
## -- Removing NAs approach -- ##
# summary shows that SAT_AVG has by far the most NAs, so try a model with that removed
# COST based on DATAYEAR, HIGHEST DEGREE, PUB/PRIV, STUDENT SIZE, FAC SALARY, DEB MEDIAN, FAMILY INCOME
# removing SAT_AVG also shows PFTFAC as an insignificant variable, so it is also removed
mod1 <- lm(COSTT4_A ~ DATAYEAR + HIGHDEG + CONTROL + UGDS + AVGFACSAL + DEBT_MDN + FAMINC, data = df.train, na.action = na.omit)
# R2 = 0.771

# temp test set 
temp.test <- df.test

# try a prediction on temp data
temp.test$PREDICT <- predict(mod1, temp.test)

# pos. DIFF means predict too high, neg. DIFF means predict too low
temp.test$DIFF <- temp.test$PREDICT - temp.test$COSTT4_A

# plot training set (see costs by ID) and plot the temp predictions over it (see how the spread looks)
ggplot(NULL, aes(OPEID6, COSTT4_A)) + 
  geom_point(data = df.train, aes(col = as.factor(REGION))) + 
  geom_point(data = temp.test, aes(y = temp.test$PREDICT)) +
  labs(x = "OPEID6", y = "COSTT4_A", 
       title = "Weaker Model, Fewer NAs") + 
  scale_colour_discrete(name = "Region", 
                        labels = c("US Service Schools", "New England", "Mid East", "Great Lakes", "Plains", "Southeast", "Southwest", "Rocky Mountains", "Far West", "Outlying Areas"))
  
# plot temp predictions over the actual for 2014
ggplot(NULL) + 
  geom_point(data = temp.test, aes(temp.test$OPEID6, temp.test$COSTT4_A), 
             col = "black") + 
  geom_point(data = temp.test, aes(temp.test$OPEID6, temp.test$PREDICT), 
             col = ifelse(abs(temp.test$DIFF) <= 4000, "green", "red")) +
  labs(x = "OPEID6", y = "COSTT4_A",
       title = "Weaker Model, Fewer NAs") 

	   
## -- Replacing NAs approach -- ##
# make data table copy for approximating missing fields, remove prediction
df.test.approx <- df.test
df.test.approx$PREDICT = NULL
df.test.approx$DIFF = NULL

# check summary to see which columns have NAs
summary(df.test.approx)
# SAT_AVG: 2595, UGDS: 1, AVGFACSAL: 190, PFTFAC: 520, DEBT_MDN: 232, FAMINC: 15

# apply column averages to all, remove all NAs
df.test.approx[c("SAT_AVG")][is.na(df.test.approx[c("SAT_AVG")])] <- mean(df.test.approx$SAT_AVG, na.rm = TRUE)
df.test.approx[c("UGDS")][is.na(df.test.approx[c("UGDS")])] <- mean(df.test.approx$UGDS, na.rm = TRUE)
df.test.approx[c("AVGFACSAL")][is.na(df.test.approx[c("AVGFACSAL")])] <- mean(df.test.approx$AVGFACSAL, na.rm = TRUE)
df.test.approx[c("PFTFAC")][is.na(df.test.approx[c("PFTFAC")])] <- mean(df.test.approx$PFTFAC, na.rm = TRUE)
df.test.approx[c("DEBT_MDN")][is.na(df.test.approx[c("DEBT_MDN")])] <- mean(df.test.approx$DEBT_MDN, na.rm = TRUE)
df.test.approx[c("FAMINC")][is.na(df.test.approx[c("FAMINC")])] <- mean(df.test.approx$FAMINC, na.rm = TRUE)

# try a prediction on approx test data
df.test.approx$PREDICT <- predict(cost.mod, df.test.approx)
# now there are predictions for all schools

# pos. DIFF means predict too high, neg. DIFF means predict too low
df.test.approx$DIFF <- df.test.approx$PREDICT - df.test.approx$COSTT4_A

# plot training set (see costs by ID) and plot the temp predictions over it (see how the spread looks)
ggplot(NULL, aes(OPEID6, COSTT4_A)) + 
  geom_point(data = df.train, aes(col = as.factor(REGION))) + 
  geom_point(data = df.test.approx, aes(y = df.test.approx$PREDICT)) +
  labs(x = "OPEID6", y = "COSTT4_A", 
       title = "Original Model, NAs replaced") + 
  scale_colour_discrete(name = "Region", 
                        labels = c("US Service Schools", "New England", "Mid East", "Great Lakes", "Plains", "Southeast", "Southwest", "Rocky Mountains", "Far West", "Outlying Areas"))
  
# plot temp predictions over the actual for 2014
ggplot(NULL) + 
  geom_point(data = df.test.approx, aes(df.test.approx$OPEID6, df.test.approx$COSTT4_A), 
             col = "black") + 
  geom_point(data = df.test.approx, aes(df.test.approx$OPEID6, df.test.approx$PREDICT), 
             col = ifelse(abs(df.test.approx$DIFF) <= 4000, "green", "red")) +
  labs(x = "OPEID6", y = "COSTT4_A",
       title = "Original Model, NAs replaced")
	   
# the tradeoff for trying to get predictions for all schools is higher inaccuracy (more red points than green in the upper OPEID6)
# seems like removing the variable with many NAs (SAT_AVG) lead to a better model in this case