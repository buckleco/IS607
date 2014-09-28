#IS 607 - Assignment 5

###########################################################################
#Question 1
###########################################################################
#What is total number of yes votes by city
#What is total number of yes votes by age group
#What is total number of votes by city

###########################################################################
#Question 2
###########################################################################
#create an R data frame with 2 observations
#firstly create 5 vectors
dir.vec1 <- c("yes", "no")
ed.vec1 <- c(80100, 35900)
ed.vec2 <- c(143000, 214800)
gl.vec1 <- c(99400, 43000)
gl.vec2 <- c(150400, 207000)
#put the vectors in a named data frame
assign5.df <- data.frame("votedir" = dir.vec1, "e1624" = ed.vec1,"e25up" = ed.vec2,"g1624" = gl.vec1,"g25up" = gl.vec2)
#print the data frame contents to the console
assign5.df

###########################################################################
#Question 3
###########################################################################
require(tidyr)
require(dplyr)

assign5.tidy.df <- assign5.df %>%
  #set key, votecount and the cols to be gathered
  gather(key, votecount, e1624:g25up) %>%
  #split the key column into two columns based on the values in the key column
  separate(key, c("city", "agegroup"), 1) 
#print the contents of the tidy data frame to the console
assign5.tidy.df

###########################################################################
#Question 4
###########################################################################
require(plyr)

#sum of yes votes by city
#assign5.tidy.df
q1 <- function(data)
{
  sum(data$votecount[which(data$votedir == "yes")])  
}
q1ans <- ddply(assign5.tidy.df, .variables = "city", .fun = q1)
q1ans

#sum of yes votes by age group
#assign5.tidy.df
q2 <- function(data)
{
  sum(data$votecount[which(data$votedir == "yes")])  
}
q2ans <- ddply(assign5.tidy.df, .variables = "agegroup", .fun = q2)
q2ans

#sum of total votes by city
#assign5.tidy.df
q3 <- function(data)
{
  sum(data$votecount)  
}
q3ans <- ddply(assign5.tidy.df, .variables = "city", .fun = q3)
q3ans

###########################################################################
#Question 5
###########################################################################
#I'm assuming that restructuring the data frame refers to the original data frame 
#provided by the assignment. Yes, I would restructure this by creating variables 
#out of the cities, age groups and vote direction. This would make further 
#analysis much easier. This would also allow easier calculation for answering 
#questions such as, what is the percentage of yes/no votes, which could be further 
#broken down by city and age group.