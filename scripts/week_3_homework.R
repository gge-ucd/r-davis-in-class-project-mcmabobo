

##Problem 1 
#Reading data
surveys <- read.csv("data/portal_data_joined.csv")
#list of column names 
colnames(surveys)
#select rows 1 thru 60 and columns 6,9,13
surveys_new <- surveys [1:60, c(6,9,13)]
##converting factor data to character
surveys_new$species_id <- as.character(surveys_new$species_id)
#converting factor data to character 
surveys_new$plot_type <- as.character(surveys_new$plot_type) 
#selecting only the ROWS that have complete cases (no NAs) 
surveys_new <- surveys_new[complete.cases(surveys_new), ]
##CHALLENGE
#selecting just the weights (column 2) that are greater than 150
challenge_base <- surveys_new[(surveys_new[, 2]>150),]
##still copying code because I can't be intuitive yet...

####other notes 
## Create a new data frame called surveys_base with only the species_id, 
#the weight, and the plot_type columns. Have this data frame only be the first 60 rows.
data.frame(df, stringsAsFactors = TRUE)
# Create a, b, c, d variables
df <- data.frame(a,b,c,d)
df <- data.rame(species_id, weights, plot_type)





##loading the tidyverse
install.packages("tidyverse")
##loading the package (tidyverse)
library(tidyverse)
