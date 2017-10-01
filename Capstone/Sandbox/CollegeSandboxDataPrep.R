## Shiny App Notes

# load subdata 
subdata_US <- read_csv("data/subdata_US.csv")

fields <- c("OPEID6", "INSTNM", "CITY", "STABBR", "DATAYEAR", "CONTROL", "LOCALE", "PREDDEG", "HIGHDEG", "REGION", "ADM_RATE", "SAT_AVG", "UGDS", "AGE_ENTRY", "COSTT4_A", "COSTT4_P", "AVGFACSAL", "DEBT_MDN", "FAMINC")

quikdata <- data[fields]

# change labeling of years
quikdata$DATAYEAR <- factor(quikdata$DATAYEAR, labels = c("1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014"))

# add index column
quikdata <- data.table(quikdata, keep.rownames = TRUE)
quikdata <- rename(quikdata, INDEX = rn)


# fix data types
quikdata$STABBR <- factor(quikdata$STABBR)
quikdata$DATAYEAR <- factor(quikdata$DATAYEAR)
quikdata$CONTROL <- factor(quikdata$CONTROL, labels = c("Public", "Private Nonprofit", "Private For-Profit"))
quikdata$LOCALE <- factor(quikdata$LOCALE, labels = c("City: Large", "City: Midsize", "City: Small", "Suburb: Large", "Suburb: Midsize", "Suburb: Small", "Town: Fringe", "Town: Distant", "Town: Remote", "Rural: Fringe", "Rural: Distant", "Rural: Remote", "Not Classified"))
quikdata$PREDDEG <- factor(quikdata$PREDDEG, labels = c("Not classified", "Certificate", "Associate's", "Bachelor's", "Graduate"))
quikdata$HIGHDEG <- factor(quikdata$HIGHDEG, labels = c("Not classified", "Certificate", "Associate's", "Bachelor's", "Graduate"))
quikdata$REGION <- factor(quikdata$REGION, labels = c("U.S. Service Schools", "New England", "Mid East", "Great Lakes", "Plains", "Southeast", "Southwest", "Rocky Mountains", "Far West"))

quikdata$ADM_RATE <- as.numeric(quikdata$ADM_RATE)
quikdata$SAT_AVG <- as.numeric(quikdata$SAT_AVG)
quikdata$UGDS <- as.numeric(quikdata$UGDS)
quikdata$AGE_ENTRY <- as.numeric(quikdata$AGE_ENTRY)
quikdata$COSTT4_A <- as.numeric(quikdata$COSTT4_A)
quikdata$COSTT4_P <- as.numeric(quikdata$COSTT4_P)
quikdata$AVGFACSAL <- as.numeric(quikdata$AVGFACSAL)
quikdata$DEBT_MDN <- as.numeric(quikdata$DEBT_MDN)
quikdata$FAMINC <- as.numeric(quikdata$FAMINC)

# remove outliers (generally online campuses)
quikdata <- filter(quikdata, UGDS < 75000)


write_csv(quikdata, "quikdata.csv")
quikdata <- read_csv("quikdata.csv")