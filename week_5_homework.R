 library(tidyverse)
surveys <- read_csv('data/portal_data_joined.csv')
##1
#name column surveys wide 
# column for genus and a column named after every plot type(filter then group by function)
#each of these columns containing the mean hindfoot length of animals in that plot type and genus
#every row has a genus and then a mean hindfoot length value for every plot type (summarise for mean)
#The dataframe should be sorted by values in the Control plot type column. 

surveys_wide <- surveys %>%
  filter(!is.na(hindfoot_length)) %>%
  group_by(genus, plot_type) %>%
  summarise(mean_hindfoot = mean(hindfoot_length)) %>%
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% 
  arrange(Control)
  
str(surveys_wide)
##2
#Using the original surveys dataframe, use the two different functions we laid out for conditional statements, 
#ifelse() and case_when(), to calculate a new weight category variable called weight_cat. 
#For this variable, define the rodent weight into three categories, 
#where “small” is less than or equal to the 1st quartile of weight distribution, 
#“medium” is between (but not inclusive) the 1st and 3rd quartile, and 
#“large” is any weight greater than or equal to the 3rd quartile. (Hint: the summary() function on a column summarizes the distribution).

#summarise distribution
summary(surveys$weight)
?case_when

surveys %>%
  mutate(weight_cat = case_when(
    weight >=20.00 ~ "small",
    weight >20.00 & weight < 48.00 ~ "medium",
    weight >=48.00 ~ "large")
  )

# For ifelse() and case_when(), compare what happens to the weight values of NA, depending on how you specify your arguments.
?ifelse
surveys %>% 
  mutate(weight_cat = ifelse(weight >= 20.00, "small",
                             ifelse(weight > 20.00 & weight < 48.00, "medium","large")))
#bonus
summ <- summary(surveys$weight)
summ[[7]]
summ[[3]]
summ[[10]]
summ[[2]]
summ[[5]]

surveys %>% 
  mutate(weight_cat = case_when(
    weight >= summ[[2]] ~ "small",
    weight > summ[[2]] & weight < summ[[5]] ~ "medium",
    weight >= summ[[5]] ~ "large"
  ))
