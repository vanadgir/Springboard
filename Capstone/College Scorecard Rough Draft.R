library(ggplot2)
library(dplyr)
library(readr)

# path to folder that holds multiple .csv files
folder <- "C:/Users/themi/Documents/Springboard/Foundations of Data Science/project files/"      

# create list of all .csv files in folder
file_list <- list.files(path=folder, pattern="*.csv")

# read in each .csv file in file_list and create a data frame with the same name as the .csv file
for (i in 1:length(file_list)){
  assign(file_list[i], 
  read.csv(paste(folder, file_list[i], sep=''))
)}

# citation:
# http://www.reed.edu/data-at-reed/resources/R/reading_and_writing.html

# add data collection year tag
MERGED1996_97_PP.csv <- MERGED1996_97_PP.csv %>% mutate(DATAYEAR = "1996-'97")
MERGED1997_98_PP.csv <- MERGED1997_98_PP.csv %>% mutate(DATAYEAR = "1997-'98")
MERGED1998_99_PP.csv <- MERGED1998_99_PP.csv %>% mutate(DATAYEAR = "1998-'99")
MERGED1999_00_PP.csv <- MERGED1999_00_PP.csv %>% mutate(DATAYEAR = "1999-'00")
MERGED2000_01_PP.csv <- MERGED2000_01_PP.csv %>% mutate(DATAYEAR = "2000-'01")
MERGED2001_02_PP.csv <- MERGED2001_02_PP.csv %>% mutate(DATAYEAR = "2001-'02")
MERGED2002_03_PP.csv <- MERGED2002_03_PP.csv %>% mutate(DATAYEAR = "2002-'03")
MERGED2003_04_PP.csv <- MERGED2003_04_PP.csv %>% mutate(DATAYEAR = "2003-'04")
MERGED2004_05_PP.csv <- MERGED2004_05_PP.csv %>% mutate(DATAYEAR = "2004-'05")
MERGED2005_06_PP.csv <- MERGED2005_06_PP.csv %>% mutate(DATAYEAR = "2005-'06")
MERGED2006_07_PP.csv <- MERGED2006_07_PP.csv %>% mutate(DATAYEAR = "2006-'07")
MERGED2007_08_PP.csv <- MERGED2007_08_PP.csv %>% mutate(DATAYEAR = "2007-'08")
MERGED2008_09_PP.csv <- MERGED2008_09_PP.csv %>% mutate(DATAYEAR = "2008-'09")
MERGED2009_10_PP.csv <- MERGED2009_10_PP.csv %>% mutate(DATAYEAR = "2009-'10")
MERGED2010_11_PP.csv <- MERGED2010_11_PP.csv %>% mutate(DATAYEAR = "2010-'11")
MERGED2011_12_PP.csv <- MERGED2011_12_PP.csv %>% mutate(DATAYEAR = "2011-'12")
MERGED2012_13_PP.csv <- MERGED2012_13_PP.csv %>% mutate(DATAYEAR = "2012-'13")
MERGED2013_14_PP.csv <- MERGED2013_14_PP.csv %>% mutate(DATAYEAR = "2013-'14")
MERGED2014_15_PP.csv <- MERGED2014_15_PP.csv %>% mutate(DATAYEAR = "2014-'15")

# write new csv with new column
write_csv(MERGED1996_97_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED1996_97_PP.csv", col_names = TRUE)
write_csv(MERGED1997_98_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED1997_98_PP.csv", col_names = TRUE)
write_csv(MERGED1998_99_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED1998_99_PP.csv", col_names = TRUE)
write_csv(MERGED1999_00_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED1999_00_PP.csv", col_names = TRUE)
write_csv(MERGED2000_01_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2000_01_PP.csv", col_names = TRUE)
write_csv(MERGED2001_02_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2001_02_PP.csv", col_names = TRUE)
write_csv(MERGED2002_03_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2002_03_PP.csv", col_names = TRUE)
write_csv(MERGED2003_04_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2003_04_PP.csv", col_names = TRUE)
write_csv(MERGED2004_05_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2004_05_PP.csv", col_names = TRUE)
write_csv(MERGED2005_06_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2005_06_PP.csv", col_names = TRUE)
write_csv(MERGED2006_07_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2006_07_PP.csv", col_names = TRUE)
write_csv(MERGED2007_08_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2007_08_PP.csv", col_names = TRUE)
write_csv(MERGED2008_09_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2008_09_PP.csv", col_names = TRUE)
write_csv(MERGED2009_10_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2009_10_PP.csv", col_names = TRUE)
write_csv(MERGED2010_11_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2010_11_PP.csv", col_names = TRUE)
write_csv(MERGED2011_12_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2011_12_PP.csv", col_names = TRUE)
write_csv(MERGED2012_13_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2012_13_PP.csv", col_names = TRUE)
write_csv(MERGED2013_14_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2013_14_PP.csv", col_names = TRUE)
write_csv(MERGED2014_15_PP.csv, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/MERGED2014_15_PP.csv", col_names = TRUE)

# path to new folder that holds multiple .csv files
data_folder <- "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/"      

# create new list of all .csv files in folder
data_list <- list.files(path=data_folder, pattern="*.csv")

# read in each .csv file in file_list and rbind them into a data frame called data 
data <- 
  do.call("rbind", 
          lapply(data_list, 
                 function(x) 
                 read.csv(paste(data_folder, x, sep=''), 
                 stringsAsFactors = FALSE)))

# make data copy to keep in directory, for quick use during future sessions
write_csv(data, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/fulldata.csv", col_names = TRUE)

# exclude these years for sat_adm_data 
exc_years <- c("1996-'97" "1997-'98" "1998-'99" "1999-'00" "2000-'01")

# make list of data fields to exclude
exfields <- names(data) %in% c("INSTURL", "NPCURL")

# drop fields
data <- data[!exfields]

# make list of data fields to use in mini set
minifields <- names(data) %in% c("UNITID", "OPEID", "OPEID6", "DATAYEAR", "INSTNM", "ALIAS", "CITY", "STABBR", "ZIP", "ACCREDAGENCY", "SCH_DEG", "MAIN", "NUMBRANCH", "PREDDEG", "HIGHDEG", "CONTROL", "ST_FIPS", "REGION", "LATITUDE", "LONGITUDE", "CCUGPROF", "MENONLY", "WOMENONLY", "RELAFFIL", "ADM_RATE", "ADM_RATE_ALL", "SAT_AVG", "SAT_AVG_ALL", "UGDS", "UG", "CURROPER", "COST4_A", "COST4_P", "TUITIONFEE_IN", "TUITIONFEE_OUT", "AVGFACSAL", "PFTFAC", "C150_4", "C150_L4", "C150_4_POOLED", "C150_L4_POOLED", "PCTFLOAN", "UG25ABV", "CDR2", "CDR3", "DEBT_MDN", "GRAD_DEBT_MDN", "LO_INC_DEBT_MDN", "MD_INC_DEBT_MDN", "HI_INC_DEBT_MDN", "MEDIAN_HH_INC", "ICLEVEL")

# make mini data set
minidata <- data[minifields]

# simple plot
ggplot(minidata, aes(x = as.numeric(minidata$SAT_AVG), y = as.numeric(minidata$ADM_RATE))) + geom_point()

# plot faceted data of SAT by ADM RATE by DATAYEAR
ggplot(minidata, aes(x = as.numeric(minidata$SAT_AVG), y = as.numeric(minidata$ADM_RATE), col = minidata$DATAYEAR)) + geom_point(shape = 21) + labs(x = "Avg SAT score", y = "Admission Rate", col = "Data Year") + facet_wrap( ~ minidata$DATAYEAR) + theme(legend.position = "none")



# citation:
# http://www.statmethods.net/management/subset.html