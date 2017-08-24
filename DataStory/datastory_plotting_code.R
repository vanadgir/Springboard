# assuming a new session
library(ggplot2)
library(readr)

# only import this if needed (so almost never)
fulldata <- read_csv("~/Springboard/Foundations of Data Science/data/fulldata.csv")

# import these as needed for plots
sat_adm_data <- read_csv("~/Springboard/Foundations of Data Science/data/sat_adm_data.csv")
sat_adm_data_high <- read_csv("~/Springboard/Foundations of Data Science/data/sat_adm_data_high.csv")
majors_data_raw <- read_csv("~/Springboard/Foundations of Data Science/data/majors_data_raw.csv")
majors_data <- read_csv("~/Springboard/Foundations of Data Science/data/majors_data.csv")
cost_data_raw <- read_csv("~/Springboard/Foundations of Data Science/data/cost_data_raw.csv")
minidata <- read_csv("~/Springboard/Foundations of Data Science/data/minidata.csv")

 
# plot SAT by ADM RATE coloured by REGION faceted by DATAYEAR
ggplot(sat_adm_data, 
       aes(x = as.numeric(sat_adm_data$SAT_AVG), 
           y = as.numeric(sat_adm_data$ADM_RATE), 
           col = factor(sat_adm_data$STABBR))) + 
  geom_point(alpha = 0.5, size = 1.25) + 
  labs(x = "Avg SAT score", 
       y = "Admission Rate") + 
  facet_wrap( ~ sat_adm_data$DATAYEAR) + 
  scale_colour_discrete(name = "State/Territory", h = c(0, 270)) +
  theme(legend.position = "none", 
        panel.border = element_rect(linetype = "solid", 
                                    fill = "NA"),
        strip.background = element_rect(fill = "black"),
        strip.text = element_text(size = 8, colour = "white")) +
  geom_jitter()
  
# plot bottom right filter for closer look
ggplot(sat_adm_data_high, 
       aes(x = as.numeric(sat_adm_data_high$SAT_AVG), 
           y = as.numeric(sat_adm_data_high$ADM_RATE), 
           col = factor(sat_adm_data_high$STABBR), 
           label = sat_adm_data_high$STABBR)) +
    labs(x = "Avg SAT score", 
         y = "Admission Rate") + 
    facet_wrap( ~ sat_adm_data_high$DATAYEAR) + 
    scale_colour_discrete(name = "State/Territory", h = c(0, 270)) +
    theme(legend.position = "none", 
          panel.grid.major = element_line(colour = "grey"), 
          panel.border = element_rect(linetype = "solid", 
                                      fill = "NA"),
          strip.background = element_rect(fill = "black"),
          strip.text = element_text(size = 8, colour = "white")) +
    geom_jitter() + 
    coord_cartesian(xlim=c(1250, 1600)) + 
    geom_label(size = 3, alpha = 0.5)


# % of MATH degrees awarded by STATE over TIME
ggplot(majors_data, 
       aes(x = majors_data$DATAYEAR, 
           y = majors_data$PCIP27_AVG, 
           col = majors_data$DATAYEAR)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Academic Year",
       y = "Avg % of Math Degrees Awarded") + 
  facet_wrap( ~ STABBR) + 
  scale_colour_discrete(name = "DataYear (1996-'97 to 2014-'15)") +
  theme(legend.position = "none", 
        panel.border = element_rect(linetype = "solid", 
                                    fill = "NA"),
        strip.background = element_rect(colour = "black"),
        strip.text = element_text(size = 8, colour = "white"))
  
# % of HISTORY degrees awared by STATE over TIME
ggplot(majors_data, 
       aes(x = majors_data$DATAYEAR, 
           y = majors_data$PCIP54_AVG, 
           col = majors_data$DATAYEAR)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Academic Year",
       y = "Avg % of History Degrees Awarded") + 
  facet_wrap( ~ STABBR) + 
  scale_colour_discrete(name = "DataYear (1996-'97 to 2014-'15)") +
  theme(legend.position = "none", 
        panel.border = element_rect(linetype = "solid", 
                                    fill = "NA"),
        strip.background = element_rect(colour = "black"),
        strip.text = element_text(size = 8, colour = "white"))
