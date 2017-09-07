# assuming a new session
library(ggplot2)
library(readr)

# only import this if needed (so almost never)
fulldata <- read_csv("~/Springboard/Foundations of Data Science/data/fulldata.csv")

# import these as needed for plots
minidata <- read_csv("~/Springboard/Foundations of Data Science/data/minidata.csv")
sat_adm_data <- read_csv("~/Springboard/Foundations of Data Science/data/sat_adm_data.csv")
sat_adm_data_high <- read_csv("~/Springboard/Foundations of Data Science/data/sat_adm_data_high.csv")
sat_adm_data_US <- read_csv("~/Springboard/Foundations of Data Science/data/sat_adm_data_US.csv")
sat_adm_data_US_high <- read_csv("~/Springboard/Foundations of Data Science/data/sat_adm_data_US_high.csv")
majors_data_raw <- read_csv("~/Springboard/Foundations of Data Science/data/majors_data_raw.csv")
majors_data <- read_csv("~/Springboard/Foundations of Data Science/data/majors_data.csv")
cost_data_raw <- read_csv("~/Springboard/Foundations of Data Science/data/cost_data_raw.csv")
 
# plot SAT by ADM RATE coloured by REGION faceted by DATAYEAR
ggplot(sat_adm_data_US, 
       aes(x = as.numeric(sat_adm_data_US$SAT_AVG), 
           y = as.numeric(sat_adm_data_US$ADM_RATE), 
           col = factor(sat_adm_data_US$STABBR))) + 
  geom_point(alpha = 0.5, size = 1.25) + 
  labs(x = "Avg SAT score", y = "Admission Rate", 
       title = "Fig. 1.1: Admission Rate by Avg. SAT Score") + 
  facet_wrap( ~ sat_adm_data_US$DATAYEAR) + 
  scale_colour_discrete(h = c(0, 270)) +
  theme(legend.position = "none", 
        panel.border = element_rect(linetype = "solid", fill = "NA"),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(size = 8, colour = "white")) +
  geom_jitter()
  
# plot bottom right filter for closer look
ggplot(sat_adm_data_US_high, 
       aes(x = sat_adm_data_US_high$SAT_AVG, 
           y = sat_adm_data_US_high$ADM_RATE, 
           col = factor(sat_adm_data_US_high$STABBR))) + 
    geom_point(size = 1.5) +
	labs(x = "Avg SAT score", y = "Admission Rate", 
		title = "Fig. 1.2: Admission Rate by Avg. SAT Score") + 
    facet_wrap( ~ sat_adm_data_US_high$DATAYEAR) + 
	theme(legend.position = "none", 
		panel.grid.major = element_line(colour = "grey"), 
		panel.border = element_rect(linetype = "solid", fill = "NA"),
		strip.background = element_rect(fill = "black"),
        strip.text = element_text(size = 8, colour = "white")) 
		
ggplot(sat_adm_data_US_high, 
       aes(x = sat_adm_data_US_high$SAT_AVG, 
           y = sat_adm_data_US_high$ADM_RATE, 
           col = factor(sat_adm_data_US_high$STABBR))) + 
	theme(legend.position = "bottom") 


# % of MATH degrees awarded by STATE over TIME
ggplot(majors_data_US, 
       aes(x = majors_data_US$DATAYEAR, 
           y = majors_data_US$PCIP27_AVG, 
           col = majors_data_US$DATAYEAR)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Academic Year (1996-'97 to 2014-'15)",
       y = "Avg % of Math Degrees Awarded",
       title = "Fig. 2.1: % of Maths Degrees Awarded by State") + 
  facet_wrap( ~ STABBR) + 
  scale_colour_discrete(name = "DataYear") +
  theme(legend.position = "none", 
        panel.border = element_rect(linetype = "solid", fill = "NA"),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(size = 8, colour = "white"),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())
  
# % of HISTORY degrees awared by STATE over TIME
ggplot(majors_data_US, 
       aes(x = majors_data_US$DATAYEAR, 
           y = majors_data_US$PCIP54_AVG, 
           col = majors_data_US$DATAYEAR)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Academic Year (1996-'97 to 2014-'15)",
       y = "Avg % of History Degrees Awarded",
       title = "Fig. 2.2: % of History Degrees Awarded by State") + 
  facet_wrap( ~ STABBR) + 
  scale_colour_discrete(name = "DataYear") +
  theme(legend.position = "none", 
        panel.border = element_rect(linetype = "solid", fill = "NA"),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(size = 8, colour = "white"),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())
		
# changes in DEGREES awarded for all majors for a specific STATE over TIME
ggplot(majors_data_MA, 
       aes(x = majors_data_MA$variable, 
           y = majors_data_MA$value, 
           colour = factor(majors_data_MA$DATAYEAR))) + 
    geom_bar(stat = "identity") +  
	labs(x = "Major",
		 y = "Avg Number of Degrees Awarded",
		 title = element_text("Massachusetts")) + 
    theme(legend.position = "none",         
		panel.border = element_rect(linetype = "solid", fill = "NA"),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(size = 8, colour = "black")) + 
		coord_cartesian(ylim=c(0, 18000))
