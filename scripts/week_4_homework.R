surveys <- read_csv('data/portal_data_joined.csv')
#subset
surveys %>%
  filter(weight >30 & weight < 60)
#new tibble with max weight + sex
biggest_critters <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(species_id,sex) %>%
  summarise(max_weight = max(weight))
str(biggest_critters)

#explore where NAs are, maybe use tally and arrange
?tally
?arrange

biggest_critters %>% arrange(max_weight)
biggest_critters %>% tally(max_weight)
biggest_critters %>% arrange(desc(max_weight))

surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally() %>% 
  arrange(desc(n))

surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(plot_id) %>% 
  tally() %>% 
  arrange(desc(n))

surveys %>%
  filter (is.na(weight)) %>%
  group_by(year) %>%
  tally () %>%
  arrange (desc(n))

#Take surveys, remove the rows where weight is NA 
#and add a column that contains the average weight of each species+sex combination to the full surveys dataframe. 
#Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight.
#5
surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(avg_weight = mean(weight)) %>% 
  select(species_id, sex, weight, avg_weight)

surveys_avg_weight

#6 
surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)

surveys_avg_weight

  