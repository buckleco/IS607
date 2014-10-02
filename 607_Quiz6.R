#IS 607 - Quiz 6

install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

#Question 1
#bowlPool is a data frame
class(bowlPool)

#Question 2
theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)
#hvalues is a list
class(hvalues)

#Question 3
#the list contains an object for each table
#therefore the number of objects corresponds to the number of tables
#the are 7 tables
length(hvalues)

#Question 4
#use which to select the first table
hvalues4 <- readHTMLTable(theURL,which = 1)
hvalues4
#check that the variable type is a data frame
class(hvalues4)

#Question 5
hvalues5 <- readHTMLTable(theURL,which = 1)
#select only columns 3 & 4 from the table
hvalues5[,c(3,4)]

#Question 6
#put the tables from the following url into a list of objects
theURL6 <- "http://quickfacts.census.gov/qfd/states/36000.html"
hvalues6 <- readHTMLTable(theURL6)
hvalues6

#Question 7
#the list contains an object for each table
#therefore the number of objects corresponds to the number of tables
#the are 5 tables
length(hvalues6)

#Question 8
#I am using Internet Explorer 11
#To view the source I right click the web page and select 'view source'
#I scroll through the code doing a ctrl+F for '<table' to look for tables
