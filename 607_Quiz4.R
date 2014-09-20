#Read in data from file
require(ggplot2)
require(lubridate)

getwd()
df1 <- read.table("movies.tab", sep="\t", header=TRUE, quote="", comment="")
#df1 <- read.table("movies.small.tab", sep="\t", header=TRUE, quote="", comment="")
head(df1)
tail(df1)
length(df1$year)
str(df1)


#Question 1
#I couldn't figure out how to create a column to represent the decades
#so here is a plot simply based on year instead

ggplot(data = df1) + geom_histogram(aes(x = year))

#here is code to build a dataframe with a count of the number of years in a decade
dec.1890s <- length(df1$year[df1$year<1900 & df1$year>1890])
dec.1900s <- length(df1$year[df1$year<1910 & df1$year>=1900])
dec.1910s <- length(df1$year[df1$year<1920 & df1$year>=1910])
dec.1920s <- length(df1$year[df1$year<1930 & df1$year>=1920])
dec.1930s <- length(df1$year[df1$year<1940 & df1$year>=1930])
dec.1940s <- length(df1$year[df1$year<1950 & df1$year>=1940])
dec.1950s <- length(df1$year[df1$year<1960 & df1$year>=1950])
dec.1960s <- length(df1$year[df1$year<1970 & df1$year>=1960])
dec.1970s <- length(df1$year[df1$year<1980 & df1$year>=1970])
dec.1980s <- length(df1$year[df1$year<1990 & df1$year>=1980])
dec.1990s <- length(df1$year[df1$year<2000 & df1$year>=1990])
dec.2000s <- length(df1$year[df1$year<2010 & df1$year>=2000])

decades.vec <- c("1890s","1910s","1910s","1920s","1930s","1940s","1950s","1960s","1970s","1980s","1990s","2000s")
decades.vec

decade.count.vec <- c(dec.1890s,dec.1900s,dec.1910s,dec.1920s,dec.1930s,dec.1940s,dec.1950s,dec.1960s,dec.1970s,dec.1980s,dec.1990s,dec.2000s)
decade.count.vec

decades.df <- data.frame("decades"=decades.vec, "decade count"=decade.count.vec)
decades.df

#this was not useful for plotting though
ggplot(data = decades.df) + geom_histogram(aes(x = decades))


#Question 2

#create a vector of the average ratings by genre
action.rating <- aggregate(rating ~ Action, df1, mean)[2,2]
animation.rating <- aggregate(rating ~ Animation, df1, mean)[2,2]  
comedy.rating <- aggregate(rating ~ Comedy, df1, mean)[2,2]
drama.rating <- aggregate(rating ~ Drama, df1, mean)[2,2]
documentary.rating <- aggregate(rating ~ Documentary, df1, mean)[2,2]  
romance.rating <- aggregate(rating ~ Romance, df1, mean)[2,2]
short.rating <- aggregate(rating ~ Short, df1, mean)[2,2]

av.rating.vec <- c("action"=action.rating,"animation"=animation.rating,"comedy"=comedy.rating,"drama"=drama.rating,"documentary"=documentary.rating,"romance"=romance.rating,"short"=short.rating)
av.rating.vec

#graph average rating by action over time
#decrease in rating over time
action.rating1 <- aggregate(rating ~ Action+year, df1, mean)
action.rating1 <- subset(action.rating1,action.rating1$Action==1)
action.rating1
ggplot(action.rating1, aes(x=year, y=rating)) +geom_line()

#graph average rating by animation over time
animation.rating1 <- aggregate(rating ~ Animation+year, df1, mean)
animation.rating1 <- subset(animation.rating1,animation.rating1$Animation==1)
animation.rating1
ggplot(animation.rating1, aes(x=year, y=rating)) +geom_line()

#graph average rating by comedy over time
comedy.rating1 <- aggregate(rating ~ Comedy+year, df1, mean)
comedy.rating1 <- subset(comedy.rating1,comedy.rating1$Comedy==1)
comedy.rating1
ggplot(comedy.rating1, aes(x=year, y=rating)) +geom_line()

#graph average rating by drama over time
drama.rating1 <- aggregate(rating ~ Drama+year, df1, mean)
drama.rating1 <- subset(drama.rating1,drama.rating1$Drama==1)
drama.rating1
ggplot(drama.rating1, aes(x=year, y=rating)) +geom_line()

#graph average rating by documentary over time
documentary.rating1 <- aggregate(rating ~ Documentary+year, df1, mean)
documentary.rating1 <- subset(documentary.rating1,documentary.rating1$Documentary==1)
documentary.rating1
ggplot(documentary.rating1, aes(x=year, y=rating)) +geom_line()

#graph average rating by romance over time
romance.rating1 <- aggregate(rating ~ Romance+year, df1, mean)
romance.rating1 <- subset(romance.rating1,romance.rating1$Romance==1)
romance.rating1
ggplot(romance.rating1, aes(x=year, y=rating)) +geom_line()

#graph average rating by short over time
short.rating1 <- aggregate(rating ~ Short+year, df1, mean)
short.rating1 <- subset(short.rating1,short.rating1$Short==1)
short.rating1
ggplot(short.rating1, aes(x=year, y=rating)) +geom_line()

#graph overall average rating over time
ggplot(df1, aes(x=year, y=rating)) +geom_line()


#Question 3

#there is no relationship between rating and film length
ggplot(df1, aes(x=rating, y=length)) +geom_point(shape=1) + geom_smooth(method=lm)


#Question 4

#create a vector of the average film length by genre
action.length <- aggregate(length ~ Action, df1, mean)[2,2]
animation.length <- aggregate(length ~ Animation, df1, mean)[2,2]  
comedy.length <- aggregate(length ~ Comedy, df1, mean)[2,2]
drama.length <- aggregate(length ~ Drama, df1, mean)[2,2]
documentary.length <- aggregate(length ~ Documentary, df1, mean)[2,2]  
romance.length <- aggregate(length ~ Romance, df1, mean)[2,2]
short.length <- aggregate(length ~ Short, df1, mean)[2,2]

av.length.name.vec <- c("action","animation","comedy","drama","documentary","romance","short")
#av.length.name.vec <- c("action"=1,"animation"=2,"comedy"=3,"drama"=4,"documentary"=5,"romance"=6,"short"=7)
av.length.vec <- c(action.length,animation.length,comedy.length,drama.length,documentary.length,romance.length,short.length)
av.length.df <- data.frame(av.length.name.vec,av.length.vec)

#ggplot(av.length.df, aes(x=av.length.name.vec, y=av.length.vec)) +geom_line()
ggplot(data=av.length.df)+geom_histogram(aes(x=av.length.name.vec))
ggplot(data=df1)+geom_histogram(aes(x=length))

ggplot(data=df1)+geom_histogram(aes(x=length))
ggplot(df1, aes(y=length, x=1)) + geom_boxplot()

#Question 5

#there is no relationship between rating and film length
ggplot(df1, aes(x=year, y=votes)) +geom_point(shape=1) + geom_smooth(method=lm)
ggplot(df1, aes(x=rating, y=votes)) +geom_point(shape=1) + geom_smooth(method=lm)
ggplot(df1, aes(x=length, y=votes)) +geom_point(shape=1) + geom_smooth(method=lm)
