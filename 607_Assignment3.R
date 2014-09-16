#Question 1

vec.NA.check <- function(input.vec)
{
  sum(is.na(input.vec))
}

vec1a <- c(1,2,3,NA,5,NA,7)
vec1b <- c(NA,NA,3,NA,5,NA,7)
vec1c <- c(NA,NA,NA,NA,NA,NA,NA)
vec1d <- c(1,2,3,4,5,6,7)

vec.NA.check(vec1a)
vec.NA.check(vec1b)
vec.NA.check(vec1c)
vec.NA.check(vec1d)

#Question 2

df.NA.check <- function(input.df)
{
  ret <- rep(NA, ncol(input.df))
  for(j in 1:ncol(input.df)){
    ret[j] <- vec.NA.check(input.df[,j]) #use function from question 1
    names(ret)[j] <- paste("Col ", j)
  }
  ret
}

df2 <- data.frame(vec1a,vec1b,vec1c,vec1d)
df.NA.check(df2)


#Question 3
# Did not attempt

#Question 4

vec.char.func <- function(input.vec)
{
  lst <- list()
  lst[1] <- (length(unique(input.vec)))
  names(lst)[1] <- "Dist Elements"
  col2 <- table(input.vec)
  lst[2] <- names(col2[col2 == max(col2)])
  names(lst)[2] <- "Most Common"
  lst[3] <- vec.NA.check(input.vec)
  names(lst)[3] <- "Number of NAs"  
  lst
}

char.vec <- c("high", "med", "med", "low", "low", "low", NA, NA)
vec.char.func(char.vec)


#Question 5

vec.bool.func <- function(input.vec)
{
  lst <- list()
  col1 <- table(input.vec)["TRUE"]
  lst[1] <- col1[1]
  names(lst)[1] <- "Num True"
  col2 <- table(input.vec)["FALSE"]
  lst[2] <- col2[1]
  names(lst)[2] <- "Num False"
  total <- length(input.vec)
  total.true <- as.numeric(lst[1])
  lst[3] <- total.true/total
  names(lst)[3] <- "Percent of TRUEs"  
  lst[4] <- vec.NA.check(input.vec)
  names(lst)[4] <- "Number of NAs"  
  lst
}

bool.vec <- c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, NA, NA)
vec.bool.func(bool.vec)

#Question 6
# Did not attempt