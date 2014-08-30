# 1.What versions of R and RStudio do you have installed?.
# R: version 3.1.0 (2014-04-10) -- "Spring Dance" 
# RStudio: version 0.98.507

# 2.What version of PostgreSQL do you have installed?.
# PostgreSQL: version 9.3.5

# 3.Install and load the R package DMwR. Load the data set sales and determine the number of observations contained in the data set. (In RStudio, this is easy to determine.).
require(DMwR)
NumOfObs <- data.frame(sales)
head(NumOfObs)
nrow(NumOfObs)
# Number of observations in the sales dataset: 401,146
# The number of observations can also be seen in the Environment window