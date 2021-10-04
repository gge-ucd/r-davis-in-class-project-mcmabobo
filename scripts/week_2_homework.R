set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
##problem 1
#removing the NAs
prob1 <- hw2[!is.na(hw2)] 
#only selecting numbers between 14 and 38
prob1 <- prob1[prob1 >14 & prob1 < 38] 
##problem 2
#multiplying by 3
times3 <- prob1 * 3 
#adding 10 to the whole vector 
plus10 <- times3 + 10 
##problem 3
#selecting every other number using logical subsetting
final <- plus10[c(TRUE, FALSE)] 

