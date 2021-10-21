### Homework review
## 
library (tidyverse)

surveys <- read.csv('data/portal_data_joined.csv')
##selecting columns with tidyverse
surveys_base <- select(surveys, species_id, weight, plot_type)
str(surveys_base)
#or in base R
surveys_base <- surveys[c('species_id', 'weight', 'plot_type')]
#or piping %>% 
surveys_base <- surveys %>% select(species_id, weight, plot_type)
#only the first 60 rows
##nesting 
surveys_base <- head(x = surveys_base, 60)
surveys_base <- surveys[c(1:60), c(6,9,13)]
surveys_base %>% str()
#convert both species_id and plot_type to factors
surveys_base$specied_id <- as.factor(surveys_base$species_id)
# remove all rows with NA
#na.omit drops all NAs
##what not to do....
surveys_base_nonas <- na.omit(surveys_base)
surveys_base_nonas <- na.omit(surveys_base$weight)
surveys_base$weight

is.na(surveys_base$weight)
#! not function, flips it 
!is.na(surveys_base$weight)

##serves whole data set in to omit function then your weight column
surveys_base %>% na.omit(surveys_base$weight)
#same as
na.omit(surveys_base,surverys_base$weight)

surveys_base [is.na(surveys_base$weight),]
#
surveys_base [!is.na(surveys_base$weight),]
complete.cases (surveys_base)
# [rows,columns]
challenge_base <- surveys_new[(surveys_new[, 2]>150),]
challenge_base <- surveys_base[which(surveys_base$weight>150),]
which(surveys_base$weight>150)
surveys_base$weight >150
na.omit(surveys_base,surverys_base$weight)

### In class lecture
surveys <- read.csv('data/portal_data_joined.csv')
# 1. keep observations before 1995
surveys_base<- filter(surveys, surveys$year < 1995)
# 2.  keep year, sex, and weight
surveys_base <- select(surveys_base, year, sex, weight)
str(surveys_base)
#use piping 
surveys_challenge <- surveys %>%
filter(surveys, year < 1995) %>%
select(year,sex, weight)

surveys_base <- filter(surveys,year<1995) %>% select(year,sex, weight)
surveys_base <- surveys %>% filter(year<1995) %>% select(year,sex,weight)

##challenge: create new data frame 
#mutate is used to make a new column, changes the values of an existing column, 
#select
#mutate
# filter then !

surveys$hindfoot_length 
surveys_hindfoot_half <- surveys %>%
  filter(!is.na(hindfoot_length)) %>% 
  mutate(hindfoot_half = hindfoot_length/2)  %>% 
  select(species_id, hindfoot_half) %>%
  filter(hindfoot_half < 30)

str(surveys_hindfoot_half)
#use group_by() and summarize ()

surveys_hindfoot_half %>% group_by (species_id) %>% 
  filter(!is.na (hindfoot_length)) %>%
  summarize(avg_length = mean(hindfoot_length), min(hindfoot_length), max(hindfoot_length)) 

#using species_id 
  
  
  
  