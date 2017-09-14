## Regression with binary outcomes
## ═════════════════════════════════

## Logistic regression
## ───────────────────────

##   This far we have used the `lm' function to fit our regression models.
##   `lm' is great, but limited–in particular it only fits models for
##   continuous dependent variables. For categorical dependent variables we
##   can use the `glm()' function.

##   For these models we will use a different dataset, drawn from the
##   National Health Interview Survey. From the [CDC website]:

##         The National Health Interview Survey (NHIS) has monitored
##         the health of the nation since 1957. NHIS data on a broad
##         range of health topics are collected through personal
##         household interviews. For over 50 years, the U.S. Census
##         Bureau has been the data collection agent for the National
##         Health Interview Survey. Survey results have been
##         instrumental in providing data to track health status,
##         health care access, and progress toward achieving national
##         health objectives.

##   Load the National Health Interview Survey data:

NH11 <- readRDS("dataSets/NatHealth2011.rds")
labs <- attributes(NH11)$labels

##   [CDC website] http://www.cdc.gov/nchs/nhis.htm

## Logistic regression example
## ───────────────────────────────

##   Let's predict the probability of being diagnosed with hypertension
##   based on age, sex, sleep, and bmi

str(NH11$hypev) # check stucture of hypev
levels(NH11$hypev) # check levels of hypev
# collapse all missing values to NA
NH11$hypev <- factor(NH11$hypev, levels=c("2 No", "1 Yes"))
# run our regression model
hyp.out <- glm(hypev~age_p+sex+sleep+bmi,
              data=NH11, family="binomial")
coef(summary(hyp.out))

## Logistic regression coefficients
## ────────────────────────────────────

##   Generalized linear models use link functions, so raw coefficients are
##   difficult to interpret. For example, the age coefficient of .06 in the
##   previous model tells us that for every one unit increase in age, the
##   log odds of hypertension diagnosis increases by 0.06. Since most of us
##   are not used to thinking in log odds this is not too helpful!

##   One solution is to transform the coefficients to make them easier to
##   interpret

hyp.out.tab <- coef(summary(hyp.out))
hyp.out.tab[, "Estimate"] <- exp(coef(hyp.out))
hyp.out.tab

## Generating predicted values
## ───────────────────────────────

##   In addition to transforming the log-odds produced by `glm' to odds, we
##   can use the `predict()' function to make direct statements about the
##   predictors in our model. For example, we can ask "How much more likely
##   is a 63 year old female to have hypertension compared to a 33 year old
##   female?".

# Create a dataset with predictors set at desired levels
predDat <- with(NH11,
                expand.grid(age_p = c(33, 63),
                            sex = "2 Female",
                            bmi = mean(bmi, na.rm = TRUE),
                            sleep = mean(sleep, na.rm = TRUE)))
# predict hypertension at those levels
cbind(predDat, predict(hyp.out, type = "response",
                       se.fit = TRUE, interval="confidence",
                       newdata = predDat))

##   This tells us that a 33 year old female has a 13% probability of
##   having been diagnosed with hypertension, while and 63 year old female
##   has a 48% probability of having been diagnosed.

## Packages for  computing and graphing predicted values
## ─────────────────────────────────────────────────────────

##   Instead of doing all this ourselves, we can use the effects package to
##   compute quantities of interest for us (cf. the Zelig package).

library(effects)
plot(allEffects(hyp.out))

## Exercise: logistic regression
## ───────────────────────────────────

##   Use the NH11 data set that we loaded earlier.

##   1. Use glm to conduct a logistic regression to predict ever worked
##      (everwrk) using age (age_p) and marital status (r_maritl).

str(NH11$r_maritl) # check stucture of r_maritl
levels(NH11$r_maritl) # check levels of r_maritl
# remove unknown marital statuses
NH11$r_maritl <- factor(NH11$r_maritl, levels=c("0 Under 14 years", "1 Married - spouse in household", "2 Married - spouse not in household", "3 Married - spouse in household unknown", "4 Widowed", "5 Divorced", "6 Separated", "7 Never married", "8 Living with partner"))
# run regression model
wrk.out <- glm(everwrk~age_p+r_maritl,
              data=NH11, family="binomial")
coef(summary(wrk.out))

##   2. Predict the probability of working for each level of marital
##      status.

# running unique(NH11$r_maritl) shows us that levels 0 and 3 do not show up in the training set
unique(NH11$r_maritl)

[1] 5 Divorced                          7 Never married                    
[3] 4 Widowed                           6 Separated                        
[5] 1 Married - spouse in household     8 Living with partner              
[7] 2 Married - spouse not in household <NA>

# Create a dataset with predictors set at desired levels
# Don't include levels 0 and 3 since they don't show up in training set
predWork <- with(NH11,
                expand.grid(r_maritl = c("1 Married - spouse in household", "2 Married - spouse not in household", "4 Widowed", "5 Divorced", "6 Separated", "7 Never married", "8 Living with partner")))
# Generate random ages
predWork$age_p <- sample(20:70, size=nrow(predWork), replace=TRUE)

# Predict everwrk at those levels
cbind(predWork, predict(wrk.out, type = "response",
                       se.fit = TRUE, interval="confidence",
                       newdata = predWork))

##   Note that the data is not perfectly clean and ready to be modeled. You
##   will need to clean up at least some of the variables before fitting
##   the model.

                             r_maritl age_p       fit      se.fit residual.scale
1     1 Married - spouse in household    56 0.1092924 0.004274518              1
2 2 Married - spouse not in household    40 0.1757061 0.030422248              1
3                           4 Widowed    45 0.2524943 0.014524570              1
4                          5 Divorced    32 0.1068487 0.010400776              1
5                         6 Separated    23 0.2238198 0.025839035              1
6                     7 Never married    70 0.1037322 0.007123714              1
7               8 Living with partner    22 0.1758351 0.018889226              1

# A Married (in-household) 56-year old has a 10.9% chance to have worked
# A Married (not in-household) 40-year old has a 17.6% chance to have worked
# A Widowed 45-year old has a 25.2% chance to have worked
# A Divorced 32-year old has a 10.7% chance to have worked
# A Separated 23-year old has a 22.4% chance to have worked
# A Never married 70-year old has a 10.4% chance to have worked
# A 22-year old Living with partner has a 15.6% chance to have worked