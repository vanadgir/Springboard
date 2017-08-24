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
				 
# citation:
# http://www.reed.edu/data-at-reed/resources/R/reading_and_writing.html

				 
# make data copy to keep in directory, for quick use during future sessions
write_csv(data, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/fulldata.csv", col_names = TRUE)

# start a new session and load in fulldata
fulldata <- read_csv("~/Springboard/Foundations of Data Science/data/fulldata.csv")

# How To Break Up The Data:
# Data Needed for Plotting
# 1. prepare data for SAT by ADM
sat_adm_data <- filter(minidata, DATAYEAR %in% c("2001-'02", "2002-'03", "2003-'04", "2004-'05", "2005-'06", "2006-'07", "2007-'08", "2008-'09", "2009-'10", "2010-'11", "2011-'12", "2012-'13", "2013-'14", "2014-'15"))
sat_adm_data <- select(sat_adm_data, one_of(c("INSTNM", "REGION", "DATAYEAR", "SAT_AVG", "ADM_RATE")))
write_csv(sat_adm_data, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/sat_adm_data.csv", col_names = TRUE)

# filter to bottom right of plot, for closer look to see which states/schools are there
sat_adm_data_high <- filter(sat_adm_data, sat_adm_data$SAT_AVG > 1250, sat_adm_data$ADM_RATE < 0.25)


# 2. prepare data for PCIP## (major) by STABBR
majors_fields <- names(fulldata) %in% c("UNITID", "OPEID", "OPEID6", "INSTNM", "REGION", "STABBR", "PREDDEG", "SCH_DEG", "PCIP01", "PCIP03", "PCIP04", "PCIP05", "PCIP09", "PCIP10", "PCIP11", "PCIP12", "PCIP13", "PCIP14", "PCIP15", "PCIP16", "PCIP19", "PCIP22", "PCIP23", "PCIP24", "PCIP25", "PCIP26", "PCIP27", "PCIP29", "PCIP30", "PCIP31", "PCIP38", "PCIP39", "PCIP40", "PCIP41", "PCIP42", "PCIP43", "PCIP44", "PCIP45", "PCIP46", "PCIP47", "PCIP48", "PCIP49", "PCIP50", "PCIP51", "PCIP52", "PCIP54", "UG", "UGDS", "CURROPER", "ICLEVEL", "DATAYEAR")
majors_data_raw <- fulldata[majors_fields]
write_csv(majors_data_raw, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/majors_data_raw.csv", col_names = TRUE)

# remove UG data field
majors_data_clean <- select(majors_data_clean, -UG)
# remove UGDS that are not recorded
majors_data_clean <- filter(majors_data_clean, UGDS != "NULL")
# remove less than 2-year schools (ICLEVEL = 3)
majors_data_clean <- filter(majors_data_clean, ICLEVEL != 3)
# remove PREDDEG = 0 (not classified)
majors_data_clean <- filter(majors_data_clean, PREDDEG != 0)
# make UG_approx column
majors_data_clean <- mutate(majors_data_clean, UG_approx = UGDS*0.25)
		
pcip_fields <- c("PCIP01", "PCIP03", "PCIP04", "PCIP05", "PCIP09", "PCIP10", "PCIP11", "PCIP12", "PCIP13", "PCIP14", "PCIP15", "PCIP16", "PCIP19", "PCIP22", "PCIP23", "PCIP24", "PCIP25", "PCIP26", "PCIP27", "PCIP29", "PCIP30", "PCIP31", "PCIP38", "PCIP39", "PCIP40", "PCIP41", "PCIP42", "PCIP43", "PCIP44", "PCIP45", "PCIP46", "PCIP47", "PCIP48", "PCIP49", "PCIP50", "PCIP51", "PCIP52", "PCIP54")

# get approx degrees column (figure out how to loop this, for now its hard-coded)
majors_data_clean$PCIP01_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP01)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP03_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP03)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP04_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP04)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP05_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP05)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP09_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP09)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP10_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP10)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP11_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP11)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP12_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP12)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP13_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP13)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP14_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP14)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP15_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP15)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP16_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP16)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP19_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP19)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP22_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP22)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP23_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP23)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP24_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP24)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP25_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP25)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP26_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP26)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP27_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP27)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP29_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP29)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP30_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP30)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP31_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP31)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP38_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP38)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP39_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP39)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP40_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP40)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP41_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP41)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP42_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP42)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP43_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP43)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP44_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP44)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP45_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP45)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP46_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP46)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP47_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP47)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP48_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP48)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP49_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP49)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP50_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP50)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP51_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP51)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP52_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP52)*as.numeric(majors_data_clean$UG_approx))
majors_data_clean$PCIP54_degrees <- with(majors_data_clean, as.numeric(majors_data_clean$PCIP54)*as.numeric(majors_data_clean$UG_approx))


majors_data <- sqldf("SELECT STABBR, DATAYEAR, sum(UGDS) as UGDS, sum(UG_approx) as UG_approx, sum(PCIP01_degrees) as PCIP01_degrees, sum(PCIP03_degrees) as PCIP03_degrees, sum(PCIP04_degrees) as PCIP04_degrees, sum(PCIP05_degrees) as PCIP05_degrees, sum(PCIP09_degrees) as PCIP09_degrees, sum(PCIP10_degrees) as PCIP10_degrees, sum(PCIP11_degrees) as PCIP11_degrees, sum(PCIP12_degrees) as PCIP12_degrees, sum(PCIP13_degrees) as PCIP13_degrees, sum(PCIP14_degrees) as PCIP14_degrees, sum(PCIP15_degrees) as PCIP15_degrees, sum(PCIP16_degrees) as PCIP16_degrees, sum(PCIP19_degrees) as PCIP19_degrees, sum(PCIP22_degrees) as PCIP22_degrees, sum(PCIP23_degrees) as PCIP23_degrees, sum(PCIP24_degrees) as PCIP24_degrees, sum(PCIP25_degrees) as PCIP25_degrees, sum(PCIP26_degrees) as PCIP26_degrees, sum(PCIP27_degrees) as PCIP27_degrees, sum(PCIP29_degrees) as PCIP29_degrees, sum(PCIP30_degrees) as PCIP30_degrees, sum(PCIP31_degrees) as PCIP31_degrees, sum(PCIP38_degrees) as PCIP38_degrees, sum(PCIP39_degrees) as PCIP39_degrees, sum(PCIP40_degrees) as PCIP40_degrees, sum(PCIP41_degrees) as PCIP41_degrees, sum(PCIP42_degrees) as PCIP42_degrees, sum(PCIP43_degrees) as PCIP43_degrees, sum(PCIP44_degrees) as PCIP44_degrees, sum(PCIP45_degrees) as PCIP45_degrees, sum(PCIP46_degrees) as PCIP46_degrees, sum(PCIP47_degrees) as PCIP47_degrees, sum(PCIP48_degrees) as PCIP48_degrees, sum(PCIP49_degrees) as PCIP49_degrees, sum(PCIP50_degrees) as PCIP50_degrees, sum(PCIP51_degrees) as PCIP51_degrees, sum(PCIP52_degrees) as PCIP52_degrees, sum(PCIP54_degrees) as PCIP54_degrees from majors_data_clean GROUP BY STABBR, DATAYEAR")

majors_data$PCIP01_AVG <- with(majors_data, ((majors_data$PCIP01_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP03_AVG <- with(majors_data, ((majors_data$PCIP03_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP04_AVG <- with(majors_data, ((majors_data$PCIP04_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP05_AVG <- with(majors_data, ((majors_data$PCIP05_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP09_AVG <- with(majors_data, ((majors_data$PCIP09_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP10_AVG <- with(majors_data, ((majors_data$PCIP10_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP11_AVG <- with(majors_data, ((majors_data$PCIP11_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP12_AVG <- with(majors_data, ((majors_data$PCIP12_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP13_AVG <- with(majors_data, ((majors_data$PCIP13_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP14_AVG <- with(majors_data, ((majors_data$PCIP14_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP15_AVG <- with(majors_data, ((majors_data$PCIP15_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP16_AVG <- with(majors_data, ((majors_data$PCIP16_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP19_AVG <- with(majors_data, ((majors_data$PCIP19_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP22_AVG <- with(majors_data, ((majors_data$PCIP22_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP23_AVG <- with(majors_data, ((majors_data$PCIP23_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP24_AVG <- with(majors_data, ((majors_data$PCIP24_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP25_AVG <- with(majors_data, ((majors_data$PCIP25_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP26_AVG <- with(majors_data, ((majors_data$PCIP26_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP27_AVG <- with(majors_data, ((majors_data$PCIP27_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP29_AVG <- with(majors_data, ((majors_data$PCIP29_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP30_AVG <- with(majors_data, ((majors_data$PCIP30_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP31_AVG <- with(majors_data, ((majors_data$PCIP31_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP38_AVG <- with(majors_data, ((majors_data$PCIP38_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP39_AVG <- with(majors_data, ((majors_data$PCIP39_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP40_AVG <- with(majors_data, ((majors_data$PCIP40_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP41_AVG <- with(majors_data, ((majors_data$PCIP41_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP42_AVG <- with(majors_data, ((majors_data$PCIP42_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP43_AVG <- with(majors_data, ((majors_data$PCIP43_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP44_AVG <- with(majors_data, ((majors_data$PCIP44_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP45_AVG <- with(majors_data, ((majors_data$PCIP45_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP46_AVG <- with(majors_data, ((majors_data$PCIP46_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP47_AVG <- with(majors_data, ((majors_data$PCIP47_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP48_AVG <- with(majors_data, ((majors_data$PCIP48_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP49_AVG <- with(majors_data, ((majors_data$PCIP49_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP50_AVG <- with(majors_data, ((majors_data$PCIP50_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP51_AVG <- with(majors_data, ((majors_data$PCIP51_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP52_AVG <- with(majors_data, ((majors_data$PCIP52_degrees)/(majors_data$UG_approx))*100)
majors_data$PCIP54_AVG <- with(majors_data, ((majors_data$PCIP54_degrees)/(majors_data$UG_approx))*100)

# save this current state of majors data
write_csv(majors_data, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/majors_data.csv", col_names = TRUE)


# to load up majors data frames again
majors_data <- read_csv("~/Springboard/Foundations of Data Science/data/majors_data.csv")
pcip_data <- select(majors_data, starts_with("PCIP"))
pcip_data_small <- select(pcip_data, c(PCIP09_AVG, PCIP13_AVG, PCIP14_AVG, PCIP26_AVG, PCIP27_AVG, PCIP38_AVG, PCIP40_AVG, PCIP42_AVG, PCIP45_AVG, PCIP47_AVG, PCIP50_AVG, PCIP52_AVG, PCIP54_AVG))
majors_data_small <- select(majors_data, c(STABBR, DATAYEAR, PCIP09_AVG, PCIP13_AVG, PCIP14_AVG, PCIP26_AVG, PCIP27_AVG, PCIP38_AVG, PCIP40_AVG, PCIP42_AVG, PCIP45_AVG, PCIP47_AVG, PCIP50_AVG, PCIP52_AVG, PCIP54_AVG))	

	
# 3. COSTT4_A (cost for Title IV aid students) by NUM4_PUB (Title IV students total) and NUM##PUB and NUM##PRIV (breakdown of household income)
# COSTT4_P by NUM4_PRIV and NUM##PROG  	
cost_fields <- names(fulldata) %in% c("UNITID", "OPEID", "OPEID6", "INSTNM", "COSTT4_A", "COSTT4_P", "NUM4_PUB", "NUM4_PRIV", "NUM4_PROG", "NUM41_PUB", "NUM42_PUB", "NUM43_PUB", "NUM44_PUB", "NUM45_PUB", "NUM41_PRIV", "NUM42_PRIV", "NUM43_PRIV", "NUM44_PRIV", "NUM45_PRIV", "NUM41_PROG", "NUM42_PROG", "NUM43_PROG", "NUM44_PROG", "NUM45_PROG", "DATAYEAR")
cost_data_raw <- fulldata[cost_fields]
write_csv(cost_data_raw, path = "C:/Users/themi/Documents/Springboard/Foundations of Data Science/data/cost_data_raw.csv", col_names = TRUE)

