# Question 1
mean.calc <- function(input)
{
  mean(input)
}
numvec1 <- c(1,3,555,6,777,8,9,22,33,4444,5,66,777,88,99)
mean.calc(numvec1)

# Question 2
mean.calc <- function(input)
{
  mean(input, na.rm=TRUE)
}
numvec2 <- c(1,NA,555,NA,777,8,9,22,33,4444,5,66,777,88,99)
mean.calc(numvec2)

# Question 3
gcd.calc <- function(input1,input2)
{
  if(input1 > 0 && input2 > 0){
    factors1 <- seq_len(input1)
    factors2 <- seq_len(input2)
    max(intersect(factors1[(input1 %% factors1) == 0], factors2[(input2 %% factors2) == 0]))
  } else {
    print("Please enter parameters greater than zero.")
  }
}
gcd.calc(48,36)
gcd.calc(44,18)
gcd.calc(0,4)
gcd.calc(110,66)

# Question 4
# 1.Divide input1 by input2 and let r be the remainder.
# 2.If r is 0, input2 is the answer; if r is not 0, continue to step 3.
# 3.Set input1 = input2 and input2 = r. Go back to step 1.
# Source: http://codereview.stackexchange.com/questions/37189/euclids-algorithm-greatest-common-divisor

gcd.euc.calc <- function(input1,input2)
{
  if(input1 > 0 && input2 > 0){
    if(input1 < input2){ #swap the variables if necessary
      input1 <- input1 + input2
      input2 <- input1 - input2
      input1 <- input1 - input2
    }
    r.zero <- FALSE
    while (r.zero != TRUE){
      r <- input1 %% input2
      if(r == 0){
        r.zero <- TRUE
        input2
      } else{
        input1 <- input2
        input2 <- r
      }
    }
    return(input2)
  } else {
    print ("Please enter parameters greater than zero.")
  }
}
gcd.euc.calc(48,36)
gcd.euc.calc(44,18)
gcd.euc.calc(0,4)
gcd.euc.calc(110,66)
gcd.euc.calc(36,48)

# Question 5
xy.calc <- function(input1,input2)
{
  ((input1 * input1) * input2) + (2 * input1 * input2) - (input1 * (input2 * input2))
}
xy.calc(40,5)
xy.calc(3,5)
xy.calc(40,40)
xy.calc(14,9)

# Question 6
getwd()
df6a <- read.table(file = "week-3-price-data.csv", header = TRUE, sep = ",")
tail(df6a)
str(df6a)
df6b <- read.table(file = "week-3-make-model-data.csv", header = TRUE, sep = ",")
tail(df6b)
str(df6b)
df6c <- merge(x = df6a, y = df6b, by.x = c("ModelNumber"), by.y = c("ModelNumber"))
df6c
#27 observations - yes, this is what I expected.
#Model #23120 doesn't exist in the Model table & is therefore excluded in the results

# Question 7
df7 <- merge(x = df6a, y = df6b, by.x = c("ModelNumber"), by.y = c("ModelNumber"), all.x = TRUE)
df7

# Question 8
df8a <- merge(x = df6a, y = df6b, by.x = c("ModelNumber"), by.y = c("ModelNumber"), all.x = TRUE)
df8b <- subset(df8a, df8a$Year == 2010)
df8b

# Question 9
df9a <- merge(x = df6a, y = df6b, by.x = c("ModelNumber"), by.y = c("ModelNumber"), all.x = TRUE)
df9b <- subset(df9a, df9a$Color == "Red" & df9a$Price > 10000)
df9b

# Question 10
df9a <- merge(x = df6a, y = df6b, by.x = c("ModelNumber"), by.y = c("ModelNumber"), all.x = TRUE)
df9b <- subset(df9a, df9a$Color == "Red" & df9a$Price > 10000)
df9c <- subset(df9b, select = -c(ModelNumber,Color))
df9c

# Question 11
char.count <- function(input11)
{
  nchar(input11)
}
charvec11 <- c("llll", "qqqqqqq", "a", "rr", "pppp", "ee", "ddd")
char.count(charvec11)

# Question 12
char.concat <- function(input12a, input12b)
{
  if (length(input12a) != length(input12b)){
    print ("This is me dying gracefu")
  } else {
    output12 <- paste(input12a, input12b, sep = " ")
    output12
  }
}
charvec12a <- c("Peter","Don","Mickey","Clark","James")
charvec12b <- c("Pan","Juan","Mouse","Kent","Bond")
char.concat(charvec12a, charvec12b)
charvec12c <- c("Bob","Dirk","Patrick","John")
charvec12d <- c("Benson","Murphy","Smith")
char.concat(charvec12c, charvec12d)

# Question 13
require(stringr)
char.sub <- function(input13)
{
  substring <- "([aeiouAEIOU][a-zA-Z0-9][a-zA-Z0-9])"
  str_extract(string = input13, pattern = substring)
  #thelist <- list(str_extract(string = input13, pattern = substring))
  #thelist[is.na(thelist)] <- NULL
  #thelist
  #lapply(thelist, na.rm = TRUE)
}
charvec13a <- c("red", "yellow", "orange", "green", "blue", "purple")
char.sub(charvec13a)

# Question 14
library(lubridate)
vec14a <- c(12, 3, 7, 9)
vec14b <- c(14, 28, 6, 22)
vec14c <- c(1984, 1976, 2009, 2014)
df14 <- data.frame(vec14a, vec14b, vec14c)
df14
vec14d <- c(paste(vec14a, vec14b, vec14c))
vec14d <- mdy(vec14d)
vec14d
df14 <- cbind(df14, vec14d)
df14

# Question 15
library(lubridate)
date15 <- "12-18-2014"
mdy(date15)

# Question 16
date16 <- as.POSIXct("18-12-2014", format = "%d-%m-%Y", tz = "UTC")
date16
as.numeric(format(date16, "%m"))

# Question 17
date17.start <- as.POSIXct("2005-01-01")
date17.end <- as.POSIXct("2014-12-31") 
seq(ymd(date17.start),ymd(date17.end), by = '1 day')
