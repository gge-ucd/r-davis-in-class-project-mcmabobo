##homework week 9

mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

library(tidyverse)
library(lubridate)

#remove NAs
mloa2 = mloa %>%
  filter(rel_humid != -99) %>%
  filter(temp_C_2m != -999.9) %>%
  filter(windSpeed_m_s != -999.9) %>%
  #time in UTC
  mutate(datetime = ymd_hm(paste0(year,"-", 
                                  month, "-", 
                                  day," ", 
                                  hour24, ":", 
                                  min), 
                           tz = "UTC")) %>%
  #localtime 
  mutate(datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"))
#aggregate and plot
mloa2 %>%
  mutate(localMon = month(datetimeLocal, label = TRUE),
         localHour = hour(datetimeLocal)) %>%
  #group by localmon and localhr 
  group_by(localMon, localHour) %>%  
  #calculate mean temp. 
  summarize(meantemp = mean(temp_C_2m)) %>%  
  #use ggplot to plot localMon by mean temp.
  ggplot(aes(x = localMon,
             y = meantemp)) +
  #geom point for coloring local hr 
  geom_point(aes(col = localHour)) +  
  #use color ramp?
  scale_color_viridis_c() +  
  #label axes and add theme 
  xlab("Month") +
  ylab("Mean Temperature (degrees C)") +
  theme_classic()  
