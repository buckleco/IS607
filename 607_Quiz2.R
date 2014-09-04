# Question 1
num <- c(5,4,23,54,76,23,343,77,5,445,886,76,56,44,22,88,6,5,4,8)
num

# Question 2
char <- as.character(num) 
char

# Question 3
fact <- factor(num)
fact

# Question 4
levels(fact)

# Question 5
q5num <- (3*(num*num))-(4*num)+1
q5num

# Question 6
x1 <- c(1, 1, 1, 1, 1, 1, 1, 1)
x2 <- c(5, 4, 6, 2, 3, 2, 7, 8)
x3 <- c(8, 9, 4, 7, 4, 9, 6, 4)
dfX <- data.frame(x1, x2,x3)
y1 <- c(45.2, 46.9, 31.0, 35.3, 25.0, 43.1, 41.0, 35.1)
dfy <- data.frame(y1)
X <- as.matrix(dfX)
y <- as.matrix(dfy)
X
y
B <- round(solve(t(X)%*%X)%*%t(X)%*%y, digits=6)
B

# Question 7
list1 <- list(vector1 = 1:10, vector2 = 10:20, vector3 = 20:30)
names(list1)
list1$vector2

# Question 8
col1 <- c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j')
col2 <- factor(c("Do", "Re", "Me", "Fa", "Sol", "La", "Ti", "Do", "Re", "Me"))
col3 <- c(1:10)
col4 <- seq(as.Date("2014-09-01"), as.Date("2014-09-10"), by="days")
df <- data.frame(col1, col2, col3, col4)
df

# Question 9
col1[length(col1) + 1] <- 'k'
col2 <- factor(col2, levels = c(levels(col2), "Ah"))
col2[length(col2) + 1] <- "Ah"
col3[length(col3) + 1] <- 11
col4[length(col4) + 1] <- as.Date("2014-09-11")
df <- data.frame(col1, col2, col3, col4)
df

# Question 10
temps <- read.table(file = "temperatures.csv", header = FALSE, sep = ",")
temps

# Question 11
path <- "C:/Users/buckl_000/Documents/R/Scripts/measurements.txt"
meas <- read.table(file = path, header = FALSE)
meas

# Question 12
url <- "http://www.fakewebsiteaddress.com/data/measurementsII.txt"
measII <- read.table(file = url, header = FALSE, sep = "|")
measII

# Question 13
input.amount <- 12
output.amount <- input.amount 
while (i < input.amount)
{
  output.amount = output.amount*i
  i = i + 1
}
output.amount

# Question 14
principal <- 1500
rate <- 0.0324
n <- 12
t <- 6
for (i in 1:t)
{
  amount <- principal * (1 + (rate/n)) ^ (t*n)
}
format(round(amount, 2), nsmall = 2)

# Question 15
vec20 <- 51:70
vec20
sumcount <- 0
n <- 3
counter <- 1
for (i in vec20)
{
  if (counter == n)
  {
    sumcount <- sumcount + vec20[n]
    n <- n + 3
  }
  counter <- counter + 1
}
sumcount

# Question 16
x <- 2
output <- 0
for (i in 1:10)
{
  output <- output + ((x) ^ (i))
}
output

# Question 17
x <- 2
output <- 0
i = 1
while(i <= 10)
{
  output <- output + ((x) ^ (i))
  i = i + 1
}
output

# Question 18
vec1 <- 1:10
vec2 <- 2 ^ vec1
sum(vec2)

# Question 19
vec19 <- seq(from=20, to=50, by=5)
vec19

# Question 20
vec20 <- character(length = 10)
vec20[1:10] <- "example"
vec20

# Question 21
a <- 1
b <- 5
c <- 6
x1 <- (-b + sqrt((b * b) - (4 * a * c))) / (2 * a)
x2 <- (-b - sqrt((b * b) - (4 * a * c))) / (2 * a)
x1
x2